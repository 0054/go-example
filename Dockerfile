# FROM golang:1.14.2 AS build
# WORKDIR /go/src/app
# COPY . .
# RUN  go build -o webserver .

# FROM alpine:latest 
# COPY --from=build /go/src/app/webserver /root/
# RUN ls -la /root/
# EXPOSE 8080

# ENTRYPOINT ["/root/webserver"] 

FROM golang:1.14.2
WORKDIR /go/src/app
COPY . .
RUN  go build -o webserver .
EXPOSE 8080
CMD ["./webserver"] 

