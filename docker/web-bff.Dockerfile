FROM python:3.13-slim

# Install dependencies and setup mise
RUN apt-get update && apt-get -y --no-install-recommends install \
    sudo curl git ca-certificates build-essential \
    && rm -rf /var/lib/apt/lists/*

# Setup mise environment
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH:/root/.local/bin"

# Install mise and poetry
RUN curl https://mise.run | sh \
    && curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app

# Copy project files from web-bff directory
COPY web-bff/pyproject.toml web-bff/poetry.lock web-bff/.mise.toml ./
COPY web-bff/app ./app
COPY web-bff/tests ./tests

# Install dependencies
RUN mise trust .mise.toml \
    && mise install \
    && poetry config virtualenvs.create false \
    && poetry lock \
    && poetry install --no-root

EXPOSE 8000

CMD ["mise", "exec", "--", "poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
