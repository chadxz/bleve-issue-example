load("@bazel_gazelle//:deps.bzl", "go_repository")

def go_dependencies():
    go_repository(
        name = "com_github_blevesearch_bleve_v2",
        build_file_proto_mode = "disable",  # keep
        importpath = "github.com/blevesearch/bleve/v2",
        sum = "h1:1wuR7eB8Fk9UaCaBUfnQt5V7zIpi4VDok9ExN7Rl+/8=",
        version = "v2.3.5",
    )
