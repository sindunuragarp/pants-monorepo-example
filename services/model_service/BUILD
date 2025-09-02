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
    entry_point="main.py",
    layout="packed",
    include_tools=True,
    include_sources=False,
    complete_platforms=[
        "tools/pex-platforms:pex-python311-aarch64",
        "tools/pex-platforms:pex-python311-amd64",
    ],
)

pex_binary(
    name="model-service-bin-srcs",
    entry_point="main.py",
    layout="packed",
    include_tools=True,
    include_requirements=False,
    complete_platforms=[
        "tools/pex-platforms:pex-python311-aarch64",
        "tools/pex-platforms:pex-python311-amd64",
    ],
)

docker_image(
    name="model-service",
    cache_to={"type": "gha", "mode": "max"},
    cache_from=[{"type": "gha"}],
    build_platform=["linux/amd64", "linux/aarch64"],
)
