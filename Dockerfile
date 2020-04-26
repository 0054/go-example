FROM golang:1.14.2 AS build
WORKDIR /src/
COPY . /src/
RUN useradd  -u 10999 user
RUN  CGO_ENABLED=0 go build -o /src/webserver

FROM scratch
COPY --from=build /src/webserver /bin/webserver
COPY --from=build /etc/passwd /etc/passwd
USER user
EXPOSE 8080
ENTRYPOINT ["/bin/webserver"]

# FROM golang:1.14.2
# WORKDIR /go/src/app
# COPY . .
# RUN  go build -o webserver .
# EXPOSE 8080
# CMD ["./webserver"] 

