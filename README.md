# mcpp-index

> Package index registry for the [`mcpp`](https://github.com/mcpp-community/mcpp) build tool.

This repository indexes modular C++23 packages that follow the
[xpkg v1 spec](https://github.com/d2learn/xim-pkgindex/blob/main/docs/V1/xpackage-spec.md)
plus the [mcpp extension segment](https://github.com/mcpp-community/mcpp/blob/dev/docs/04-schema-xpkg-extension.md).

## How is this different from xim-pkgindex / mcpplibs-index?

| Repo | Format | Build tool | Status |
|------|--------|------------|--------|
| [`d2learn/xim-pkgindex`](https://github.com/d2learn/xim-pkgindex) | xpkg v1 (Lua) | xlings + various | Official xlings index |
| [`mcpplibs/mcpplibs-index`](https://github.com/mcpplibs/mcpplibs-index) | xmake `package(...)` | xmake | mcpplibs xmake-style index |
| **`mcpp-community/mcpp-index`** (this) | xpkg v1 + mcpp ext | mcpp | Modular-only, mcpp-driven |

## Layout

```
pkgs/<letter>/<package>.lua    Each indexed package
docs/                           Contributor docs
.github/workflows/              CI: lint, validate, deploy
```

## Using this index

mcpp registers `mcpp-index` automatically as the default registry. With a
fresh `mcpp` install:

```bash
mcpp env                                     # initializes ~/.mcpp/registry/
mcpp search hello                             # searches mcpp-index
mcpp add mcpplibs.templates@0.0.1             # adds to your project's mcpp.toml
mcpp build                                    # mcpp pulls source via xlings, builds
```

## Adding a package

See [docs/19-creating-mcpp-index.md](https://github.com/mcpp-community/mcpp/blob/dev/docs/19-creating-mcpp-index.md) in the mcpp repo.

## License

Package descriptions: CC0 (metadata is uncopyrightable). Each indexed package
has its own license.
