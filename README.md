# README

Run te app n development with: bundle exec rails s -p 3000 -b '0.0.0.0'

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization =>

For development you should create the user and database required by the app
(See config/database.yml)
If using Ubuntu:



    $ sudo su - postgres 
    @postgres@hostname: ~$ psql -U postgres
    @postgres=# CREATE USER ${NAME_OF_THE_USER} WITH LOGIN ENCRYPTED PASSWORD ${PASSWORD_OF_THE_USER}
    @postgres=# CREATE DATABASE ${NAME_OF_DATABASE} WITH OWNER ${NAME_OF_THE_USER}


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
