run:
	docker compose up

run-bff:
	@cd web-bff && make run-bff

install-bff:
	@cd web-bff && make install-bff

pre-commit-bff:
	@cd web-bff && make pre-commit-bff

set-pre-commit-hook-bff:
	@cd web-bff && make set-pre-commit-hook-bff

test-bff:
	@cd web-bff && make test-bff