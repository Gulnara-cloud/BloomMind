-- WEEK 1
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0001-0000-0000-000000000001',
  '22222222-0001-0000-0000-000000000001',
  'Week 1 - Java Fundamentals',
'# Java Fundamentals

## Overview
Java is a platform-independent, object-oriented programming language.
It runs on the JVM and follows the principle: Write Once, Run Anywhere.

## JVM, JRE, JDK
- JVM executes compiled bytecode
- JRE provides runtime environment
- JDK provides development tools

## Data Types
Primitive: int, double, boolean, char
Reference: String, Arrays, Objects

## Control Flow
if/else statements
switch
loops: for, while, do-while

## Methods
Reusable blocks of logic.
Methods improve readability and modularity.

## Example
int x = 10;
if (x > 5) {
    System.out.println("Hello Java");
}

## Extra notes
Java source files are compiled into bytecode (.class).
The JVM provides garbage collection for memory management.
Use meaningful variable names and consistent formatting.
Prefer small methods that do one thing.
Practice by writing tiny programs daily.

## Practice
1. Create a simple program that prints numbers from 1 to 10.
2. Write a method that returns the sum of two integers.
3. Create a class with two fields and print their values.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 2
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0002-0000-0000-000000000002',
  '22222222-0002-0000-0000-000000000002',
  'Week 2 - OOP in Java',
'# OOP in Java

## Core Principles
Encapsulation - hide internal state
Inheritance - reuse behavior
Polymorphism - multiple implementations
Abstraction - hide complexity

## Class Structure
Fields define state.
Methods define behavior.

## Example
class Animal {
    void sound() {}
}

## Benefits
Modular design
Cleaner architecture
Better maintainability

## Extra notes
Encapsulation is usually done with private fields + getters/setters.
Inheritance should be used carefully to avoid tight coupling.
Polymorphism often appears via interfaces and overridden methods.
Abstraction helps you focus on what an object does, not how.
Good OOP reduces duplication and improves testing.

## Practice
1. Create a class with private fields and public getters/setters.
2. Implement inheritance between two classes.
3. Create an interface and implement it in two classes.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 3
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0003-0000-0000-000000000003',
  '22222222-0003-0000-0000-000000000003',
  'Week 3 - Collections Framework',
'# Collections Framework

## Core Interfaces
List - ordered collection
Set - unique values
Map - key-value pairs

## Common Implementations
ArrayList
LinkedList
HashSet
HashMap

## When to Use
Use List when order matters.
Use Set when uniqueness matters.
Use Map for fast key lookup.

## Example
List<String> list = new ArrayList<>();
list.add("Java");

## Extra notes
ArrayList is fast for random access, slower for middle inserts.
LinkedList is faster for inserts/removes, slower for indexing.
HashSet/HashMap are fast on average but do not preserve order.
Use TreeMap/TreeSet when you need sorted data.
Always consider equals() and hashCode() for keys in maps.

## Practice
1. Create a List of strings and print them using a loop.
2. Store unique values using a Set.
3. Create a Map and retrieve a value by key.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 4
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0004-0000-0000-000000000004',
  '22222222-0004-0000-0000-000000000004',
  'Week 4 - Exceptions & Generics',
'# Exceptions & Generics

## Exceptions
Checked - must be handled
Unchecked - runtime exceptions

## try/catch
Used to handle runtime errors safely.

## Generics
Provide type safety at compile time.

## Example
try {
    int x = 10 / 0;
} catch (Exception e) {
    System.out.println("Error");
}

List<String> names = new ArrayList<>();

## Extra notes
Use specific exceptions instead of catching Exception everywhere.
Create custom exceptions for domain errors (e.g., NotFoundException).
Prefer throwing exceptions when you cannot safely continue.
Generics reduce casting and prevent ClassCastException.
Wildcards (? extends / ? super) help with flexible APIs.

