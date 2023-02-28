ARG VARIANT=3-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp
