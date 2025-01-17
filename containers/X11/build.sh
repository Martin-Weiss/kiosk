#!/bin/bash
VERSION=0.0.4
docker buildx create --use --config buildkitd.toml
#docker buildx build --push --no-cache -t weiss-2.weiss.ddnss.de:5000/base/x11:$VERSION /data/git/kiosk/containers/X11 --platform=linux/arm64/v8,linux/amd64
docker buildx build --push --no-cache -t weiss-2.weiss.ddnss.de:5000/base/x11:$VERSION /data/git/kiosk/containers/X11 --platform=linux/arm64/v8
exit
	&& docker push weiss-2.weiss.ddnss.de:5000/base/x11:$VERSION

