---

### 📁 `email-mcp` — Modular Email Communication Platform

> A fully modular and test-driven email communication system for handling templates, users, email flows, and database-backed persistence. Built with a clean architecture mindset for scalability and developer speed.

---

## 🧱 Folder Structure

```bash
email-mcp/
├── src/email_mcp/
│   ├── classes/         # Domain objects (Person, Mail, etc.)
│   ├── config/          # Environment, provider, DB configs
│   ├── controllers/     # Request/response handling logic
│   ├── middleware/      # Auth, validation, rate limits, etc.
│   ├── models/          # ORM models + Pydantic schemas
│   ├── services/        # Core business logic
│   ├── templates/       # HTML email templates
│   ├── utils/           # Helpers and validators
│   ├── database/        # DB migrations, seeds, and schema files
│   ├── mcp/             # Server handlers + CLI/tools
│   ├── app.py           # App bootstrap
│   └── main.py          # Main entrypoint
├── tests/               # Unit, integration, and mock testing
├── docs/                # Setup, API, usage docs
├── scripts/             # Dev/build/test/deploy scripts
```

---

## 🔧 How to Use Each Layer

### ✅ `models/` — Define Your Data Shape

Use for defining:

* **Database models** using ORM (like SQLAlchemy)
* **Schemas** using Pydantic for validation and serialization

```python
# models/person_model.py
class Person(Base):
    __tablename__ = "persons"
    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String)

# models/schemas.py
class PersonSchema(BaseModel):
    name: str
    email: EmailStr
```

Use `schemas` in APIs and `models` in services for persistence.

---

### 🧠 `services/` — Business Logic Lives Here

This is where the actual **core logic** of your app resides. Keep it modular and testable.

```python
# services/person_service.py
class PersonService:
    def create_person(self, schema: PersonSchema):
        person = Person(name=schema.name, email=schema.email)
        session.add(person)
        session.commit()
        return person
```

Services never care about how requests come in — just *what* needs to be done.

---

### 📬 `controllers/` — Handle API Input & Output

Your entrypoint for requests. All parsing, response formatting, and calling services happen here.

```python
# controllers/person_controller.py
@app.post("/person")
def create_person(data: PersonSchema):
    return PersonService().create_person(data)
```

Keep controllers thin. Delegate logic to services.

---

### 🧱 `classes/` — Domain Logic (Optional but Clean)

Use classes for reusable, framework-agnostic **domain logic**.

```python
# classes/person.py
class Person:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def is_valid(self):
        return "@" in self.email
```

This makes testing and domain isolation easy.

---

### 📄 `templates/` — Dynamic Email Templates

Your HTML-based dynamic email bodies live here.

```html
<!-- templates/job_application.html -->
<h1>Hello {{ name }}</h1>
<p>Thank you for applying...</p>
```

Use `template_service.py` to render them before sending.

---

### 🧪 `tests/` — Unit, Integration, and Mocks

Organized like your codebase. Use `mocks/` to stub external services.

```bash
tests/
├── unit/               # Test services, utils, classes
├── integration/        # End-to-end feature flow tests
├── mocks/              # Mock DB or email APIs
```

---

## 🧰 Dev Commands

```bash
# Setup environment
cp .env.example .env.development

# Run app
python src/email_mcp/main.py

# Format code
./scripts/format.sh

# Run tests
./scripts/test.sh
```

---

## 💡 Extending the System

1. **Add a new email type:**

   * Create a new `.html` in `templates/`
   * Add a method in `email_service.py`
   * Route it via a new controller method

2. **Add a new model:**

   * Add ORM class in `models/`
   * Add matching schema in `schemas.py`
   * Migrate schema via `database/migrations/`

3. **Need a CLI tool or background job?**

   * Add logic in `mcp/tools/` or `mcp/server.py`

---

## 🏗️ Tech Stack

* **Python** for routing (your pick)
* **SQLAlchemy** for ORM
* **Pydantic** for data validation
* **Jinja2** for templating emails
* **pytest** for testing
* ** LIST OF ALL TECH USED - add it in future**

---

## 🙌 Author

Built by **Amey Bhilegaonkar and Saurabh Zinjad** – confidently engineered with ❤️ for developers who care about clean code and scalable systems.

---

Here’s your polished, confident, and contributor-ready `README.md` section for **🌳 Branch Strategy & Contribution Rules** — formatted like it belongs in an enterprise-grade repo:

---

## 🌳 Branch Strategy & Contribution Rules

This repo follows a **clean, scalable branching strategy** to ensure stability, clarity, and collaboration at every level. All contributors are expected to follow the rules outlined below.

---

### 🗂 Branch Structure

```bash
main
├── release
    ├── dev
        ├── feature branches  # Collaborators work here
```

---

### 🔁 Branch Flow

> Changes flow **upstream** — from feature → dev → release → main.

```plaintext
main → release → dev → feature branches
```

* **No direct commits** to `main`, `release`, or `dev`.
* All collaborators must create **feature branches from `dev`**.

---

### 🏷 Naming Conventions

All feature branches must follow this pattern:

```
<type>/<issue_number>_<short_description>
```

#### ✅ Examples:

* `fix/123_authentication_bug`
* `update/456_email_templates`
* `merge/789_database_integration`

#### Branch Types:

| Prefix    | Purpose                         |
| --------- | ------------------------------- |
| `fix/`    | Bug fixes                       |
| `update/` | Feature enhancements or changes |
| `merge/`  | Merges or large integrations    |

---

### ✅ Pull Request (PR) Rules

#### 🧪 **Feature → Dev**

* ✅ **1 approval required**
* 🔍 Code review is mandatory
* ✅ All tests must pass

#### 🚀 **Dev → Release**

* ✅ **2 approvals required**
* 🧪 Full integration/QA testing
* 📖 Documentation updates required

#### 🔒 **Release → Main**

* ✅ **2 approvals required**
* ✅ Final code review + sign-off
* 🚨 Must be production-ready only

---

### 📚 Workflow Checklist

1. 📝 Create an issue for your task.
2. 🌱 Create a **feature branch** from `dev`.
3. 💻 Make your changes + write tests.
4. 🔀 Submit a **PR to `dev`**.
5. ✅ Get it approved + merge to `dev`.
6. 📦 When stable, create PR from `dev` → `release`.
7. 🧪 After testing, create PR from `release` → `main`.

---

### ⚠️ Important

> Always pull the **latest changes** from the target branch before opening a PR. Stay in sync, avoid merge hell.

```bash
# Example:
git checkout dev
git pull origin dev
git checkout -b fix/999_patch_login_issue
```

---

By following this strategy, we keep our codebase **robust**, our releases **predictable**, and our team **in sync**.

---
