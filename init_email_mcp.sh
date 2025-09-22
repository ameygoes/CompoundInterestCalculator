#!/bin/bash

# Base structure
mkdir -p email-mcp/src/email_mcp/{classes,config,controllers,middleware,models,services,templates,utils,database/{migrations,seeds,schema},mcp/{handlers,tools}}
mkdir -p email-mcp/tests/{unit,integration,mocks}
mkdir -p email-mcp/docs
mkdir -p email-mcp/scripts

# Create __init__.py files
find email-mcp/src/email_mcp -type d -exec touch {}/__init__.py \;
find email-mcp/tests -type d -exec touch {}/__init__.py \;

# Template files
touch email-mcp/src/email_mcp/classes/{person.py,mail.py,database.py}
touch email-mcp/src/email_mcp/config/{database.py,email_providers.py,settings.py}
touch email-mcp/src/email_mcp/controllers/{email_controller.py,person_controller.py,database_controller.py}
touch email-mcp/src/email_mcp/middleware/{auth.py,validation.py,rate_limiter.py,error_handler.py}
touch email-mcp/src/email_mcp/models/{person_model.py,mail_model.py,database_model.py,schemas.py}
touch email-mcp/src/email_mcp/services/{email_service.py,person_service.py,database_service.py,template_service.py}
touch email-mcp/src/email_mcp/templates/{job_application.html,networking_email.html,thank_you.html,follow_up.html}
touch email-mcp/src/email_mcp/utils/{validators.py,helpers.py}
touch email-mcp/src/email_mcp/database/migrations/{001_create_persons_table.py,002_create_emails_table.py}
touch email-mcp/src/email_mcp/database/seeds/{sample_persons.py,sample_templates.py}
touch email-mcp/src/email_mcp/database/schema/{persons.sql,emails.sql}
touch email-mcp/src/email_mcp/mcp/{server.py}
touch email-mcp/src/email_mcp/mcp/handlers/{email_handlers.py,person_handlers.py,database_handlers.py}
touch email-mcp/src/email_mcp/mcp/tools/{email_tools.py,person_tools.py,database_tools.py}
touch email-mcp/src/email_mcp/{app.py,main.py}
touch email-mcp/tests/unit/{test_person.py,test_mail.py,test_database.py}
touch email-mcp/tests/integration/{test_email_flow.py,test_database_operations.py}
touch email-mcp/tests/mocks/{mock_database.py,mock_email_provider.py}
touch email-mcp/tests/conftest.py
touch email-mcp/docs/{API.md,SETUP.md,CONFIGURATION.md,EXAMPLES.md}
touch email-mcp/scripts/{build.sh,dev.sh,test.sh,format.sh,deploy.sh}
touch email-mcp/{.env.example,.env.development,.env.production,.gitignore,pyproject.toml,requirements.txt,requirements-dev.txt,setup.py,README.md}

echo "✅ Project structure for email-mcp created successfully!"
