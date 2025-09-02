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
    complete_platforms=[
        "tools/pex-platforms:pex-python311-arm64",
        "tools/pex-platforms:pex-python311-amd64",
    ],
)

pex_binary(
    name="model-service-bin-srcs",
    environment="build",
    entry_point="main.py",
    layout="packed",
    include_tools=True,
    include_requirements=False,
    complete_platforms=[
        "tools/pex-platforms:pex-python311-arm64",
        "tools/pex-platforms:pex-python311-amd64",
    ],
)

docker_image(
    name="model-service",
    build_platform=["linux/amd64"],
    cache_to={"type": "local", "dest": "/tmp/docker-cache/model-service"},
    cache_from=[{"type": "local", "src": "/tmp/docker-cache/model-service"}],
)
