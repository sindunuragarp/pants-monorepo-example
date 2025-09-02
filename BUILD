python_requirements(
    name="common-reqs",
    resolve=parametrize("env-default", "env-data-processor"),
    source="requirements-common.txt",
    module_mapping={
        "scikit-learn": ["sklearn"],
    },
)

python_requirements(
    name="default-reqs",
    resolve="env-default",
    source="requirements.txt",
)

python_requirements(
    name="data-processor-reqs",
    resolve="env-data-processor",
    source="services/data_processor/requirements.txt",
)


# Tools

python_requirement(
    name="ruff-reqs",
    resolve="env-ruff",
    requirements=[
        "ruff==0.12.11",
    ],
)

python_requirement(
    name="pytest-reqs",
    resolve="env-pytest",
    requirements=[
        "pytest==7.4.0",
    ],
)

# Environments

local_environment(name="local")

local_environment(name="build-local")

docker_environment(
    name="build-docker",
    image="python:3.11-slim",
    python_bootstrap_search_path=["<PATH>"],
)
