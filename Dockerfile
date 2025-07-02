FROM whyour/qinglong:debian

# 安装系统依赖和 curl（青龙脚本需要）
RUN apt-get update && apt-get install -y --no-install-recommends \
      curl \
      ca-certificates \
      fonts-liberation \
      libatk-bridge2.0-0 \
      libatk1.0-0 \
      libatspi2.0-0 \
      libcups2 \
      libdbus-1-3 \
      libdrm2 \
      libgbm1 \
      libgtk-3-0 \
      libnspr4 \
      libnss3 \
      libx11-xcb1 \
      libxcomposite1 \
      libxdamage1 \
      libxrandr2 \
      xdg-utils \
      libasound2 \
      libpangocairo-1.0-0 \
      libpango-1.0-0 \
      python3-pip \
      ffmpeg \
      wget \
    && rm -rf /var/lib/apt/lists/*

# 安装 Node.js 18 (官方源)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install -g npm@latest && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 安装 playwright 和只安装 Firefox 浏览器内核
RUN pip3 install --no-cache-dir playwright && \
    playwright install firefox && \
    # 清理 pip 和 playwright 缓存
    rm -rf ~/.cache/pip ~/.cache/ms-playwright /root/.cache

WORKDIR /ql
