FROM --platform=${BUILDPLATFORM} python:3.12-slim

ARG PEX_BIN=services/model_service:model-service-bin
COPY $PEX_BIN /bin/app

ENTRYPOINT [ "/usr/local/bin/python3.12", "/bin/app" ]
