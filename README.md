# Bleve Issue Repro

We integrated Bleve into a new project and ran into an issue building it with Bazel. All of my other
dependencies build cleanly with no issue. I'm unsure what exactly is causing this failure. This repo
provides a simple repro case for investigation. I'm going to open a ticket with both Bleve and Bazel
and cross-reference them, with hopes someone can help solve this.

## Requirements

Install [bazelisk](https://github.com/bazelbuild/bazelisk) to pull in the right version of Bazel to
test against. You may change the dependency in [.bazelversion](.bazelversion)

## To Reproduce

Issue the following commands:

```bash
bazelisk run gazelle -- update-repos -from_file=go.mod -to_macro=deps.bzl%go_dependencies
bazelisk run gazelle
bazelisk build //...
```

## Expected Results

Clean build with a binary in [./app/app](./app/app)

## Actual Results

Build fails with the following errors:

```bash
$ bazelisk build //...
INFO: Analyzed 2 targets (0 packages loaded, 0 targets configured).
INFO: Found 2 targets...
ERROR: /private/var/tmp/_bazel_kkurz/feebd44798d3d5c2f1ba496aa94cf6b3/external/com_github_blevesearch_bleve_v2/index/upsidedown/BUILD.bazel:19:11: GoCompilePkg external/com_github_blevesearch_bleve_v2/index/upsidedown/upsidedown.a failed: (Exit 1): builder failed: error executing command bazel-out/darwin_arm64-opt-exec-2B5CBBC6/bin/external/go_sdk/builder compilepkg -sdk external/go_sdk -installsuffix darwin_arm64 -src ... (remaining 87 arguments skipped)

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:747:14: birv.Size undefined (type *BackIndexRowValue has no field or method Size)
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:755:14: birv.MarshalTo undefined (type *BackIndexRowValue has no field or method MarshalTo)
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:964:12: undefined: ErrInvalidLengthUpsidedown
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:997:12: undefined: ErrInvalidLengthUpsidedown
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:1018:19: undefined: skipUpsidedown
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:1023:12: undefined: ErrInvalidLengthUpsidedown
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:1122:19: undefined: skipUpsidedown
external/com_github_blevesearch_bleve_v2/index/upsidedown/row.go:1127:12: undefined: ErrInvalidLengthUpsidedown
compilepkg: error running subcommand external/go_sdk/pkg/tool/darwin_arm64/compile: exit status 2
INFO: Elapsed time: 0.284s, Critical Path: 0.10s
INFO: 2 processes: 2 internal.
FAILED: Build did NOT complete successfully
$
```
