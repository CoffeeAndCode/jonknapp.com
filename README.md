# The Officially Official Website of Jonathan Knapp

This project uses [Hexo](http://hexo.io/) to create a static
website which uses [Markdown](http://daringfireball.net/projects/markdown) syntax
to create the content.


## Development

Install [Node](http://nodejs.org/), then install [Grunt](http://gruntjs.com/getting-started)
and [Bower](http://bower.io/) globally.

You can then install dependencies and prepare the theme with:

```shell
npm install
cd themes/jonknapp.com
npm install
bower install
grunt
```

From the root directory, run `hexo server` to start a local version of the website.
You can also run `hexo generate` to build a static version of the site in the
`public/` folder.


### S3 Deployment

To deploy to S3, create a file called `aws.json` that has the following structure:

```json
{
  "bucket": "jonknapp.com",
  "key": "AWS-KEY",
  "secret": "AWS-SECRET"
}
```

You can now deploy the generated site with `grunt`.


## License

<a rel="license" href="http://opensource.org/licenses/MIT">
<img alt="MIT license" height="40" src="http://upload.wikimedia.org/wikipedia/commons/c/c3/License_icon-mit.svg" /></a>
This project and blog code samples are released under the [MIT license](http://opensource.org/licenses/MIT).

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/">
<img alt="Creative Commons License" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a> Blog post content is released under a <a rel="license"
href="http://creativecommons.org/licenses/by/3.0/">
Creative Commons Attribution 3.0 Unported License</a>, however you must link back to the original content whenever possible.
