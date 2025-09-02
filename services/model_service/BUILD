python_sources()

python_tests(
    name="tests",
    sources=["tests/*"],
    dependencies=[
        "//:common-reqs#httpx"  # transitive dependency of fastapi test client
    ],
)

pex_binary(
    name="model-service-bin",
    entry_point="main.py",
)

docker_image(
    name="model-service",
    cache_to={"type": "local", "dest": "/tmp/docker-cache/model-service"},
    cache_from=[{"type": "local", "src": "/tmp/docker-cache/model-service"}],
)
