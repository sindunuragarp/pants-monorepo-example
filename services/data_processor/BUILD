python_sources(
    resolve="env-data-processor",
)

python_tests(
    name="tests",
    resolve="env-data-processor",
    sources=["tests/*.py"],
    dependencies=[
        "//:common-reqs#httpx" # transitive dependency of fastapi test client
    ]
)

pex_binary(
    name="data-processor-bin",
    entry_point="main.py",
)

docker_image(
    name="data-processor-image"
)
