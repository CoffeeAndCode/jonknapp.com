# The Officially Official Website of Jonathan Knapp

This project uses [Jekyll](http://jekyllrb.com) to create a static
site using [Markdown](http://daringfireball.net/projects/markdown) syntax
to create the posts.


## Development

First, install [RVM](https://rvm.io) on your machine. This allows you to
sandbox the version of Ruby and gems (libraries) so they do not clash with
other projects. It's good stuff.

Second, change out of the project directory and back into it. You should be
presented with a prompt from RVM that asks for access to the `.rvmrc` file.
The file will make sure Ruby v1.9.3 is used and gems are sandboxed to a
`jonknapp.com` gemset.

Third, if [Bundler](http://gembundler.com) is not installed, run
`gem install bundler` from the command line.

Lastly, run `bundle install` to download and install any gems necessary for
the project.