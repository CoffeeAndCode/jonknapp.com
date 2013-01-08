# The Officially Official Website of Jonathan Knapp

This project uses [Jekyll](http://jekyllrb.com) to create a static
website which uses [Markdown](http://daringfireball.net/projects/markdown) syntax
to create the content.


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

You can now build the website by running `jekyll`, or create a local webserver with `jekyll --server`.


## License

<a rel="license" href="http://opensource.org/licenses/MIT">
<img alt="MIT license" height="40" src="http://upload.wikimedia.org/wikipedia/commons/c/c3/License_icon-mit.svg" /></a>
This project and blog code samples are released under the [MIT license](http://opensource.org/licenses/MIT).

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/">
<img alt="Creative Commons License" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a> Blog post content is released under a <a rel="license"
href="http://creativecommons.org/licenses/by/3.0/">
Creative Commons Attribution 3.0 Unported License</a>, however you must link back to the original content whenever possible.