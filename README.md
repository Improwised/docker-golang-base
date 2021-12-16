# Base Image for Go Applications

* Alpine base
* Dockerize
* Other utilities for easier debugging

## Usage

Example usage as a base image

```
# Build Stage
FROM golang:1.17-alpine AS build
WORKDIR /go/src/app
RUN CGO_ENABLED=0 go build -o app

# Run Stage
FROM docker.io/improwised/golang-base

COPY --from=build /go/src/app /app

CMD ["/app/my-app"]
```
