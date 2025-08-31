python_requirements(
    name="common-reqs",
    resolve=parametrize("default", "data_processor"),
    source="requirements-common.txt",
    module_mapping={
        "scikit-learn": ["sklearn"],
    }
)

python_requirements(
    name="default-reqs",
    resolve="default",
    source="requirements.txt"
)

python_requirements(
    name="data-processor-reqs",
    resolve="data_processor",
    source="services/data_processor/requirements.txt",
)


# Tools

python_requirement(
    name="ruff-reqs",
    resolve="ruff",
    requirements=[
        "ruff==0.12.11",
    ]
)

python_requirement(
    name="pytest-reqs",
    resolve="pytest",
    requirements=[
        "pytest==7.4.0",
    ],
)
