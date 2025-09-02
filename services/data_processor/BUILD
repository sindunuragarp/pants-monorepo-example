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
    name="data-processor-bin-deps",
    resolve="env-data-processor",
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
    name="data-processor-bin-srcs",
    resolve="env-data-processor",
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
    name="data-processor",
    build_platform=["linux/amd64"],
    cache_to={"type": "local", "dest": "/tmp/docker-cache/data-processor"},
    cache_from=[{"type": "local", "src": "/tmp/docker-cache/data-processor"}],
    registries=["@repo"],
    image_tags=["{build_args.GIT_SHA}"],
)
