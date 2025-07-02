FROM ghcr.io/yuehex15/spaces/qinglong:latest
USER root
RUN apt-get update && apt-get install -y \
  libxcomposite1 libgtk-3-0 libatk1.0-0 libatk-bridge2.0-0 libasound2 libnss3 libx11-xcb1 libxdamage1 libxrandr2 libgbm1 libcups2 libxfixes3 libpango1.0-0 libcairo2 libxshmfence1 libwayland-client0 libwayland-cursor0
USER node
