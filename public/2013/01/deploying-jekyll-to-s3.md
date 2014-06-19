The new Jekyll site seems to be working great for me so far. Creating content
is extremely easy and I've been able to find plugins to handle any extra
heavy lifting I've needed so far. I've even created a few plugins to
help make templates easier to work with, but I'll talk about those more in
an upcoming post.

Today, I'd like to talk about deployment.

Jekyll outputs the static form of your website into a folder called `_static`
after it is done being built. Since I host the website on
[Amazon S3](http://aws.amazon.com/s3/) I wanted to deploy the entire
contents of that folder to my S3 bucket that the project is hosted from.

Thankfully, it's extremely easy to do with the
[jekyll-s3 plugin](https://github.com/laurilehmijoki/jekyll-s3). Once you install
the gem, you can run `jekyll-s3` from the command line to have
a `_jekyll_s3.yml` file created in your project. You edit that file to specify
the S3 access key, secret key, and the bucket to use. Once adding the required
info you can run `configure-s3-website --config-file _jekyll_s3.yml` to configure
the S3 bucket as a website, and finally `jekyll-s3` again to deploy your files.

The `jekyll-s3` gem has a few other bells and whistles so I encourage you
to checkout the README on the [jekyll-s3 Github](https://github.com/laurilehmijoki/jekyll-s3) page.


## A Dash of Security

If you follow the instructions above, you have enough to deploy your site
and call it a day. But what if you use the same S3 account to host multiple
buckets that contain client / project info? If you use your account's main
S3 access and secret keys then those credentials can access much more content
then they should be allowed to manage.

Amazon Web Services have a nifty service called [IAM](http://aws.amazon.com/iam/)
that allows creation of separate users, groups, and access permissions to your
different AWS services.

Using IAM, I created a new user for the purposes of deploying my website.
Make sure to leave the box checked so that the new user has an access and secret
key generated for them.

{% image_path create-user.png "create user in Amazon IAM" %}

If everything went as expected, you should get a success message and see a
link labeled "Show User Security Credentials". By clicking that, you will
see the newly created access and secret keys. Use those in your `_jekyll_s3.yml`
file instead.

{% image_path new-user-credentials.png "new user credentials in Amazon IAM" %}

At this point, you won't be able to deploy yet. We need to set up what this
new IAM user has permission to do which we can do by creating a
User Policy. Click on the name of the new user, then click the
"Attach User Policy" button that appears.

You should be presented with a modal asking what type of policy you'd like to
make. Choose "Custom Policy" and continue. You can now enter a name for the
policy and the json for the policy itself.

{% image_path create-user-policy.png "new user policy in Amazon IAM" %}

If your S3 bucket was called "example.com", you could use the following policy
to allow your new user to deploy files to it. Since you probably are
using a different bucket name, change any instances of "example.com"
to the S3 bucket that you will be using.

{% gist 4596489 example.com-deploy %}

Once the policy is saved, you should be able to deploy using the `jekyll-s3`
command as normal and your account is now a bit more secure. Your Amazon
credentials are now sandboxed from your other Amazon Web Services and S3 buckets.
