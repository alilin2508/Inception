DC := docker compose
DC_FLAGS := -f srcs/docker-compose.yml

all: build up

build:
	$(DC) $(DC_FLAGS) build

down:
	$(DC) $(DC_FLAGS) down

up:
	$(DC) $(DC_FLAGS) up -d

.PHONY: all build down up
