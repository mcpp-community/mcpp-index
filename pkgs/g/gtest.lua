-- M6.x glob-aware Form B descriptor for gtest.
-- All paths inside `mcpp = {}` are GLOBS relative to the verdir
-- (~/.mcpp/registry/data/xpkgs/<idx>-x-gtest/<ver>/).  `*` matches any
-- single path segment (so it absorbs the GitHub `<repo>-<tag>/` wrap).

package = {
    spec        = "1",
    name        = "gtest",
    description = "Google's C++ test framework",
    licenses    = {"BSD-3-Clause"},
    repo        = "https://github.com/google/googletest",
    type        = "package",

    xpm = {
        linux = {
            ["1.15.2"] = {
                url    = "https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz",
                sha256 = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926",
            },
        },
        macosx = {
            ["1.15.2"] = {
                url    = "https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz",
                sha256 = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926",
            },
        },
        windows = {
            ["1.15.2"] = {
                url    = "https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz",
                sha256 = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926",
            },
        },
    },

    mcpp = {
        language     = "c++23",
        sources      = {
            "*/googletest/src/gtest-all.cc",
            "*/googletest/src/gtest_main.cc",
        },
        include_dirs = {
            "*/googletest/include",
            "*/googletest",
        },
        targets      = { ["gtest"] = { kind = "lib" } },
        deps         = { },
    },
}
