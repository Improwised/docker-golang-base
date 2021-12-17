ARG ALPINE_VERSION="3.15"
FROM docker.io/library/alpine:$ALPINE_VERSION

LABEL maintainer="Pratik Balar <pratik@improwised.com>"
RUN apk add --no-cache bash ca-certificates curl git sudo vim wget
WORKDIR /app
COPY --from=docker.io/powerman/dockerize:0.15.4 /usr/local/bin/dockerize /usr/local/bin/dockerize

ENTRYPOINT ["dockerize"]
