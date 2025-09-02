#!/usr/bin/env bash

docker run --entrypoint="/bin/bash" -it --rm python:3.11-slim \
    -c "python -m pip install pex >/dev/null 2>&1 && pex3 interpreter inspect --markers --tags --indent=2" \
    > pex-python311-slim.json
