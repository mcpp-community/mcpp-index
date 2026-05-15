-- Form A descriptor: the upstream repo ships its own mcpp.toml from
-- v0.0.39 onwards, so we omit the `mcpp` field — mcpp default-look-up
-- finds <verdir>/libxpkg-<tag>/mcpp.toml inside the GitHub tarball wrap.
package = {
    spec        = "1",
    namespace = "mcpplibs",
    name        = "mcpplibs.xpkg",
    description = "C++23 reference implementation of the xpkg V1 spec — `import mcpplibs.xpkg;`",
    licenses    = {"Apache-2.0"},
    repo        = "https://github.com/openxlings/libxpkg",
    type        = "package",

    xpm = {
        linux = {
            ["0.0.41"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.41.tar.gz",
                sha256 = "d4a0dc6df0388858415cf6899dd1aa6d5d8b9836f1f81c9687b0b34fb7ee0e2e",
            },
            ["0.0.40"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.40.tar.gz",
                sha256 = "95fd6d7b2c044578830015fd5b1dceaafd5c0dbadc04a0c78e82d380405e193f",
            },
            ["0.0.39"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.39.tar.gz",
                sha256 = "292d6a85da95b3615cc96f8e2e64dbe7767d059d8a8e9422bbc72db648f81f71",
            },
        },
        macosx = {
            ["0.0.41"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.41.tar.gz",
                sha256 = "d4a0dc6df0388858415cf6899dd1aa6d5d8b9836f1f81c9687b0b34fb7ee0e2e",
            },
            ["0.0.40"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.40.tar.gz",
                sha256 = "95fd6d7b2c044578830015fd5b1dceaafd5c0dbadc04a0c78e82d380405e193f",
            },
            ["0.0.39"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.39.tar.gz",
                sha256 = "292d6a85da95b3615cc96f8e2e64dbe7767d059d8a8e9422bbc72db648f81f71",
            },
        },
        windows = {
            ["0.0.41"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.41.tar.gz",
                sha256 = "d4a0dc6df0388858415cf6899dd1aa6d5d8b9836f1f81c9687b0b34fb7ee0e2e",
            },
            ["0.0.40"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.40.tar.gz",
                sha256 = "95fd6d7b2c044578830015fd5b1dceaafd5c0dbadc04a0c78e82d380405e193f",
            },
            ["0.0.39"] = {
                url    = "https://github.com/openxlings/libxpkg/archive/refs/tags/v0.0.39.tar.gz",
                sha256 = "292d6a85da95b3615cc96f8e2e64dbe7767d059d8a8e9422bbc72db648f81f71",
            },
        },
    },
}
