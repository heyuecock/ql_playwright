FROM whyour/qinglong:debian

# 安装系统依赖和 Python3 pip、ffmpeg（官方源）
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

# 安装 Node.js 18（官方源）
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# 安装 Python Playwright 包和 Firefox 浏览器
RUN pip3 install --no-cache-dir playwright && \
    playwright install firefox

WORKDIR /ql

# 保持原镜像默认入口，不覆盖 CMD
