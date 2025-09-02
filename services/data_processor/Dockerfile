FROM --platform=${BUILDPLATFORM} python:3.12-slim

ARG PEX_BIN=services/data_processor:data-processor-bin
COPY $PEX_BIN /bin/app

ENTRYPOINT [ "/usr/local/bin/python3.12", "/bin/app" ]
