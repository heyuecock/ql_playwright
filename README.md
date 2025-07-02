# Qinglong Playwright Docker 镜像

基于 [whyour/qinglong:debian](https://hub.docker.com/r/whyour/qinglong) 镜像，预装了 Playwright 及其依赖，适合在青龙环境中使用浏览器自动化。

## 镜像说明

- 安装了 Playwright 支持的 Chromium、Firefox、WebKit 浏览器依赖库
- 内置 Python3 和 pip，自动安装 Playwright 包和浏览器二进制
- 非 root 用户 `node` 运行，安全可靠

## 使用方法

```bash
docker run -it --rm yourdockerusername/qinglong-playwright:latest bash
```

然后你可以运行 Python 脚本调用 Playwright。
## 自动构建

本镜像通过 GitHub Actions 定时检测 whyour/qinglong:debian 基础镜像版本更新，自动构建并推送最新镜像。

## 许可

MIT

---

## 额外建议

- 你可以根据需要添加 `.dockerignore` 文件减少构建上下文大小
- 如果你想支持其它注册表，如 GitHub Container Registry，只需修改 GitHub Actions 中登录和推送步骤即可

---

如果你需要，我可以帮你生成完整的 GitHub 仓库压缩包或者仓库 README 的 markdown，你可以直接用来建仓库。需要吗？
