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

The admin portal can be found at: `http://localhost:8982/solr/#/`

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

# Production

Install Phusion Passenger with Apache using the following guide:

https://www.phusionpassenger.com/documentation/Users%20guide%20Apache.html#installation

* Compile the Apache module

```
passenger-install-apache2-module
```

* Configure vhost

```apache
<VirtualHost *:80>
    ServerName trains.trefex.com

    DocumentRoot /home/localadmin/webapps/trainsportal/public
    RailsEnv production
    SetEnv SECRET_KEY_BASE secret_key
    <Directory /home/localadmin/webapps/trainsportal/public>
        Allow from all
        Options -MultiViews
        # Uncomment this if you're on Apache >= 2.4:
        #Require all granted
    </Directory>
</VirtualHost>
```

* Install solr

```
curl -O http://ftp.wayne.edu/apache/lucene/solr/5.1.0/solr-5.1.0.tgz
tar xzf solr-5.1.0.tgz solr-5.1.0/bin/install_solr_service.sh --strip-components=2
ls
sudo bash ./install_solr_service.sh solr-5.1.0.tgz
```

* Configure solr

  * Created core `default/conf` folder in `/var/solr/data` to hold core configuration
  * Added sunspot custom schema.xml to `default/conf` and used `solrconfig.xml` from examples section as sunspot one was too old.
  * Created a new core through web portal with settings: default, default, default/data, solrconfig.xml, schema.xml
  * Changed in schema.xml to remove deprecated datatypes as seen here https://groups.google.com/forum/?fromgroups#!topic/ruby-sunspot/hL4-0NqNnqA

* Re-index solr indexes

  ```
  bundle exec rake sunspot:reindex RAILS_ENV="production"
  ```

* Re-generate thumbnails

  ```
  rake paperclip:refresh:missing_styles && rake paperclip:refresh CLASS=Item RAILS_ENV="production"
  ```

*  Recompile assets

  ```
  rake assets:precompile RAILS_ENV="production"
  ```

  Migrate database

  ```
  rake db:setup RAILS_ENV="production"
  ```

* Needed to install ImageMagick on the server, due to the following error:

```
[paperclip] An error was received while processing: #<Paperclip::Errors::CommandNotFoundError: Could not run the `identify` command. Please install ImageMagick.>
```

On Debian, simply do

```
apt-get install imagemagick
```

## License

This code is release under GPL license. Please see the licnese file attached to this repository.