## Practice
1. Write a try/catch block handling division by zero.
2. Create a custom RuntimeException.
3. Use a generic List with a specific type.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 5
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0005-0000-0000-000000000005',
  '22222222-0005-0000-0000-000000000005',
  'Week 5 - Streams & Lambdas',
'# Streams & Lambdas

## Streams API
filter - select elements
map - transform elements
reduce - aggregate results

## Lambda Expressions
Short syntax for functional interfaces.

## Example
list.stream()
    .filter(x -> x > 5)
    .forEach(System.out::println);

## Benefits
Cleaner functional style
Less boilerplate code

## Extra notes
Streams are usually used for reading/transforming collections.
Avoid using streams for heavy side effects (prefer forEach carefully).
Use collect(Collectors.toList()) to build new lists from streams.
Method references (Class::method) improve readability.
Parallel streams can be useful but require performance testing.

## Practice
1. Use stream().filter() to select even numbers.
2. Transform a list using map().
3. Use reduce() to calculate a sum.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 6
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0006-0000-0000-000000000006',
  '22222222-0006-0000-0000-000000000006',
  'Week 6 - Spring Boot Basics',
'# Spring Boot Basics

## Core Concepts
Auto Configuration
Dependency Injection
@SpringBootApplication

## REST Controllers
Use @RestController to expose endpoints.

## Architecture
Controller -> Service -> Repository

## Benefits
Rapid development
Embedded server
Minimal configuration

## Extra notes
Spring manages objects as beans inside the ApplicationContext.
Constructor injection is preferred for required dependencies.
Use application.yml to manage configuration per environment.
Use profiles (dev/prod) to separate settings cleanly.
Keep controllers thin and move logic into services.

## Practice
1. Create a simple REST controller.
2. Implement constructor injection.
3. Create a service layer method.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 7
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0007-0000-0000-000000000007',
  '22222222-0007-0000-0000-000000000007',
  'Week 7 - REST API & DTOs',
'# REST API & DTOs

## REST Principles
Stateless communication
Use HTTP methods properly
Exchange JSON data

## HTTP Methods
GET - read
POST - create
PUT - update
DELETE – remove

## DTO Pattern
Separate internal entity from API layer.
Prevents exposing database structure.

## Extra notes
Use proper status codes: 200, 201, 204, 400, 401, 404, 500.
DTOs help control which fields are returned to the client.
Validation (@Valid) often happens at the DTO layer.
Use consistent URL naming: /api/courses/{id}/sections.
Document endpoints with Swagger/OpenAPI when possible.

## Practice
1. Create a DTO for a simple entity.
2. Write a GET endpoint returning JSON.
3. Return proper HTTP status codes.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 8
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0008-0000-0000-000000000008',
  '22222222-0008-0000-0000-000000000008',
  'Week 8 - JPA & Database',
'# JPA & Database

## JPA Concepts
@Entity
@Repository
@OneToMany
@ManyToOne

## Hibernate
ORM framework mapping Java objects to tables.

## Repository Pattern
Provides CRUD operations automatically.

## Example
public interface UserRepository extends JpaRepository<User, Long> {}

## Extra notes
Use lazy loading carefully to avoid N+1 query problems.
Prefer DTO projections for heavy read endpoints.
Always define indexes for frequently searched columns.
Use Flyway migrations to track schema changes safely.
Map relationships carefully to avoid infinite JSON recursion.

## Practice
1. Create a simple JPA entity.
2. Create a repository interface.
3. Save and retrieve an entity from the database.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 9
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0009-0000-0000-000000000009',
  '22222222-0009-0000-0000-000000000009',
  'Week 9 - Security & JWT',
'# Security & JWT

## Spring Security
Handles authentication and authorization.

## JWT
Stateless token-based authentication.
Sent in Authorization header.

## Flow
Login → Generate token → Send with requests

## Benefits
No server session storage
Scalable authentication

## Extra notes
JWT should be short-lived and refreshed when needed.
Store JWT securely (avoid unsafe storage on public clients).
Use roles/authorities to protect endpoints by permission.
Always validate token signature and expiration.
Return 401 for unauthenticated and 403 for forbidden access.

