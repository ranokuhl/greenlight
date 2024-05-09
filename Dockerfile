# FROM registry.access.redhat.com/ubi9/go-toolset:1.19.13-4.1697647145
FROM registry.access.redhat.com/ubi9/go-toolset:1.21.9-1.1714671022

# COPY . .
# RUN go mod download

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# RUN mkdir -p /build
RUN go build -buildvcs=false -o /tmp/app/myapp ./cmd/api 
# RUN CGO_ENABLED=0 GOOS=linux go build -o myapp

# Start from a minimal base image
# FROM gcr.io/distroless/base-debian10

# Copy the binary built in the previous stage
RUN echo "Copying binary from build stage"
RUN pwd
# run ls -la .
# run ls -la /tmp/app
# run ls -la /tmp/app/myapp
# COPY --from=build /tmp/app/myapp /myapp

#COPY --from=build /tmp/app/myapp /

# ENTRYPOINT ["/myapp"]

RUN pwd

# RUN go build -buildvcs=false -o ./main
# RUN go build -o cmd/api ./cmd/api
# RUN go build -o ./bin/main ./cmd/api




# ENV PORT 8081
# EXPOSE 8081

CMD [ "/tmp/app/myapp -db-max-open-conns=50 -db-max-idle-conns=50 -db-max-idle-time=2h30m" ]
