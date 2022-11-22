# Ability to load from HTTP
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Ability to load from Git
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "bazel_skylib",
    sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

# Pull down the rules_go release
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "099a9fb96a376ccbbb7d291ed4ecbdfd42f6bc822ab77ae6f1b5cb9e914e94fa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
    ],
)

# Load go_register_toolchains and go_rules_dependencies into the toolchain
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# Pull down the protobuf release
http_archive(
    name = "com_google_protobuf",
    strip_prefix = "protobuf-3.21.9",
    url = "https://github.com/protocolbuffers/protobuf/releases/download/v21.9/protobuf-cpp-3.21.9.zip",
)

# Load protobuf_deps into the toolchain
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

# Pull down the gazelle release
http_archive(
    name = "bazel_gazelle",
    sha256 = "448e37e0dbf61d6fa8f00aaa12d191745e14f07c31cabfa731f0c8e8a4f41b97",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
    ],
)

# Load gazelle_dependencies into the toolchain
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# Process any protobuf dependencies
protobuf_deps()

# Process go dependencies
go_rules_dependencies()

# Set the current golang toolchain
go_register_toolchains(version = "1.19.3")

# Load in the Gazelle-generated dependency fil
load("//:deps.bzl", "go_dependencies")

# gazelle:repository_macro deps.bzl%go_dependencies
go_dependencies()

gazelle_dependencies()