## Practice
1. Configure basic Spring Security.
2. Generate a simple JWT token.
3. Protect an endpoint with authentication.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 10
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0010-0000-0000-000000000010',
  '22222222-0010-0000-0000-000000000010',
  'Week 10 - AI Integration',
'# AI Integration

## External APIs
Communicate via HTTP clients.

## JSON Processing
Serialize and deserialize data.

## Use Case
Integrating OpenAI or Gemini APIs.

## Flow
Send prompt -> Receive response -> Parse JSON -> Return result

## Extra notes
Use timeouts and retries to avoid hanging requests.
Log request/response metadata without exposing secrets.
Never hardcode API keys; use env variables or config.
Sanitize user input if you store prompts for history.
Handle rate limits (429) with backoff and user-friendly messages.

## Practice
1. Call a public REST API using an HTTP client.
2. Parse a JSON response.
3. Handle API error responses.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 11
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0011-0000-0000-000000000011',
  '22222222-0011-0000-0000-000000000011',
  'Week 11 - Testing',
'# Testing

## Types
Unit Testing
Integration Testing

## Tools
JUnit
Mockito

## Why Testing
Prevents regressions
Improves reliability
Supports refactoring

## Extra notes
Unit tests should be fast and not depend on external systems.
Use mocks for repositories/external clients in unit tests.
Integration tests verify Spring context and real DB behavior.
Name tests clearly: shouldReturnX_whenConditionY.
Aim for coverage of critical business logic, not only getters/setters.

## Practice
1. Write a unit test for a service method.
2. Mock a repository using Mockito.
3. Write an integration test with Spring Boot.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 12
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0012-0000-0000-000000000012',
  '22222222-0012-0000-0000-000000000012',
  'Week 12 - Clean Code',
'# Clean Code

## Principles
Readable code
Small methods
Meaningful naming

## SOLID
Single Responsibility
Open/Closed
Liskov Substitution
Interface Segregation
Dependency Inversion

## Goal
Maintainable and scalable codebase

## Extra notes
Prefer clear code over clever code.
Extract constants for repeated values and magic numbers.
Keep classes focused and avoid “god objects”.
Write comments only when code cannot explain itself.
Refactor regularly to keep complexity under control.

## Practice
1. Refactor a long method into smaller ones.
2. Rename unclear variables to meaningful names.
3. Apply Single Responsibility Principle.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 13
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0013-0000-0000-000000000013',
  '22222222-0013-0000-0000-000000000013',
  'Week 13 - Design Patterns',
'# Design Patterns

## Creational
Factory
Singleton

## Structural
Adapter

## Behavioral
Strategy

## Purpose
Reusable solutions to common design problems.

## Extra notes
Patterns are tools, not rules—use when they simplify design.
Factory helps when object creation logic becomes complex.
Adapter helps integrate incompatible interfaces cleanly.
Strategy helps switch algorithms without if/else chains.
Document pattern usage in code for maintainers.

## Practice
1. Implement a simple Factory pattern.
2. Create a Strategy interface with two implementations.
3. Refactor if/else logic using a pattern.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 14
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0014-0000-0000-000000000014',
  '22222222-0014-0000-0000-000000000014',
  'Week 14 - Transactions',
'# Transactions

## ACID
Atomicity
Consistency
Isolation
Durability

## Spring
@Transactional annotation ensures data integrity.

## Use Case
Multiple DB operations in single logical unit.

## Extra notes
Rollback typically happens on unchecked exceptions by default.
Keep transactions short to reduce lock contention.
Be careful with calling transactional methods inside same class.
Isolation level affects concurrency and performance.
Use readOnly transactions for read queries when applicable.

## Practice
1. Annotate a method with @Transactional.
2. Simulate a rollback scenario.
3. Test transaction behavior.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 15
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0015-0000-0000-000000000015',
  '22222222-0015-0000-0000-000000000015',
  'Week 15 - Validation',
