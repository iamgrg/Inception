all:
	sudo mkdir -p /home/gansard/data/mariadb
	sudo mkdir -p /home/gansard/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/gansard/data/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean