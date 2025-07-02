FROM whyour/qinglong:debian

# 安装系统依赖，删除不必要的包，删缓存，避免带有开发和建议包
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

# 安装 Node.js 18（干净安装，去除包缓存）
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install -g npm@latest && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 安装 playwright 和 firefox
RUN pip3 install --no-cache-dir playwright && \
    playwright install firefox && \
    # 清理安装过程中临时文件
    rm -rf ~/.cache/pip ~/.cache/ms-playwright /root/.cache

WORKDIR /ql

# CMD保持青龙默认，或者根据需求定制
