FROM golang:alpine AS builder
WORKDIR /go/src
COPY . .
RUN go get && go build -o /go/src/app

FROM alpine
COPY --from=builder  /go/src/app /app
CMD ["./app"]
ENTRYPOINT [ "/app" ]