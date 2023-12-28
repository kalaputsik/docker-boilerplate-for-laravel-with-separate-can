SERVICE_APP=app
SERVICE_NPM=npm
SERVICE_COMPOSER=composer
SERVICE_ARTISAN=artisan
SERVICE_NGINX=nginx

help: ## Print help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

docker-reset: ## Reset docker: Stops and removes all containers, networks, and volumes. Then builds and starts the containers.
	@docker compose down -v --remove-orphans
	@docker compose build --no-cache
	@docker compose up -d --force-recreate --remove-orphans

docker-ps: ## List containers: Lists all running Docker containers.
	@docker ps

docker-clean: ## Clean Docker: Removes all unused containers, networks, images, and volumes.
	@docker compose down -v --remove-orphans
	@docker system prune -af

app-cli: ## CLI into SERVICE_APP: Starts a shell in the app service's container.
	@docker compose exec -it ${SERVICE_APP} sh

create-laravel-project: ## Create Laravel project: Creates a new Laravel project in the app service's container.
	@docker compose run --rm ${SERVICE_COMPOSER} create-project laravel/laravel .

npm-install: ## Install npm packages: Installs npm packages.
	@docker compose run --rm ${SERVICE_NPM} install

artisan-migrate: ## Run artisan migrate
	@docker compose run --rm ${SERVICE_ARTISAN} migrate
