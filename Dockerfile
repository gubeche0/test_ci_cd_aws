FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o /go/bin/app

FROM alpine

COPY --from=builder /go/bin/app /go/bin/app

CMD ["/go/bin/app"]
