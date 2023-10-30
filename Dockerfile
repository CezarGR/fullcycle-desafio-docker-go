FROM golang:alpine as builder

COPY ./src/ ./src/

WORKDIR /go/src/

RUN go mod init hello-fullcycle-exec && \
    go build

RUN rm -rf ./go/src/hello-fullcycle.go && \
    rm -rf ./go/src/go.mod

FROM scratch

COPY --from=builder ./go/src/ .

CMD [ "./hello-fullcycle-exec"]
