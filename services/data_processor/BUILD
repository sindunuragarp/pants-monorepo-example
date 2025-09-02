python_sources(
    resolve="env-data-processor",
)

python_tests(
    name="tests",
    resolve="env-data-processor",
    sources=["tests/*.py"],
    dependencies=[
        "//:common-reqs#httpx"  # transitive dependency of fastapi test client
    ],
)

pex_binary(
    name="data-processor-bin",
    resolve="env-data-processor",
    entry_point="main.py",
)

docker_image(
    name="data-processor",
    cache_to={"type": "local", "dest": "/tmp/docker-cache/data-processor"},
    cache_from=[{"type": "local", "src": "/tmp/docker-cache/data-processor"}],
    build_platform=["linux/amd64", "linux/arm64"],
)
