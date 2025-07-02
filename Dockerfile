FROM whyour/qinglong:debian
USER root

RUN apt-get update && apt-get install -y \
  libxcomposite1 libgtk-3-0 libatk1.0-0 libatk-bridge2.0-0 libasound2 libnss3 libx11-xcb1 libxdamage1 libxrandr2 libgbm1 libcups2 libxfixes3 libpango1.0-0 libcairo2 libxshmfence1 libwayland-client0 libwayland-cursor0 \
  fonts-liberation libwoff1 libharfbuzz0b libjpeg62-turbo libwebp6 libxtst6 libevent-2.1-7 libicu66 libdbus-1-3 libexpat1 libfontconfig1

RUN apt-get install -y python3 python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install playwright && \
    python3 -m playwright install

USER node
