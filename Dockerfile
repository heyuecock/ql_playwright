# 使用稳定的 Debian 12 基础镜像 from whyour/qinglong
FROM whyour/qinglong:debian

# 使用 root 用户安装依赖
USER root

# （可选）替换为阿里云源，提升国内访问速度，视情况取消注释
# RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
#     sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

# 安装系统依赖并清理 apt 缓存减小镜像大小
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxcomposite1 libgtk-3-0 libatk1.0-0 libatk-bridge2.0-0 libasound2 libnss3 \
    libx11-xcb1 libxdamage1 libxrandr2 libgbm1 libcups2 libxfixes3 libpango1.0-0 \
    libcairo2 libxshmfence1 libwayland-client0 libwayland-cursor0 fonts-liberation \
    libharfbuzz0b libjpeg62-turbo libwebp6 libxtst6 libevent-2.1-7 libicu70 libdbus-1-3 \
    libexpat1 libfontconfig1 python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# 升级 pip 并安装 playwright
RUN pip3 install --upgrade pip && \
    pip3 install playwright && \
    python3 -m playwright install

# 切回非 root 用户 node，保证安全运行
USER node

# 设置默认命令，可根据需要调整
CMD ["bash"]
