all: build up

build:
	docker-compose build

down:
	docker-compose down

up:
	docker-compose up -d

.PHONY: all build down up
