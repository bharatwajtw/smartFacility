run-bff:
	echo "Running Web bff app..."
	@cd web-bff && mise exec -- poetry install --no-root
	@cd web-bff && mise exec -- poetry run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

install-bff:
	@echo "Installing $(p) Web bff test..."
	@cd web-bff && mise exec -- poetry add $(p)

lint-bff:
	@echo "Running Web bff linting..."
	@cd web-bff && mise exec -- ruff check .

lint-fix-bff:
	@echo "Running Web bff lint fix..."
	@cd web-bff && mise exec -- ruff check --fix .

format-bff:
	@echo "Running Web bff format..."
	@cd web-bff && mise exec -- ruff format .

test-bff:
	@echo "Running Web bff test..."
	@cd web-bff && mise exec -- pytest --asyncio-mode=auto tests/

test-cover-bff:
	@echo "Running Web bff test coverage..."
	@cd web-bff && mise exec -- pytest --asyncio-mode=auto --cov=app tests/

run-web:
	@echo "Running web server..."
	@cd web && npm run dev
	
docker-build-bff:
	@echo "Building Web bff Docker image..."
	docker build -t web-bff -f docker/web-bff.Dockerfile .

docker-run-bff: docker-build-bff
	@echo "Running Web bff Docker container..."
	@docker run -p 8000:8000 web-bff

docker-test-bff: docker-build-bff
	@echo "Running Web bff tests in Docker..."
	@docker run web-bff mise exec -- poetry run pytest --asyncio-mode=auto tests/
