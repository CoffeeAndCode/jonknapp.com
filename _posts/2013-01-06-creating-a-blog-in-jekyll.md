---
layout: post
title: Creating a Blog in Jekyll
---

Here's a walkthrough for getting your Jekyll site up and runnning. It's based
on my experiences creating [jonknapp.com](http://jonknapp.com). You can
follow along in the
[source code for the website](https://github.com/CoffeeAndCode/jonknapp.com)
on Github.

## Prerequisites

I use [RVM](https://rvm.io) to manage my project gemsets (Ruby libraries). If
you do not manage your gems, I would recommend checking it out. Install it now
and you'll be able to follow along. If you use a different gem management service,
or would like to skip gemset management, just bypass the RVM setup.


## Project Setup // [example code](https://github.com/CoffeeAndCode/jonknapp.com/commit/8a10319ae58dce3bfd13828d97bb1ea2e82cd0f8)

To get started, create a new folder that you will host your project out of.
Create a file called `.rvmrc` and put it in the folder. Here's mine:

{% gist 4439954 .rvmrc %}

If you change out and then back into the working directory from the command
line, you should get a message from RVM asking for permission to create a gemset.

{% image_path rvmrc-command-line.png "rvmrc command line example" %}

Go ahead and accept and you're ready to install the project gems.

I use [Bundler](http://gembundler.com) to manage the gems used in each project.
After adding a `Gemfile` file to the project, you can run `bundle install` to
automatically install the project dependencies. Here's my `Gemfile`:

{% gist 4439954 Gemset %}

If you don't have Bundler installed, you can run `gem install bundler` first.


### Note:

I had some issues installing some of the gems and had to end up symlinking
`/usr/bin/gcc` to `/usr/bin/gcc-4.2`. If you continue to have issues with gcc,
you can try out [OSX gcc installer](https://github.com/kennethreitz/osx-gcc-installer).


## Setting up Jekyll // [code](https://github.com/CoffeeAndCode/jonknapp.com/commit/4f45e9d54e1bf87d6f3c121c8a45bc53e8389b5b)

You'll want to create a `.gitignore` file to ignore the statically compiled site
that Jekyll outputs.

{% gist 4439965 .gitignore %}

Create a `_config.yml` file for supplying the configuration for Jekyll.

{% gist 4439965 _config.yml %}

Create a few html files for your page layouts: `default.html` and `post.html`

{% gist 4439965 _layouts__default.html %}
{% gist 4439965 _layouts__post.html %}

An `index.html` page for your site that will list all your posts:

{% gist 4439965 index.html %}

As well as a sample "post":

    ---
    layout: post
    title: Hello Jekyll
    ---

    Welcome to Jekyll.

Finally, you can start Jekyll with `jekyll --server` and view your website
at [http://0.0.0.0:4000](http://0.0.0.0:4000).

Using my `_config.yml` file will not publish future posts. You can view
future posts with `jekyll --server --future`.


### Note:

Sometimes, you will need to restart the local jekyll server depending on what
files you change. If you are running into problems, make sure to start
with restarting the local Jekyll server.


## Making a Website // [code](https://github.com/CoffeeAndCode/jonknapp.com/commit/94d48eb143166c316ca04aa7aaea8215a2156510)

Time to break out your website knowledge and tweak the `default.html` template.
You can add a `favicon.ico`, `robots.txt` file, a main stylesheet, etc. Jekyll
will automatically include any files/folders in your project that do not begin
with an underscore.
