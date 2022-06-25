OS=ubuntu

help:
	echo "hello"

setup:
	./installer/setup.sh ${OS}

build:
	docker-compose build $(OS)
	docker build --no-cache ./dockerfiles/$(OS) -t dotfiles:$(OS)

build-all:
	docker-compose build

run:
	docker-compose run $(OS)
