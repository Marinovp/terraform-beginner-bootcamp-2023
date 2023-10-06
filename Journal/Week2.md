# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

## Bundler

Bundler is a package manager for Ruby.
It is the primary way to install Ruby
packages (known as gems) for Ruby.

### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install`
command.

This will install the gems on the system 
globally (unlike nodejs which install 
packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock
down the gem versions used in this project.


### Executing ruby scripts in the contect of bundler

We have to use `bundle exec` to tell 
future ruby scripts to use the gems we installed.
This is the way we set context.

### Sinatra

Is a micro web-framework for ruby to build we-apps

Its great for mock or development server or for very simple projects.

You can create a web-server in a single file.

https://sinatrarb.com/

## Terratown Mock Server

## Runnning the web server

We can run the web server by executing the follwoing commands:
```rb
bundle install
bundle exec ruby server.rb
```

All of te code for our server is stored in the `server.rb` file.