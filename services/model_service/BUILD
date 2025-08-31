python_sources()

python_tests(
    name="tests",
    sources=["tests/*"],
    dependencies=[
        "//:common-reqs#httpx" # transitive dependency of fastapi test client
    ]
)

pex_binary(
    name="model-service-bin",
    entry_point="main.py",
)
