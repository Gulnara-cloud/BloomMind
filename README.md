# BloomMind

BloomMind is a full-stack AI-powered learning platform designed to support interactive education experiences with persistent conversation history and secure user authentication.

The system provides scalable backend architecture with JWT-based security, structured data persistence, and AI-assisted chat functionality.

---

##  Key Features

- Secure user registration and authentication (JWT-based)
- Encrypted password storage
- AI-powered chat integration (Gemini API)
- Persistent conversations and message history (PostgreSQL)
- Role-based request handling with Spring Security
- RESTful API design
- CORS configuration for frontend-backend communication

---

##  Architecture

The backend follows a layered architecture pattern:

- Controller Layer – Handles HTTP requests and responses
- Service Layer – Business logic and AI integration
- Repository Layer – Data access using Spring Data JPA
- DTO-based request/response mapping
- Stateless authentication with JWT

---

##  Tech Stack

### Backend
- Java 17
- Spring Boot 3
- Spring Security
- Spring Data JPA
- PostgreSQL
- Maven

### Frontend
- React 18
- React Router DOM
- Fetch API
- CSS

---

##  Core Functionality

- Store and retrieve user conversations
- Associate chat sessions with authenticated users
- Continue previous AI conversations
- Maintain clean separation of concerns
- Scalable REST API design
