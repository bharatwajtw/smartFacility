run-bff:
	@cd web-bff && make run-bff

install-bff:
	@cd web-bff && make install-bff

pre-commit-bff:
	@cd web-bff && make pre-commit-bff

test-bff:
	@cd web-bff && make test-bff

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
