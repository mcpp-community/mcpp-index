# mcpp-index

> Default package registry for [`mcpp`](https://github.com/mcpp-community/mcpp).
> Browse: **https://mcpp-community.github.io/mcpp-index/**

```bash
mcpp add mcpplibs.cmdline@0.0.2     # → updates mcpp.toml
mcpp build                            # → fetches sources, builds
```

## Adding a package

Drop one [xpkg V1](https://github.com/d2learn/xim-pkgindex/blob/main/docs/V1/xpackage-spec.md)
descriptor at `pkgs/<first-letter>/<name>.lua`. Existing files (e.g.
[`pkgs/m/mbedtls.lua`](pkgs/m/mbedtls.lua),
[`pkgs/l/lua.lua`](pkgs/l/lua.lua)) are the canonical templates;
the [mcpp extension](https://github.com/mcpp-community/mcpp/blob/main/docs/04-schema-xpkg-extension.md)
covers the optional `mcpp = { ... }` segment for upstreams that
don't ship their own `mcpp.toml`. Open a PR — the `validate`
workflow lint-checks descriptors, the `deploy-site` workflow
republishes the browse site after merge.

## License

Descriptors: CC0. Each indexed upstream keeps its own license.
