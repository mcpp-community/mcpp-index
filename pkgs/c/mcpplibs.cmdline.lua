-- Hand-written workaround entry.
-- Upstream repo (mcpplibs/cmdline) has no mcpp.toml; the `mcpp = {}` block
-- below carries the build info mcpp would otherwise read from mcpp.toml.
-- Drop the `mcpp = {}` segment when the upstream repo adopts mcpp.toml natively.
package = {
    spec        = "1",
    name        = "mcpplibs.cmdline",
    description = "A simple command-line parsing library/framework for modern C++",
    licenses    = {"Apache-2.0"},
    repo        = "https://github.com/mcpplibs/cmdline",
    type        = "package",

    xpm = {
        linux = {
            ["0.0.1"] = {
                url    = "https://github.com/mcpplibs/cmdline/archive/refs/tags/0.0.1.tar.gz",
                sha256 = "3fb2f5495c1a144485b3cbb2e43e27059151633460f702af0f3851cbff387ef0",
            },
        },
        macosx = {
            ["0.0.1"] = {
                url    = "https://github.com/mcpplibs/cmdline/archive/refs/tags/0.0.1.tar.gz",
                sha256 = "3fb2f5495c1a144485b3cbb2e43e27059151633460f702af0f3851cbff387ef0",
            },
        },
        windows = {
            ["0.0.1"] = {
                url    = "https://github.com/mcpplibs/cmdline/archive/refs/tags/0.0.1.tar.gz",
                sha256 = "3fb2f5495c1a144485b3cbb2e43e27059151633460f702af0f3851cbff387ef0",
            },
        },
    },

    -- Workaround: upstream repo has no mcpp.toml. Drop this segment when it does.
    mcpp = {
        language   = "c++23",
        import_std = true,
        modules    = { "mcpplibs.cmdline" },
        sources    = { "src/**/*.cppm" },
        targets    = { ["cmdline"] = { kind = "lib" } },
        deps       = { },
    },
}
