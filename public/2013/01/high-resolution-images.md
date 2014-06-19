If your website serves images, you need to be able to support
displaying high resolution images. On "retina" devices normal images will
look a bit blurry since they now take up more pixels than they would
before.

Since I've been using [Backbone](http://backbonejs.org) a lot, here
is how I generally handle the issue of loading the appropriate image
for a user's device.

You can start with a normal `<img>` tag, but you must add a `height`
and/or `width` either directly to the html or through css. I then add
a few custom html attributes to hold the normal and high resolution
image urls. You can leave the `src` attribute blank if you'd like.

{% gist 4525775 sample.html %}

In my example, I will show an image that is 100px x 100px. For higher
resolution devices I will use an image that is 200px x 200px, but
the explicit dimensions on the `<img>` will force the image to be
scaled down and look crisp on the device.

The bulk of the code will check for our custom html attributes on
the `<img>` and attempt to show the first one it can successfully load.

{% gist 4525775 image.js %}

You can initialize the new view with something list this:

{% gist 4525775 main.js %}

If you'd rather not have the images load right away, you can tweak
the code in `initialize` so that `loadImage` is not called right away.
