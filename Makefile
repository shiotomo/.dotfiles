OS=ubuntu

setup:
	./installer/setup.sh ${OS}

build:
	docker build --no-cache ./dockerfiles/$(OS) -t dotfiles:$(OS)

run:
	docker run --rm -it dotfiles:$(OS)
