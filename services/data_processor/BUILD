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
    name="data-processor-bin-srcs",
    resolve="env-data-processor",
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
    name="data-processor",
    cache_to={"type": "gha", "mode": "max"},
    cache_from=[{"type": "gha"}],
    build_platform=["linux/amd64", "linux/aarch64"],
)
