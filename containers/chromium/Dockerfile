#!BuildTag: chromium

FROM opensuse/leap:15.5

RUN zypper in -y chromium xorg-x11-fonts libX11-xcb1 libgtk-3-0 libavcodec58_134 libpulse0; zypper clean -a

RUN useradd -m user -u 1000
ENV DISPLAY=":0"

CMD ["/bin/bash", "-c", "chromium --kiosk $URL"]
