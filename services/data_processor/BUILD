python_sources(
    resolve="data_processor",
)

python_tests(
    name="tests",
    resolve="data_processor",
    sources=["tests/*.py"],
    dependencies=[
        "//:common-reqs#httpx" # transitive dependency of fastapi test client
    ]
)

pex_binary(
    name="data-processor-bin",
    entry_point="main.py",
)
