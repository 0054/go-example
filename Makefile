all: build stop run

build:
	docker build -t go-example .

run:
	docker run --rm -d -p 8080:8080 --name go-example go-example

stop: 
	docker stop go-example || true
