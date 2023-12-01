build-prod:
	go build -o out/producer util.go producer.go

build-con:
	go build -o out/consumer util.go consumer.go

run-prod: build-prod
	./out/producer getting-started.properties

run-con: build-con
	./out/consumer getting-started.properties 