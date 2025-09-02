#!/usr/bin/env bash

docker run --platform linux/arm64 --entrypoint="/bin/bash" -it --rm python:3.11-slim \
    -c "python -m pip install pex >/dev/null 2>&1 && pex3 interpreter inspect --markers --tags --indent=2" \
    > pex-python311-arm64.json

docker run --platform linux/amd64 --entrypoint="/bin/bash" -it --rm python:3.11-slim \
    -c "python -m pip install pex >/dev/null 2>&1 && pex3 interpreter inspect --markers --tags --indent=2" \
    > pex-python311-amd64.json
