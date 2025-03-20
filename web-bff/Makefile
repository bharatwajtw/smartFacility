setup-bff:
	@echo "Setting up Web bff app..."
	@if ! command -v poetry &> /dev/null; then \
		echo "Poetry not found. Installing poetry..."; \
		curl -sSL https://install.python-poetry.org | python3 -; \
		poetry config virtualenvs.create true; \
		poetry install --no-root; \
	else \
		echo "Poetry exists. Installing dependencies..."; \
		poetry install --no-root; \
	fi

run-bff:
	@$(MAKE) setup-bff
	@poetry run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

pre-commit-bff:
	@echo "Running pre-commit tasks (lint fix and format)..."
	@poetry run ruff check --fix .
	@poetry run ruff format .

test-bff:
	@echo "Running Web bff tests with coverage..."
	@poetry run pytest --asyncio-mode=auto --cov=app tests/

docker-build-bff:
	@echo "Building Web bff Docker image..."
	docker build -t web-bff -f docker/web-bff.Dockerfile .

docker-run-bff: docker-build-bff
	@echo "Running Web bff Docker container..."
	@docker run -p 8000:8000 web-bff

docker-test-bff: docker-build-bff
	@echo "Running Web bff tests in Docker..."
	@docker run web-bff poetry run pytest --asyncio-mode=auto tests/