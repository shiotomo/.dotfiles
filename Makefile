OS=ubuntu

setup:
	./installer/setup.sh ${OS}

mygit:
	./installer/mygit.sh

build:
	docker-compose build ${OS}

run:
	docker-compose run ${OS}
