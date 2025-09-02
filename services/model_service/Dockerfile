FROM --platform=${BUILDPLATFORM} python:3.11-slim AS deps

ARG PEX_BIN_DEPS=services/model_service:model-service-bin-deps
COPY $PEX_BIN_DEPS /bin-deps.pex
RUN PEX_TOOLS=1 /usr/local/bin/python3.11 /bin-deps.pex venv --scope=deps --compile /bin/app

FROM --platform=${BUILDPLATFORM} python:3.11-slim AS srcs

ARG PEX_BIN_SRCS=services/model_service:model-service-bin-srcs
COPY $PEX_BIN_SRCS /bin-srcs.pex
RUN PEX_TOOLS=1 /usr/local/bin/python3.11 /bin-srcs.pex venv --scope=srcs --compile /bin/app

FROM --platform=${BUILDPLATFORM} python:3.11-slim

COPY --from=deps /bin/app /bin/app
COPY --from=srcs /bin/app /bin/app
ENTRYPOINT [ "/usr/local/bin/python3.11", "/bin/app" ]

