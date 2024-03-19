# Stage 1: Build the Go application
FROM golang:alpine AS builder
WORKDIR /go/src
COPY . .
RUN go get && go build -o /go/src/app

# Stage 2: Create the final image
FROM alpine
WORKDIR /app

# Copy the built executable from the previous stage
COPY --from=builder /go/src/app .

# Copy the .env file to the application directory
COPY .env .

# Set the entry point for the container
CMD ["./app"]