'# Validation

## Bean Validation
@NotNull
@Size
@Email

## Handling Errors
@Valid annotation
BindingResult

## Purpose
Ensure correct input before processing.

## Extra notes
Validate at API boundaries before business logic runs.
Return structured error responses for the frontend.
Use custom messages to make errors user-friendly.
Consider global exception handling with @ControllerAdvice.
Validate both request body and path/query parameters.

## Practice
1. Add validation annotations to a DTO.
2. Handle validation errors globally.
3. Return structured error responses.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 16
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0016-0000-0000-000000000016',
  '22222222-0016-0000-0000-000000000016',
  'Week 16 - Pagination',
'# Pagination

## Concepts
Page
Pageable
Sorting

## Example
Page<User> users = repository.findAll(pageable);

## Benefits
Efficient large dataset handling.

## Extra notes
Always paginate lists that can grow large.
Expose sorting options (by createdAt, title, etc.).
Use default page size to prevent heavy queries.
Return page metadata: totalElements, totalPages, currentPage.
Avoid offset pagination for very large datasets if performance drops.

## Practice
1. Implement pagination in a repository method.
2. Add sorting to pageable query.
3. Return page metadata in API response.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 17
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0017-0000-0000-000000000017',
  '22222222-0017-0000-0000-000000000017',
  'Week 17 - Caching',
'# Caching

## Why
Improve performance
Reduce database load

## Spring
@EnableCaching
@Cacheable

## Redis
In-memory key-value store for fast access.

## Extra notes
Cache keys must be stable and unique for the query.
Define TTL to avoid stale data staying forever.
Invalidate cache when data changes (evict on update/delete).
Cache is best for frequently read and rarely changed data.
Measure performance before and after caching to confirm benefit.

## Practice
1. Add @Cacheable to a method.
2. Configure Redis locally.
3. Invalidate cache on update.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 18
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0018-0000-0000-000000000018',
  '22222222-0018-0000-0000-000000000018',
  'Week 18 - Docker',
'# Docker

## Containers
Isolated environments for applications.

## docker-compose
Define multi-container systems.

## Commands
docker-compose up
docker-compose down

## Benefits
Consistency across environments.

## Extra notes
Use Dockerfiles to package backend and frontend reliably.
Separate services: app, database, redis, etc.
Use volumes for persistent database storage.
Use .env files for configuration values and secrets.
Keep images small by using multi-stage builds when needed.

## Practice
1. Create a Dockerfile for your backend.
2. Write a docker-compose.yml with database.
3. Run the project inside a container.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 19
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0019-0000-0000-000000000019',
  '22222222-0019-0000-0000-000000000019',
  'Week 19 - Deployment',
'# Deployment

## Concepts
CI/CD pipelines
Environment configuration
Docker images

## Platforms
AWS
Render
Heroku

## Goal
Automated and reliable releases.

## Extra notes
Use separate configs for dev/stage/prod environments.
Store secrets securely (never commit them to Git).
Automate tests in CI before deploying.
Use health checks to detect broken deployments early.
Add logs/monitoring to understand issues in production.

## Practice
1. Build a Docker image of your app.
2. Deploy to a cloud platform.
3. Configure environment variables.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;


-- WEEK 20
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0020-0000-0000-000000000020',
  '22222222-0020-0000-0000-000000000020',
  'Week 20 - System Design',
'# System Design

## Topics
Scalability
Load Balancing
Caching
Microservices

## Concepts
Horizontal scaling
Database sharding
Fault tolerance

## Goal
Design systems that handle high traffic efficiently.

## Extra notes
Start with requirements: users, traffic, latency, data size.
Design APIs and data models before choosing infrastructure.
Identify bottlenecks: database, network, CPU, third-party services.
Use caching where it reduces expensive repeated work.
Prefer simple designs first, then evolve when needed.

## Practice
1. Design a scalable REST API architecture.
2. Explain horizontal scaling.
3. Draw a simple high-level system diagram.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;