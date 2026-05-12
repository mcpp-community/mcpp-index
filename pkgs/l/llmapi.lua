-- Form A descriptor: the upstream repo ships its own mcpp.toml from
-- v0.2.4 onwards. mcpp's default-look-up walks the GitHub tarball
-- wrap (`llmapi-<tag>/mcpp.toml`) automatically.
package = {
    spec        = "1",
    namespace = "mcpplibs",
    name        = "llmapi",
    description = "Modern C++ LLM API client with openai-compatible support",
    licenses    = {"Apache-2.0"},
    repo        = "https://github.com/mcpplibs/llmapi",
    type        = "package",

    xpm = {
        linux = {
            ["0.2.4"] = {
                url    = "https://github.com/mcpplibs/llmapi/archive/refs/tags/0.2.4.tar.gz",
                sha256 = "b1d204576ee2d2069abdac1a7e25078e605c8fae5b1cdad6cee200946cfed0f0",
            },
            ["0.2.5"] = {
                url    = "https://github.com/mcpplibs/llmapi/archive/refs/tags/0.2.5.tar.gz",
                sha256 = "fffa1341beed98ace97e029c0e46f47f55470df6e6a7114374e73e2bfd13699f",
            },
        },
        macosx = {
            ["0.2.4"] = {
                url    = "https://github.com/mcpplibs/llmapi/archive/refs/tags/0.2.4.tar.gz",
                sha256 = "b1d204576ee2d2069abdac1a7e25078e605c8fae5b1cdad6cee200946cfed0f0",
            },
            ["0.2.5"] = {
                url    = "https://github.com/mcpplibs/llmapi/archive/refs/tags/0.2.5.tar.gz",
                sha256 = "fffa1341beed98ace97e029c0e46f47f55470df6e6a7114374e73e2bfd13699f",
            },
        },
        windows = {
            ["0.2.4"] = {
                url    = "https://github.com/mcpplibs/llmapi/archive/refs/tags/0.2.4.tar.gz",
                sha256 = "b1d204576ee2d2069abdac1a7e25078e605c8fae5b1cdad6cee200946cfed0f0",
            },
            ["0.2.5"] = {
                url    = "https://github.com/mcpplibs/llmapi/archive/refs/tags/0.2.5.tar.gz",
                sha256 = "fffa1341beed98ace97e029c0e46f47f55470df6e6a7114374e73e2bfd13699f",
            },
        },
    },
}
