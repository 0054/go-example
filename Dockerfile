FROM golang:1.14.2 AS build
WORKDIR /go/src/app
COPY . .
RUN  go build -o webserver .


FROM alpine:latest 
WORKDIR /root/ 
COPY --from=build /go/src/app/webserver .
EXPOSE 8080
CMD ["./webserver"] 

