up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune

show:
	docker ps
	docker volume ls -q
	docker container ls -q

renew:
	make down
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	sudo rm -rf /home/jules/data/wp-website/*
	sudo rm -rf /home/jules/data/wp-database/*
	make up

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

restart:
	make down
	make up

.PHONY: up down clean show renew logs restart