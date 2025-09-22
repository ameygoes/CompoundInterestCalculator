# MVP System Design Document (with MCP Server Architecture)

## 1. MVP Scope

For the Minimum Viable Product (MVP), we will implement a single end-to-end flow for AI-powered job search email automation, delivered as an MCP (Model Context Protocol) server. All core functionalities will be exposed through API endpoints (REST or MCP endpoints), enabling integration with MCP clients or other systems. The MVP will support Gmail integration only, with a simple CLI or API client for demonstration.

## 2. Core Components for MVP

### 2.1 MCP Server Layer
- Exposes all functionalities via MCP endpoints (and/or REST API endpoints)
- Handles request routing, authentication, and response formatting
- Provides endpoints for:
  - OAuth2 authentication initiation and callback
  - Email draft generation (AI-powered)
  - Email sending
  - Campaign/job context management
  - Token management

### 2.2 Email Service Layer
- Gmail API integration using OAuth2
- Basic email operations (send, read)
- Token management and storage

### 2.3 AI Email Generation
- Integration with an LLM API (e.g., OpenAI)
- Email template management
- Context-aware email generation

### 2.4 Core Business Logic
- Job application workflow management
- Basic email campaign tracking
- Simple state management

## 3. MVP End-to-End Flow (as MCP Server)

### 3.1 Authentication Flow
1. Client calls MCP endpoint to initiate OAuth2 with Gmail
2. Server handles OAuth2 callback and stores tokens securely
3. Server validates and refreshes tokens as needed

### 3.2 Email Generation Flow
1. Client provides job posting details and recipient email via MCP endpoint
2. Server extracts relevant information from job posting
3. AI generates personalized email draft
4. Client reviews and approves the draft (optional, can be CLI or API-based)

### 3.3 Email Sending Flow
1. Client requests sending of approved email via MCP endpoint
2. Server sends email via Gmail API
3. Server stores metadata about sent email and confirms delivery

## 4. Technical Components

### 4.1 Core Services
```
MCPServer
├── EndpointRouter
├── AuthController
├── EmailDraftController
├── EmailSendController
├── CampaignController
└── TokenManager

EmailService
├── OAuth2Manager
├── GmailAPIClient
└── TokenStorage

AIService
├── LLMClient
├── PromptManager
└── EmailGenerator

CampaignService
├── JobContextManager
├── EmailTracker
└── StateManager
```

### 4.2 Data Models
```
EmailCampaign
├── campaign_id
├── job_details
├── recipient_email
├── email_content
├── status
└── timestamps

EmailTemplate
├── template_id
├── template_type
├── prompt_template
└── parameters

AuthToken
├── user_id
├── access_token
├── refresh_token
└── expiry
```

## 5. Implementation Priority

1. **Phase 1: MCP Server & Basic Infrastructure**
   - MCP server scaffolding and endpoint routing
   - OAuth2 authentication setup
   - Gmail API integration
   - Token management

2. **Phase 2: AI Integration**
   - LLM API integration
   - Basic prompt engineering
   - Email generation logic

3. **Phase 3: Core Workflow & Endpoints**
   - Job context management
   - Email campaign tracking
   - CLI/API client for demonstration

## 6. MVP Success Criteria

1. MCP server exposes endpoints for all core flows
2. Successfully authenticate with Gmail via MCP endpoint
3. Generate contextually relevant email draft via MCP endpoint
4. Send email through Gmail API via MCP endpoint
5. Track basic email status
6. Complete end-to-end flow without errors

## 7. Future Scope (Post-MVP)

1. Support for additional email providers
2. Web-based user interface
3. Advanced campaign management
4. Response tracking and analytics
5. Automated follow-ups
6. Multi-user support

---

**Note:** This document now serves as the single source of truth for both system design and MCP protocol integration for the MVP.