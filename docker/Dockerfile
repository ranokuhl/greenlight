# FROM registry.access.redhat.com/ubi9/go-toolset:1.19.13-4.1697647145
FROM registry.access.redhat.com/ubi9/go-toolset:1.21.9-1.1714671022

COPY . .
RUN go mod download

# RUN go build -buildvcs=false -o ./main
# RUN go build -o cmd/api ./cmd/api
# Build the application with verbose output
RUN go build -x -o ./bin/main ./cmd/api


ENV PORT 8081
EXPOSE 8081

CMD [ "./bin/main -db-max-open-conns=50 -db-max-idle-conns=50 -db-max-idle-time=2h30m" ]
