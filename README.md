# mcpp-index

> [`mcpp`](https://github.com/mcpp-community/mcpp) 构建工具的默认包索引仓库
>
> 在线浏览: **https://mcpplibs.github.io/mcpp-index/**

## 快速使用

```bash
mcpp add mcpplibs:cmdline@0.0.2    # 模块化库
mcpp add compat:ftxui@6.1.9       # 非模块化兼容库
mcpp build                         # 自动拉取源码 + 构建
```

## 命名空间

mcpp 0.0.6+ 使用显式 `namespace` 字段区分包的类别:

| namespace | 含义 | 鼓励使用 |
|---|---|---|
| `mcpplibs` | 模块化 C++23 库(mcpplibs 生态) | ✅ 推荐 |
| `mcpplibs.capi` | C API 的 C++23 模块封装 | ✅ 推荐 |
| `compat` | 非模块化 C/C++ 库(兼容性支持) | ⚠️ 建议优先使用模块化替代 |

## 已收录的包

### `mcpplibs` — 模块化库

| 包名 | 版本 | 简介 | 仓库 |
|------|------|------|------|
| `cmdline` | 0.0.2 | 命令行解析框架 — `import mcpplibs.cmdline;` | [mcpplibs/cmdline](https://github.com/mcpplibs/cmdline) |
| `tinyhttps` | 0.2.2 | 轻量 HTTP/HTTPS 客户端(SSE 流式) — `import mcpplibs.tinyhttps;` | [mcpplibs/tinyhttps](https://github.com/mcpplibs/tinyhttps) |
| `llmapi` | 0.2.5 | 大语言模型 API 客户端(OpenAI/Anthropic 兼容) — `import mcpplibs.llmapi;` | [mcpplibs/llmapi](https://github.com/mcpplibs/llmapi) |
| `xpkg` | 0.0.39 | xpkg V1 规范的 C++23 参考实现 — `import mcpplibs.xpkg;` | [openxlings/libxpkg](https://github.com/openxlings/libxpkg) |
| `templates` | 0.0.1 | 最小化模块库模板 — `import mcpplibs.templates;` | [mcpplibs/templates](https://github.com/mcpplibs/templates) |

### `mcpplibs.capi` — C API 封装

| 包名 | 版本 | 简介 | 仓库 |
|------|------|------|------|
| `lua` | 0.0.3 | Lua 5.4 C API 的 C++23 模块封装 — `import mcpplibs.capi.lua;` | [mcpplibs/lua](https://github.com/mcpplibs/lua) |

### `compat` — 非模块化兼容库

> 这些库的上游没有 C++23 模块化支持,mcpp 通过 Form B 描述文件提供兼容性构建。
> 建议优先使用对应的模块化封装(如 `mcpplibs.capi.lua` 替代 `compat.lua`)。

| 包名 | 版本 | 简介 |
|------|------|------|
| `ftxui` | 6.1.9 | C++ 函数式终端 UI 库(screen + dom + component) |
| `gtest` | 1.15.2 | Google Test 测试框架 |
| `mbedtls` | 3.6.1 | TLS/加密库(纯 C) |
| `lua` | 5.4.7 | Lua 脚本语言(纯 C 嵌入式库) |

### 依赖关系链

```
mcpplibs:llmapi
  └── mcpplibs:tinyhttps
        └── compat:mbedtls       ← mcpp 自动传递,无需手动声明

mcpplibs:xpkg
  └── mcpplibs.capi:lua
        └── compat:lua           ← 同上
```

mcpp 0.0.3+ 的 transitive walker 自动沿链路传播头文件和依赖,消费者只需声明直接依赖。

## 包描述文件

每个包对应一个 `pkgs/<首字母>/<包名>.lua` 文件,遵循 [xpkg V1 规范](https://github.com/d2learn/xim-pkgindex/blob/main/docs/V1/xpackage-spec.md)。

### 两种形式

**Form A** — 上游自带 `mcpp.toml`,描述文件只声明元数据和下载地址:

```lua
package = {
    spec = "1",
    name = "mcpplibs.tinyhttps",
    xpm = {
        linux   = { ["0.2.2"] = { url = "...", sha256 = "..." } },
        macosx  = { ["0.2.2"] = { url = "...", sha256 = "..." } },
        windows = { ["0.2.2"] = { url = "...", sha256 = "..." } },
    },
}
```

**Form B** — 上游没有 `mcpp.toml`,在描述文件里内联构建信息:

```lua
package = {
    spec = "1",
    name = "ftxui",
    xpm = { ... },
    mcpp = {
        include_dirs = { "*/include", "*/src" },
        sources = {
            "*/src/ftxui/**/*.cpp",
            "!*/src/ftxui/**/*_test.cpp",      -- glob 排除(mcpp 0.0.4+)
            "!*/src/ftxui/**/*_fuzzer.cpp",
        },
        targets = { ["ftxui"] = { kind = "lib" } },
    },
}
```

### 获取方式

mcpp 初次运行时自动 clone 本仓库到 `~/.mcpp/registry/data/mcpp-index/`。后续更新:

```bash
mcpp search <keyword>    # 触发索引刷新 + 搜索
```

也可手动拉取:

```bash
cd ~/.mcpp/registry/data/mcpp-index && git pull
```

## 添加新包

1. Fork 本仓库
2. 在 `pkgs/<首字母>/` 下创建 `<包名>.lua`,参考现有文件([mbedtls.lua](pkgs/m/mbedtls.lua)、[ftxui.lua](pkgs/f/ftxui.lua))
3. 提交 PR — `validate` workflow 自动 lint,`deploy-site` 合入后自动发布到浏览站

详细格式说明见 [mcpp 扩展字段文档](https://github.com/mcpp-community/mcpp/blob/main/docs/04-schema-xpkg-extension.md)。

## 相关链接

| 项目 | 说明 |
|------|------|
| [mcpp](https://github.com/mcpp-community/mcpp) | 现代 C++23 构建 & 包管理工具 |
| [xlings](https://github.com/d2learn/xlings) | mcpp 底层的包安装引擎 + 沙箱环境 |
| [xpkg V1 spec](https://github.com/d2learn/xim-pkgindex/blob/main/docs/V1/xpackage-spec.md) | 包描述文件规范 |
| [mcpplibs](https://github.com/mcpplibs) | mcpp 生态的模块化 C++23 库集合 |
| [xim-pkgindex](https://github.com/d2learn/xim-pkgindex) | xlings 的通用包索引仓库 |

## 社区

- **Issues / 反馈**: [mcpp issues](https://github.com/mcpp-community/mcpp/issues) · [mcpp-index issues](https://github.com/mcpp-community/mcpp-index/issues)
- **讨论 / 论坛**: [d2learn 论坛](https://forum.d2learn.org)
- **mcpplibs 库贡献**: 各库仓库接受 PR,CI 使用 mcpp 构建验证

## License

包描述文件: CC0。各上游库保留其自身许可证。
