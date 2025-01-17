FROM registry.suse.com/suse/sle15:15.6.47.17.2

ARG TARGETARCH

RUN    rm /usr/lib/zypp/plugins/services/container-suseconnect; \
       if [ "$TARGETARCH" = "amd64" ]; then ARCH="x86_64"; DIST="sles15sp6"; fi; \
       if [ "$TARGETARCH" = "arm64" ]; then ARCH="aarch64"; DIST="sles15sp6a64"; fi; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/$DIST/ SLE-Product-SLES15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-product-sles15-sp6-updates-$ARCH/$DIST/ SLE-Product-SLES15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-basesystem15-sp6-pool-$ARCH/$DIST/ SLE-Module-Basesystem15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-basesystem15-sp6-updates-$ARCH/$DIST/ SLE-Module-Basesystem15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-devtools15-sp6-pool-$ARCH/$DIST/ SLE-Module-DevTools15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-devtools15-sp6-updates-$ARCH/$DIST/ SLE-Module-DevTools15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-desktop-applications15-sp6-pool-$ARCH/$DIST/ SLE-Module-Desktop-Applications15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-desktop-applications15-sp6-updates-$ARCH/$DIST/ SLE-Module-Desktop-Applications15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-server-applications15-sp6-pool-$ARCH/$DIST/ SLE-Module-Server-Applications15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-server-applications15-sp6-updates-$ARCH/$DIST/ SLE-Module-Server-Applications15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-containers15-sp6-pool-$ARCH/$DIST/ SLE-Module-Containers15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-containers15-sp6-updates-$ARCH/$DIST/ SLE-Module-Containers15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-packagehub-subpackages15-sp6-pool-$ARCH/$DIST/ SLE-Module-Packagehub-Subpackages15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-packagehub-subpackages15-sp6-updates-$ARCH/$DIST/ SLE-Module-Packagehub-Subpackages15-SP6-Update; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-public-cloud15-sp6-pool-$ARCH/$DIST/ SLE-Module-Public-Cloud15-SP6-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-sle-module-public-cloud15-sp6-updates-$ARCH/$DIST/ SLE-Module-Public-Cloud15-SP6-Updates; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-suse-packagehub-15-sp6-backports-pool-$ARCH/$DIST/ SUSE-PackageHub-15-SP6-Backports-Pool; \
zypper ar --no-gpgcheck http://susemanager.suse/ks/dist/child/staging-$DIST-test-suse-packagehub-15-sp6-pool-$ARCH/$DIST/ SUSE-PackageHub-15-SP6-Pool; \
       zypper rr SLE_BCI; \
       zypper ref
RUN    zypper update -y
#RUN    zypper in -y --no-recommends hostname which xinit xhost xorg-x11 xorg-x11-server xrandr xsession icewm-lite xf86-input-evdev xf86-input-libinput xkeyboard-config xinput;
RUN    zypper in -y --no-recommends hostname which xinit xhost xorg-x11 xorg-x11-server xrandr xsession icewm-lite xf86-input-evdev xf86-input-libinput xkeyboard-config xinput procps vim tigervnc;
RUN    zypper clean

RUN    if [ "$TARGETARCH" = "arm64" ]; then \
zypper ar --no-gpgcheck http://susemanager.suse/pub/JP6.1-r36.4.0-Userspace-RPMS-20250116 JP6.1-r36.4.0-Userspace-RPMS-20250116; \
zypper in -y nvidia-jetpack-3d-core  nvidia-jetpack-all nvidia-jetpack-camera nvidia-jetpack-core nvidia-jetpack-cuda nvidia-jetpack-cuda-utils nvidia-jetpack-dla-compiler nvidia-jetpack-firmware nvidia-jetpack-gbm nvidia-jetpack-gstreamer nvidia-jetpack-init nvidia-jetpack-multimedia nvidia-jetpack-multimedia-utils nvidia-jetpack-nvfancontrol nvidia-jetpack-nvml nvidia-jetpack-nvpmodel nvidia-jetpack-nvsci nvidia-jetpack-pva nvidia-jetpack-tools nvidia-jetpack-vulkan-sc-sdk nvidia-jetpack-wayland nvidia-jetpack-x11; \
fi

RUN useradd -m user -u 1000
COPY preferences /etc/icewm/preferences
COPY xinitrc /etc/X11/xinit/xinitrc
COPY xorg.conf.nvidia /etc/X11/xorg.conf.d/xorg.conf

ENV XDG_SESSION_TYPE=x11

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
