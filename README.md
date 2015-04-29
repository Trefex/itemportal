[![Code Climate](https://codeclimate.com/github/Trefex/trainsportal/badges/gpa.svg)](https://codeclimate.com/github/Trefex/trainsportal)
[![Build Status](https://travis-ci.org/Trefex/trainsportal.svg)](https://travis-ci.org/Trefex/trainsportal)


# Train portal

This portal is a Ruby on Rails application using Bootstrap 3, Google Open Fonts and FontAwesome.
It is fully RESTful.

## Pre-requisites

This app was tested and developed on Ruby 2.2.1p85, rake 10.4.2, Rails 4.2.1 and rvm 1.26.11.

## Installation

Clone repository and do a

```bash
bundle install
```

## Running the application

```bash
passenger start
```

## Starting solr

In production, use a standalone solr server (check how to configure it).

For development, use the gem sunspot_solr

```
bundle exec rake sunspot:solr:run
```

to start it in the foreground.

```
bundle exec rake sunspot:solr:start
```

to start it in the background.

The admin portal can be found at: `http://localhost:8982/solr/#/``

## Managing commands

Re-index solr indexes

```
bundle exec rake sunspot:reindex
```

Re-generate thumbnails

```
rake paperclip:refresh:missing_styles && rake paperclip:refresh CLASS=Item
```

Recompile assets

```
rake assets:precompile
```

Migrate database

```
rake db:migrate
```

## License

This code is release under GPL license. Please see the licnese file attached to this repository.
