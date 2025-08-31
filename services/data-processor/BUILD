python_sources(
    resolve="data_processor",
)

python_tests(
    name="tests",
    resolve="data_processor",
    sources=["tests/*"],
)

pex_binary(
    name="data_processor",
    entry_point="main.py",
)
