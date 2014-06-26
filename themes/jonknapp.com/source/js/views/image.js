(function (window, devicePixelRatio, $, View, _) {
  'use strict';

  window.ImageView = View.extend({
    images: null,
    tag: 'img',

    initialize: function(options) {
      this.images = [];
      this.getImageArray();
      this.loadImage();
    },

    getImageArray: function() {
      this.images.unshift(this.$el.attr('data-image'));
      if (devicePixelRatio > 1 &&
          this.$el.attr('data-image-2x')) {
        this.images.unshift(this.$el.attr('data-image-highrez'));
      }
    },

    loadImage: function() {
      var imageURL = this.images.shift();
      if (imageURL) {
        var deferred = $.Deferred();
        var $image = $('<img>');
        $image.on('load', _.bind(function() {
          deferred.resolve();
          this.$el.attr('src', $image.attr('src'));
        }, this));
        $image.on('error', _.bind(function() {
          deferred.reject();
          this.loadImage();
        }, this));
        $image.attr('src', imageURL);
      }
    }
  });
}(window, parseFloat(window.devicePixelRatio), $, Backbone.View, _));
