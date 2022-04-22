FROM python:3.10
WORKDIR /app

RUN pip3 install --no-cache-dir poetry
RUN poetry config virtualenvs.in-project true

COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock

RUN poetry install --no-root --no-dev \
    && rm -rf /root/.cache/*

COPY wificitylogin.py wificitylogin.py
ENTRYPOINT /bin/bash -c "while true; do /app/.venv/bin/python3 -m wificitylogin; sleep 15; done"
