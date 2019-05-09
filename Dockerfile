FROM golang:alpine AS build
  
RUN mkdir -p /go/src/github.com/google/lvmd
COPY . /go/src/github.com/google/lvmd

WORKDIR /go/src/github.com/google/lvmd
RUN CGO_ENABLED=0 GOOS=linux go build

FROM alpine

LABEL maintainers="Zdns Authors"
LABEL description="K8S Cluster Agent"
RUN apk update && apk add lvm2
ADD tmp/lvmd.sh /lvmd.sh
COPY --from=build /go/src/github.com/google/lvmd/lvmd /lvmd
RUN chmod 755 /lvmd.sh
RUN chmod 755 /lvmd
ENTRYPOINT ["/bin/sh"]
