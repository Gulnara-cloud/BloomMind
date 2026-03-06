-- WEEK 1
INSERT INTO lecture_content (id, section_id, title, content)
VALUES (
  '33333333-0001-0000-0000-000000000001',
  '22222222-0001-0000-0000-000000000001',
  'Topic 1',
'# Java Fundamentals

## What you will learn
You will understand how Java runs, how to write basic programs, and how to think in clear steps using variables, conditions, loops, and methods.

## Java runtime: JVM, JRE, JDK
- JDK: tools for development (compiler, debugger)
- JRE: runtime to run Java apps
- JVM: executes bytecode (.class)

## Data types
Primitive types store values directly:
- int, long, double, boolean, char

Reference types store links to objects:
- String, arrays, custom classes

## Control flow
- if/else for decisions
- switch for multiple branches
- loops: for, while, do-while

## Methods
Methods are reusable blocks of logic.
Good methods have one responsibility and clear names.

## Mini example
int x = 10;
if (x > 5) {
    System.out.println("Hello Java");
}

## Common mistakes
- Mixing int and double without understanding casting
- Using == for String comparison instead of equals()
- Writing very long methods without structure

## Practice
1. Print numbers from 1 to 10 using a loop.
2. Write a method sum(int a, int b) that returns a + b.
3. Create a class Person with name and age and print them.'
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
  'Topic 2',
'# OOP in Java

## What you will learn
You will model real concepts using classes, build clean boundaries, and understand why OOP improves maintainability.

## Core principles
Encapsulation
- Keep fields private
- Expose behavior through methods (getters, setters, domain methods)

Inheritance
- Reuse behavior from a parent class
- Use carefully to avoid tight coupling

Polymorphism
- One interface, many implementations
- Enables clean extension without rewriting code

Abstraction
- Focus on what an object does, not internal details

## Class structure
- Fields define state
- Methods define behavior

## Example
class Animal {
    void sound() {}
}

## Good practices
- Prefer composition over inheritance when possible
- Program to interfaces
- Keep constructors meaningful, avoid too many parameters

## Practice
1. Create a User class with private fields and public getters.
2. Create Animal and Dog where Dog extends Animal.
3. Create interface Payment and implement CardPayment and CashPayment.'
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
  'Topic 3',
'# Collections Framework

## What you will learn
You will choose correct data structures and understand performance tradeoffs.

## Core interfaces
List
- Ordered collection, allows duplicates

Set
- Unique values, no duplicates

Map
- Key-value pairs, fast lookup by key

## Common implementations
- ArrayList: fast access by index, slower middle inserts
- LinkedList: faster inserts/removes, slower random access
- HashSet: fast uniqueness checks, no order
- HashMap: fast key lookup, no order

## Choosing the right one
- Use List when order matters and duplicates are allowed
- Use Set when you need uniqueness
- Use Map when you need quick lookup by key

## Example
List<String> list = new ArrayList<>();
list.add("Java");

## Key detail
For Map keys, equals() and hashCode() must be correct.

## Practice
1. Store names in a List and print them.
2. Store unique cities in a Set.
3. Create a Map< String, Integer > and read value by key.'
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
  'Topic 4',
'# Exceptions and Generics

## What you will learn
You will handle failures safely and write type-safe collections.

## Exceptions
Checked exceptions
- Must be handled or declared with throws

Unchecked exceptions
- Runtime errors (NullPointerException, IllegalArgumentException)

## try/catch
Use try/catch to handle error scenarios and keep program stable.

## Example
try {
    int x = 10 / 0;
} catch (ArithmeticException e) {
    System.out.println("Division error");
}

## Generics
Generics add compile-time type safety.

Example:
List<String> names = new ArrayList<>();

## Best practices
- Catch specific exceptions, not Exception everywhere
- Create domain exceptions like ResourceNotFoundException
- Do not hide errors silently, log meaningful messages
- Use generics to avoid ClassCastException

## Practice
1. Handle division by zero with a specific catch.
2. Create custom exception NotFoundException extends RuntimeException.
3. Create List<Integer> and print sum of all values.'
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
  'Topic 5',
'# Streams and Lambdas

## What you will learn
You will transform collections using functional style with readable pipelines.

## Lambda expressions
Short syntax for functional interfaces.
Example:
x -> x * 2

## Streams API
Common operations:
- filter: keep matching elements
- map: transform elements
- reduce: aggregate to one result
- collect: build a new collection

## Example
list.stream()
    .filter(x -> x > 5)
    .forEach(System.out::println);

## Rules of thumb
- Use streams for data transformations, not for heavy side effects
- Keep pipelines short and readable
- Prefer method references when clear

## Common mistakes
- Doing complex logic inside one lambda
- Using parallel streams without measuring performance

## Practice
1. Filter even numbers from a list.
2. Map list of names to uppercase.
3. Reduce list of integers to total sum.'
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
  'Topic 6',
'# Spring Boot Basics

## What you will learn
You will build a basic Spring Boot application with clean layers and dependency injection.

## Core concepts
- Auto-configuration reduces manual setup
- Dependency Injection lets Spring create and wire objects
- @SpringBootApplication bootstraps the app

## REST controllers
Use @RestController to return JSON.
Use @RequestMapping and @GetMapping to define endpoints.

## Layered architecture
Controller
- Handles HTTP request and response

Service
- Business logic

Repository
- Data access

## Good practices
- Prefer constructor injection (with @RequiredArgsConstructor)
- Keep controllers thin
- Put validation at API boundary
- Use application.yml for configuration

## Practice
1. Create controller GET /api/health returning "OK".
2. Create service method getGreeting(name).
3. Wire controller -> service using constructor injection.'
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
  'Topic 7',
'# REST API and DTOs

## What you will learn
You will design clean endpoints, return correct responses, and protect internal entities using DTOs.

## REST basics
- Stateless requests
- Clear resource URLs
- Correct HTTP methods

## HTTP methods
- GET: read
- POST: create
- PUT: update
- DELETE: remove

## Status codes
- 200 OK
- 201 Created
- 204 No Content
- 400 Bad Request
- 401 Unauthorized
- 403 Forbidden
- 404 Not Found

## DTO pattern
DTO separates API model from database model.
It prevents exposing internal fields and supports stable API contracts.

## Best practices
- Use consistent URL naming: /api/courses/{courseId}/sections
- Validate input with @Valid
- Return errors in a structured format

## Practice
1. Create DTO for Section with id and title.
2. Create GET endpoint returning list of DTOs.
3. Add error handling for missing resources.'
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
  'Topic 8',
'# JPA and Database

## What you will learn
You will map Java entities to tables and use repositories for CRUD operations.

## Key JPA annotations
- @Entity: marks a database entity
- @Id: primary key
- @ManyToOne, @OneToMany: relations
- @JoinColumn: foreign key mapping

## Hibernate
Hibernate is the ORM that implements JPA in most Spring projects.

## Repository pattern
Spring Data repositories provide CRUD with minimal code.

Example:
public interface UserRepository extends JpaRepository<User, UUID> {}

## Common problems and solutions
- N+1 queries: use fetch join or DTO projections
- Lazy loading issues: load required relations in service layer
- Infinite JSON recursion: use DTOs and careful mapping

## Practice
1. Create Course entity with id and title.
2. Create Section entity with ManyToOne Course.
3. Save and read sections for a course.'
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
  'Topic 9',
'# Security and JWT

## What you will learn
You will secure endpoints with Spring Security and understand JWT authentication flow.

## Authentication vs Authorization
Authentication: who the user is
Authorization: what the user can access

## JWT basics
JWT is a signed token sent in Authorization header.
Format: Bearer <token>

## Typical flow
1. Login with credentials
2. Server generates JWT
3. Client sends JWT with each request
4. Server validates signature and expiration

## Best practices
- Use short-lived tokens
- Never store secrets in code
- Return 401 when token is missing or invalid
- Return 403 when user lacks permission
- Log minimal security info, do not log token value

## Practice
1. Add security config that protects /api/*
2. Implement login endpoint that returns token
3. Protect section endpoints with authentication.'
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
  'Topic 10',
'# AI Integration

## What you will learn
You will integrate an external AI API and build a reliable request pipeline.

## Core steps
1. Build request payload (prompt, options)
2. Send HTTP request via client (WebClient or RestTemplate)
3. Parse JSON response
4. Return structured result to frontend
5. Save conversation history if required

## Reliability requirements
- Timeouts to avoid hanging calls
- Retries for temporary failures
- Proper error handling for 400, 401, 429, 500
- Safe logging without secrets

## Security
- Store API key in environment variables
- Never commit keys to Git
- Validate user input and sanitize stored prompts

## Practice
1. Call a public API and parse JSON.
2. Add timeout and graceful error response.
3. Implement simple DTO for AI response.'
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
  'Topic 11',
'# Testing

## What you will learn
You will write reliable tests that protect your code from regressions.

## Types of tests
Unit tests
- Test business logic in isolation
- Use mocks for repositories and external clients

Integration tests
- Start Spring context and validate real wiring
- Use test database or containers if needed

## Tools
- JUnit: test framework
- Mockito: mocking library
- Spring Boot Test: integration testing support

## Test structure
- Arrange: prepare data and mocks
- Act: call method
- Assert: verify result

## Good practices
- Test behavior, not implementation details
- Use clear method names: shouldReturnX_whenY
- Keep tests fast and deterministic

## Practice
1. Unit test for SectionService.
2. Mock SectionRepository with Mockito.
3. Integration test for SectionController GET endpoint.'
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
  'Topic 12',
'# Clean Code

## What you will learn
You will write code that stays readable and maintainable as the project grows.

## Principles
- Clear naming for variables, methods, classes
- Small functions with one responsibility
- Reduce duplication
- Prefer clarity over cleverness

## SOLID overview
- Single Responsibility
- Open/Closed
- Liskov Substitution
- Interface Segregation
- Dependency Inversion

## Practical checklist
- Avoid magic numbers, use constants
- Keep controllers thin
- Put business rules into services
- Create DTOs for API boundaries
- Use meaningful exceptions and error responses

## Practice
1. Refactor one long method into 3 smaller methods.
2. Rename variables that hide meaning.
3. Remove duplication by extracting helper method.'
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
  'Topic 13',
'# Design Patterns

## What you will learn
You will recognize common design problems and apply patterns with purpose.

## Creational patterns
Factory
- Centralizes object creation
- Useful when creation logic becomes complex

Singleton
- One instance across application
- Use carefully, can make testing harder

## Structural patterns
Adapter
- Makes incompatible interfaces work together

## Behavioral patterns
Strategy
- Switch behavior without large if/else chains

## Practical advice
- Patterns are tools, not rules
- Start simple, apply pattern when code repeats
- Document why a pattern exists in your codebase

## Practice
1. Implement Factory for creating NotificationService.
2. Create Strategy for sorting sections by title or by id.
3. Use Adapter to wrap a third-party API client.'
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
  'Topic 14',
'# Transactions

## What you will learn
You will keep data consistent when multiple database operations must succeed together.

## ACID
Atomicity: all steps succeed or none
Consistency: rules remain valid
Isolation: concurrent operations do not break each other
Durability: committed data stays saved

## Spring transactions
Use @Transactional for operations that must be atomic.

## Important details
- Default rollback for unchecked exceptions
- Keep transactions short
- Avoid calling transactional method inside same class (proxy limitation)
- Use readOnly = true for read endpoints when possible

## Practice
1. Wrap createCourseWithSections in @Transactional.
2. Throw RuntimeException in the middle and verify rollback.
3. Add readOnly transaction for section list endpoint.'
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
  'Topic 15',
'# Validation

## What you will learn
You will validate user input and return clear error messages to the client.

## Bean Validation annotations
- @NotNull
- @Size(min, max)
- @Email
- @Min, @Max

## Where to validate
Validate at API boundary (DTO layer) before business logic runs.

## Error handling
Use @Valid on request body.
Use global exception handler (@ControllerAdvice) for consistent responses.

## Good practices
- Return field-level errors for frontend
- Use readable messages
- Validate path and query parameters too
- Do not rely on frontend validation only

## Practice
1. Add validation to RegisterRequest DTO.
2. Return structured error response with fields.
3. Add validation for pagination parameters.'
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
  'Topic 16',
'# Pagination

## What you will learn
You will return large lists efficiently and keep endpoints fast.

## Core concepts
- Page: current slice of results
- Pageable: page number, size, sorting
- Sorting: order results by fields

## Spring Data example
Page<User> users = repository.findAll(pageable);

## API response recommendation
Return:
- items
- pageNumber
- pageSize
- totalElements
- totalPages

## Best practices
- Always paginate lists that can grow
- Set default and max page size
- Add sorting options (createdAt, title)
- For huge data, consider keyset pagination

## Practice
1. Add pageable to section list endpoint.
2. Add sorting by title.
3. Return page metadata to frontend.'
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
  'Topic 17',
'# Caching

## What you will learn
You will reduce database load and improve response times with caching.

## Why cache
- Faster responses
- Lower database pressure
- Better scalability

## Spring caching
- @EnableCaching enables caching
- @Cacheable caches method results
- @CacheEvict removes stale cache on updates

## Redis overview
Redis is an in-memory key-value store often used as cache storage.

## Key rules
- Cache only data that is frequently read and rarely changed
- Use clear cache keys
- Define TTL so cache does not stay forever
- Evict cache when data changes

## Practice
1. Cache getSectionsByCourseId.
2. Configure Redis locally in docker-compose.
3. Evict cache when a section is updated.'
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
  'Topic 18',
'# Docker

## What you will learn
You will run your app consistently across machines using containers.

## Containers
A container is an isolated environment that includes dependencies and runtime.

## Dockerfile
Defines how to build an image for backend or frontend.

## docker-compose
Runs multiple services together:
- backend
- database
- redis

## Best practices
- Use .env for secrets and config
- Use volumes for database persistence
- Keep images small (multi-stage build if needed)
- Expose only required ports

## Practice
1. Create Dockerfile for Spring Boot app.
2. Create docker-compose with postgres.
3. Start project with docker-compose up.'
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
  'Topic 19',
'# Deployment

## What you will learn
You will deliver your app to production with stable configuration and automated checks.

## Key concepts
- CI: run tests automatically on each push
- CD: deploy automatically after successful checks
- Environment config: dev, stage, prod separation

## Deployment steps
1. Build artifact (jar, frontend bundle)
2. Run tests in CI
3. Build Docker image
4. Deploy to platform
5. Monitor logs and health

## Platforms
- AWS
- Render
- Heroku (limited for some use cases)

## Best practices
- Store secrets securely (platform env vars)
- Add health endpoint
- Use logging and monitoring
- Rollback plan for broken releases

## Practice
1. Add GitHub Actions workflow running tests.
2. Deploy backend to a cloud platform.
3. Configure environment variables in production.'
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
  'Topic 20',
'# System Design

## What you will learn
You will design systems that scale and stay reliable under growth.

## Start with requirements
- Users and traffic
- Latency expectations
- Data size and storage
- Reliability goals

## Common building blocks
- Load balancer
- Application servers
- Database (with replication)
- Cache for hot data
- Message queue for async tasks

## Scalability
Horizontal scaling: add more servers
Vertical scaling: bigger server

## Reliability
- Timeouts and retries
- Circuit breakers for external dependencies
- Graceful degradation
- Monitoring and alerting

## Practice
1. Design REST API for courses and sections at scale.
2. Explain where caching helps most.
3. Draw high-level architecture: client, API, DB, cache.'
)
ON CONFLICT (id) DO UPDATE
SET section_id = EXCLUDED.section_id,
    title      = EXCLUDED.title,
    content    = EXCLUDED.content;