ARG ALPINE_VERSION="3.15"

FROM alpine:$ALPINE_VERSION AS build
RUN apk add --no-cache build-base wget curl \
&& curl -sfL $(curl -s https://api.github.com/repos/powerman/dockerize/releases/latest | grep -i /dockerize-$(uname -s)-$(uname -m) | awk 'NR==1{print $2}' | xargs) | install /dev/stdin /usr/local/bin/dockerize

FROM alpine:$ALPINE_VERSION
LABEL maintainer="Pratik Balar <pratik@improwised.com>"
RUN apk add --no-cache bash ca-certificates curl git sudo vim wget
WORKDIR /app
COPy --from=build /usr/local/bin/dockerize /usr/local/bin/dockerize
ENTRYPOINT ["dockerize"]
