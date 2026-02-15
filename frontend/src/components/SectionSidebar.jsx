import React from "react";

export default function SectionSidebar({ sections, activeSectionId, onSelectSection }) {
  return (
    <div className="sections-sidebar">
      <div className="sections-title">Sections</div>

      <div className="sections-list">
        {sections.map((s) => (
          <button
            key={s.id}
            className={`section-item ${activeSectionId === s.id ? "active" : ""}`}
            onClick={() => onSelectSection(s.id)}
            type="button"
          >
            {s.title || `Section ${String(s.id).slice(0, 6)}`}
          </button>
        ))}
      </div>
    </div>
  );
}
