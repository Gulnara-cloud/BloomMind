-- =========================
-- USERS
-- =========================
CREATE TABLE users (
    id            UUID PRIMARY KEY,
    username      VARCHAR(50)  NOT NULL UNIQUE,
    email         VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

-- =========================
-- COURSE
-- =========================
CREATE TABLE course (
    id          UUID PRIMARY KEY,
    title       VARCHAR(255),
    description VARCHAR(1000)
);

-- =========================
-- USER <-> COURSE
-- =========================
CREATE TABLE user_courses (
    user_id   UUID NOT NULL,
    course_id UUID NOT NULL,
    PRIMARY KEY (user_id, course_id),
    CONSTRAINT fk_user_courses_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_user_courses_course
        FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE
);

CREATE INDEX idx_user_courses_user_id ON user_courses(user_id);
CREATE INDEX idx_user_courses_course_id ON user_courses(course_id);

-- =========================
-- SECTION
-- =========================
CREATE TABLE section (
    id        UUID PRIMARY KEY,
    title     VARCHAR(255),
    content   VARCHAR(2000),
    course_id UUID NOT NULL,
    CONSTRAINT fk_section_course
        FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE
);

CREATE INDEX idx_section_course_id ON section(course_id);

CREATE TABLE lecture_content (
    id         UUID PRIMARY KEY,
    section_id UUID NOT NULL,
    title      VARCHAR(255) NOT NULL,
    content    TEXT NOT NULL,
    CONSTRAINT fk_lecture_section
        FOREIGN KEY (section_id)
        REFERENCES section(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_lecture_content_section_id ON lecture_content(section_id);

-- =========================
-- CONVERSATION
-- =========================
CREATE TABLE conversation (
    id         UUID PRIMARY KEY,
    title      VARCHAR(255),
    model_name VARCHAR(255),
    user_id    UUID,
    section_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_conversation_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT fk_conversation_section
        FOREIGN KEY (section_id) REFERENCES section(id) ON DELETE SET NULL
);

CREATE INDEX idx_conversation_user_id ON conversation(user_id);
CREATE INDEX idx_conversation_section_id ON conversation(section_id);

-- =========================
-- MESSAGE
-- =========================
CREATE TABLE message (
    id              BIGSERIAL PRIMARY KEY,
    conversation_id UUID,
    role            VARCHAR(50),
    content         TEXT,
    created_at      TIMESTAMP,
    CONSTRAINT fk_message_conversation
        FOREIGN KEY (conversation_id) REFERENCES conversation(id) ON DELETE CASCADE
);

CREATE INDEX idx_message_conversation_id ON message(conversation_id);

-- =========================
-- USER MEMORY
-- =========================
CREATE TABLE user_memory (
    id         UUID PRIMARY KEY,
    user_id    UUID NOT NULL,
    memory_key VARCHAR(255) NOT NULL,
    value      TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_memory_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_user_memory_user_id ON user_memory(user_id);
CREATE INDEX idx_user_memory_key ON user_memory(memory_key);