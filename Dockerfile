FROM golang:latest
WORKDIR /go/src/app
COPY src/main.go .
RUN go build main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=0 /go/src/app/main .
COPY files/ .
CMD ["./main"]