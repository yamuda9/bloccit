# Bloccit

A Reddit replica to teach the fundamentals of web development and Rails.

This app powers Bloccit at https://morning-ravine-3143.herokuapp.com/

## Getting Started

## Software requirements

- Rails 4.2.4

- Ruby 2.2.3

- PostgreSQL 9.3.x or higher

## Navigate to the Rails application

```
$ cd ~/bloc/code/bloccit
```

## Set configuration files

```
$ cp config/database.yml.template config/database.yml
$ cp config/initializers/mail.rb.template config/initializers/mail.rb
```

## Create the database

```
$ pgstart
$ rake db:create
```

## Migrating and seeding the database

```
$ rake db:migrate
$ rake db:seed
```

## Starting the local server

```
$ rails server

    or

$ rails s
```

## Production Deployment

```
$ git push heroku master
$ heroku run rake db:migrate
```

## Support

Bug reports and feature requests can be filed with the rest for the Ruby on Rails project here:
* [File Bug Reports and Features](https://github.com/yamuda9/bloccit/issues)

## License

Bloccit is released under the <LICENSE-NAME> license.

## Copyright

copyright:: (c) Copyright 2015 Bloccit. All Rights Reserved.
