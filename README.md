# Twitter-Clone

A Twitter like app built using Ruby On Rails.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them:

- [Docker](https://docs.docker.com/)

### Setup

#### 1. Clone the repository

```
git clone git@github.com:ananthkamath/twitter-clone.git && cd twitter-clone
```

#### 2. Build the project

```
docker-compose build
```

#### 3. Start the app

```
docker-compose up
```

#### 4. Run the migrations

```
docker exec -it twitter-clone-app-1 bundle exec rake db:create
docker exec -it twitter-clone-app-1 bundle exec rake db:migrate
```

## To Access The App On Local
[Twitter-Clone](http://localhost:3000/)

## To Run The Tests

You can run all the specs using the following command:

```
docker exec -it twitter-clone_app_1 rspec .
```

If you want to run a single spec, use the following pattern:

```
docker exec -it twitter-clone_app_1 rspec spec/models/tweet_spec.rb
```

## To Access The Logs

You can check the development logs using the following command:

```
docker exec -it twitter-clone_app_1 tail -f log/development.log
```

## Built Using

- [Ruby on Rails](https://rubyonrails.org/) - The web framework used to build the app
- [Docker](https://www.docker.com/) - Used to containerize the app
- [Postgresql](https://www.postgresql.org/) - The database used to store the data

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
