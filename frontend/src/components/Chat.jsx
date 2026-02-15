import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import React, { useState, useRef, useEffect, useCallback } from "react";
import "./Chat.css";
import { useNavigate } from "react-router-dom";
import SectionSidebar from "./SectionSidebar";
import SectionContent from "./SectionContent";
import ChatSidebar from "./ChatSidebar";

export default function Chat() {
  const navigate = useNavigate();
// ===== TEMP STEP 1 STATES (UI ONLY) =====
const [sections] = useState([
  { id: "22222222-0001-0000-0000-000000000001", title: "Week 1 - Java Fundamentals" },
  { id: "22222222-0002-0000-0000-000000000002", title: "Week 2 - OOP in Java" },
  { id: "22222222-0003-0000-0000-000000000003", title: "Week 3 - Collections Framework" },
]);

const [activeSectionId, setActiveSectionId] = useState(null);
const [sectionContent, setSectionContent] = useState(
  "### Select a section to see lecture notes"
);

const handleSelectSection = (sectionId) => {
  if (!sectionId) return;

  setActiveSectionId(sectionId);
  setSectionContent("Loading...");
  loadSectionContent(sectionId);
};

const loadSectionContent = async (sectionId) => {
  const token = localStorage.getItem("token");
  if (!token) return;

const courseId = "11111111-1111-1111-1111-111111111111";

  try {
    const res = await fetch(
      `http://localhost:8080/api/courses/${courseId}/sections/${sectionId}`,
      {
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      }
    );

    if (!res.ok) {
      setSectionContent("## Failed to load lecture notes");
      return;
    }

    const data = await res.json();
    const raw = data.lectureNotes || data.content || "";
    const markdown = raw.replace(/\\n/g, "\n");
    setSectionContent(markdown || "## No lecture notes yet");
  } catch (e) {
    setSectionContent("## Network error while loading lecture notes");
  }
};

  // сообщения в правой части
  const [messages, setMessages] = useState([]);
  const [prompt, setPrompt] = useState("");
  const [loading, setLoading] = useState(false);
  const scrollRef = useRef(null);

  // новое – список диалогов для сайдбара
  const [conversations, setConversations] = useState([]);
  const [activeConversationId, setActiveConversationId] = useState(null);

 const loadConversations = useCallback(async () => {
   const token = localStorage.getItem("token");
   if (!token || !activeSectionId) return;

   try {
     const res = await fetch(
       `http://localhost:8080/api/chat/conversations?sectionId=${activeSectionId}`,
       {
         headers: {
           "Content-Type": "application/json",
           Authorization: `Bearer ${token}`,
         },
       }
     );

     if (!res.ok) {
       console.error("Failed to load conversations list", res.status);
       return;
     }

     const data = await res.json();
     setConversations(data || []);

     // если чатов нет — сбрасываем активный чат
     if (!data || data.length === 0) {
       setActiveConversationId(null);
       setMessages([]);
     }
   } catch (e) {
     console.error("Error loading conversations list", e);
   }
 }, [activeSectionId]);

 useEffect(() => {
   loadConversations();
 }, [loadConversations]);

  // клик по существующему диалогу в сайдбаре
  const handleSelectConversation = async (id) => {
    setActiveConversationId(id);
    setMessages([]);

    const token = localStorage.getItem("token");
    if (!token) return;

    try {
      const res = await fetch(
        `http://localhost:8080/api/chat/conversations/${id}`,
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (!res.ok) {
        console.error("Failed to load conversation", res.status);
        return;
      }

      const data = await res.json(); // ConversationDetailDto

      const history =
        (data.messages || []).map((m, index) => ({
          id: m.id ?? index,
          role: m.role.toLowerCase() === "user" ? "user" : "ai",
          text: m.content,
        })) || [];

      setMessages(history);
    } catch (e) {
      console.error("Error loading conversation", e);
    }
  };

  // кнопка "+ New chat" в сайдбаре
  const handleNewConversation = () => {
    setActiveConversationId(null);
    setMessages([]);
  };

  // HandleSend
  const handleSend = async (e) => {
    e.preventDefault();

    // 1) empty input guard
    if (!prompt.trim()) return;

    // 2) section must be selected BEFORE adding user message
    if (!activeSectionId) {
      setMessages((prev) => [
        ...prev,
        { id: Date.now(), role: "ai", text: "Please select a section first." },
      ]);
      return;
    }

    // 3) add user message only when section is selected
    const userMsg = { id: Date.now(), role: "user", text: prompt.trim() };
    setMessages((prev) => [...prev, userMsg]);
    setPrompt("");
    setLoading(true);

    try {
      // 4) auth guard
      const token = localStorage.getItem("token");
      if (!token) {
        setMessages((prev) => [
          ...prev,
          { id: Date.now() + 1, role: "ai", text: "Please login first." },
        ]);
        setLoading(false);
        return;
      }

      // 5) (your existing logic below stays the same)
      const sectionTitle =
        sections.find((s) => s.id === activeSectionId)?.title || "Selected section";

      const hasUsefulNotes =
        sectionContent &&
        !sectionContent.includes("Select a section") &&
        !sectionContent.includes("Loading") &&
        !sectionContent.includes("Failed") &&
        !sectionContent.includes("No lecture notes");

      const notesForPrompt = hasUsefulNotes ? sectionContent : "";

      const messageToSend = notesForPrompt
        ? `You are my tutor. We are working on this section: "${sectionTitle}".\n\nLecture notes:\n${notesForPrompt}\n\nUser question:\n${userMsg.text}`
        : `You are my tutor. We are working on this section: "${sectionTitle}".\n\nUser question:\n${userMsg.text}`;

      const response = await fetch(
        "http://localhost:8080/api/chat/message",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
          body: JSON.stringify({
            message: messageToSend,
            conversationId: activeConversationId,
            sectionId: activeSectionId,
          }),
        }
      );

      if (response.ok) {
        const data = await response.json();

        // если это был самый первый месседж, сохранить conversationId
        if (!activeConversationId && data.conversationId) {
          setActiveConversationId(data.conversationId);
        }

        // ответ ИИ
        setMessages((prev) => [
          ...prev,
          { id: Date.now() + 1, role: "ai", text: data.response },
        ]);

        // обновить список диалогов слева
        await loadConversations();
      } else if (response.status === 401 || response.status === 403) {
        setMessages((prev) => [
          ...prev,
          {
            id: Date.now() + 1,
            role: "ai",
            text: "Unauthorized — please login again.",
          },
        ]);
        localStorage.removeItem("token");
        window.location.href = "/login";
      } else {
        const errorText = await response.text();
        setMessages((prev) => [
          ...prev,
          {
            id: Date.now() + 1,
            role: "ai",
            text: errorText || "Error: AI not available right now.",
          },
        ]);
      }
    } catch (err) {
      console.error("Network error:", err);
      setMessages((prev) => [
        ...prev,
        {
          id: Date.now() + 1,
          role: "ai",
          text: "Network error. Please try again.",
        },
      ]);
    } finally {
      setLoading(false);
      if (scrollRef.current) {
        scrollRef.current.scrollIntoView({ behavior: "smooth" });
      }
    }
  };

  return (
    <div className="tutor-layout">
      {/* LEFT: sections */}
      <div className="panel left">
        <SectionSidebar
          sections={sections}
          activeSectionId={activeSectionId}
          onSelectSection={handleSelectSection}
        />
      </div>

      {/* CENTER: lecture markdown */}
      <div className="panel center">
        <header className="topbar">
          <div className="title">Spring Bloom Project</div>
          <button
            className="logout-btn"
            onClick={() => {
              localStorage.removeItem("token");
              navigate("/login");
            }}
          >
            Logout
          </button>
        </header>
        <SectionContent content={sectionContent} />
      </div>

      {/* CONVERSATIONS PANEL */}
      <div className="panel conversations-panel">
        <div style={{ padding: "12px", fontWeight: 600 }}>Conversations</div>
        <ChatSidebar
                  conversations={conversations}
                  activeConversationId={activeConversationId}
                  onSelectConversation={handleSelectConversation}
                  onNewConversation={handleNewConversation}
                />
      </div>

      {/* RIGHT: chat */}
      <div className="panel right">
        <h2 className="chat-title">AI Assistant</h2>

        <div className="chat-container">
          <div className="messages-container">
            {messages.length === 0 && (
              <div className="empty-chat">
                Select a section and ask your first question 👇
              </div>
            )}
            {messages
              .filter(msg => {
                const t = (msg.text || "").trimStart();
                return !(
                  t.startsWith("You are my tutor.") ||
                  (t.includes("Lecture notes:") && t.includes("User question:"))
                );
              })
              .map((msg, i) => (
                <div key={i} className={`message ${msg.role}`}>
                  <ReactMarkdown remarkPlugins={[remarkGfm]}>
                    {msg.text}
                  </ReactMarkdown>
                </div>
              ))}
            <div ref={scrollRef} />
          </div>

          <form className="input-row" onSubmit={handleSend}>
            <input
              type="text"
              placeholder="Type your question about this section..."
              value={prompt}
              onChange={(e) => setPrompt(e.target.value)}
              disabled={loading || !activeSectionId}
            />
            <button type="submit" disabled={loading || !activeSectionId || !prompt.trim()}>
              {loading ? "..." : "Send"}
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}