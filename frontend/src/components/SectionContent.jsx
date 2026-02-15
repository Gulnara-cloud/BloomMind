import React from "react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";

function SectionContent({ content }) {
  if (!content) {
    return (
      <div className="section-content section-content--empty">
        Select a section to see lecture notes.
      </div>
    );
  }

  return (
    <div className="section-content">
      <ReactMarkdown remarkPlugins={[remarkGfm]}>
        {content}
      </ReactMarkdown>
    </div>
  );
}

export default SectionContent;
