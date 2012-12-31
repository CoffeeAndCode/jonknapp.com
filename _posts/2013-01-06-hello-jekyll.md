**WARNING: *This is a work in progress!* **

---

# Hello Jekyll
## Creating a Website with Jekyll

* [Sample Project](https://github.com/CoffeeAndCode/jonknapp.com)
* We will use Markdown using the "[rdiscount](https://github.com/rtomayko/rdiscount)" gem.
* Posts will be in the format "http://url/year/month/title"


### Files

**.rvmrc**

    rvm use 1.9.3@jonknapp.com --create


**Gemset**

    source "http://rubygems.org"
    gem "jekyll"
    gem "rdiscount"


## Project Setup // [code](https://github.com/CoffeeAndCode/jonknapp.com/commit/8a10319ae58dce3bfd13828d97bb1ea2e82cd0f8)

1. install RVM
2. execute `.rvmrc` file
3. install Bundler if needed: `gem install bundler`
4. install project gems: `bundle install`


## Setting up Jekyll // [code]()

1. create`.gitignore`:
        _site/

2. add `_config`:
        auto: true
        exclude: ['Gemfile', 'Gemfile.lock', 'README.md']
        future: false
        markdown: rdiscount
        paginate: 10
        permalink: /:year/:month/:title
        rdiscount extensions: [smart]

3. create files/folders:
    * `_layouts` folder
    * `_layouts/default.html`
    * `_layouts/post.html`
    * `_posts` folder
    * `index.html` file

    I started my base project with files based on:

4. start jekyll: `jekyll --server`. Using my `_config.yml` file will not publish
future posts. You can view future posts with `jekyll --server --future`.

5. check out [http://0.0.0.0:4000](http://0.0.0.0:4000). It should show your `index.html` page along with a list of your individual posts in the `_posts` folder.
