## Test builds of PHP with minimal extensions for symfony/skeleton

[![Build Status](https://travis-ci.org/Antoine87/minimal-php-ext-symfony.svg?branch=master)](https://travis-ci.org/Antoine87/minimal-php-ext-symfony)

```shell
$ git clone https://github.com/Antoine87/minimal-php-ext-symfony.git
$ cd minimal-php-ext-symfony
$ docker build -t minimal-php-ext-symfony
```

Run an interactive shell from the image and create the skeleton project:

```shell
$ docker run -it -p 8000:8000 minimal-php-ext-symfony
$ composer create-project symfony/skeleton --ignore-platform-reqs
```

Start the server

```shell
$ php -S 0.0.0.0:8000 -t skeleton/public/
```
