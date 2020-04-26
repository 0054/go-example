all: build stop run

build:
	docker build -t kofe54/go-example .

run:
	docker run --rm -d -p 8080:8080 --name go-example kofe54/go-example

stop: 
	docker stop go-example || true

deploy:
	oc apply -f manifest/openshift.yaml
