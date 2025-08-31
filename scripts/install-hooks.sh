#!/usr/bin/env bash

SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
ln -s "${SCRIPT_PATH}/githooks/pre-commit" .git/hooks/pre-commit
