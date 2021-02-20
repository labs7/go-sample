FROM golang:latest
WORKDIR /go/src/app
COPY src/main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=0 /go/src/app/main .
COPY files/ .
CMD ["./main"]