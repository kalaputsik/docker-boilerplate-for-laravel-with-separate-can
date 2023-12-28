
# Docker Setup for Laravel Installation

----

* Duplicate and set up the **.env** file
```bash
cp .env.dist .env
```
* Construct the services
```bash
docker compose up --build
```
* Set up Laravel
```bash
docker compose run --rm composer create-project laravel/laravel .
```
* Install necessary dependencies
```bash
docker compose run --rm npm install
```
* Configure database settings in **src/.env**
```bash
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```
* Execute artisan migrations
```bash
docker compose run --rm artisan migrate
```

----

### The provided Make commands are designed to simplify the management of your Dockerized Laravel application. 

Here's when you might need each command:

- `help`: Use this command when you want to see a list of all available Make commands and their descriptions.

- `docker-reset`: Use this command when you want to completely reset your Docker environment. This is useful when you want to ensure you're working with a clean state.

- `docker-ps`: Use this command when you want to see a list of all currently running Docker containers.

- `docker-clean`: Use this command when you want to clean up your Docker environment by removing all unused Docker containers, networks, images, and volumes.

- `app-cli`: Use this command when you want to start a shell in the app service's container. This is useful when you want to run commands directly in the container.

- `create-laravel-project`: Use this command when you want to create a new Laravel project in the app service's container.

- `npm-install`: Use this command when you want to install npm packages.

- `artisan-migrate`: Use this command when you want to run Laravel's database migrations. This is typically done after you make changes to your database schema.

Remember, to use these commands, you need to run `make <command>`, replacing `<command>` with the name of the command you want to run. For example, `make docker-reset` will run the `docker-reset` command.