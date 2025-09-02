python_sources()

python_tests(
    name="tests",
    sources=["tests/*"],
    dependencies=[
        "//:common-reqs#httpx"  # transitive dependency of fastapi test client
    ],
)

pex_binary(
    name="model-service-bin-deps",
    environment="build",
    entry_point="main.py",
    layout="packed",
    include_tools=True,
    include_sources=False,
)

pex_binary(
    name="model-service-bin-srcs",
    environment="build",
    entry_point="main.py",
    layout="packed",
    include_tools=True,
    include_requirements=False,
)

docker_image(
    name="model-service",
    cache_to={"type": "gha", "mode": "max"},
    cache_from=[{"type": "gha"}],
    build_platform=["linux/amd64"],
)
