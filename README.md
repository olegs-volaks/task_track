# Task Track - simple TO-DO application in Ruby on Rails 7 with View Component

## Main technologies used

- Ruby 3.3.1
- Ruby on Rails 7.1.3
- PostgreSQL database
- Hotwire Turbo
- Hotwire stimulus
- jsbundling-rails with esbuild
- cssbundling-rails with Bootstrap
- Devise - for authorization
- Ransack - for searching
- View Component - as a replacement for the presenter pattern
- Docker Compose for development environment

## Setup

Setup application development environment with Docker Compose.

- `bin/setup` - run docker compose services build and setup for using (run migrations, prepare test database, import
  development database dump).

## Run

Run application development environment with Docker Compose

- `docker compose up -d` - run application (http://localhost:3000/).
- `docker compose down` - stop application.
- Prepared data, imported from a database dump (_All data is randomly generated using AI_):
  - Users: 100 randomly generated with:
    - email: user.`n`@example.com (`n` - from 0 to 99, example: `user.0@example.com`);
    - password: `123456` (for all users).
  - Tasks: 500 randomly generated tasks, randomly associated with users.

## Tests

- `docker compose exec app rspec` - run application tests with RSpec.
- The application contains a minimum number of unit tests and does not cover testing of the UI part of the application.
