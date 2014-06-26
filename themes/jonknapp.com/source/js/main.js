(function ($, ImageView) {
  'use strict';

  $(function() {
    $('pre[data-visible=false]').hide();
    $('img[data-image]').each(function(index, element) {
      new ImageView({ el: element });
    });
  });
}(jQuery, ImageView));
