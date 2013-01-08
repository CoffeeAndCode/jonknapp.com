(function ($, Deferred) {
  "use strict";
  Deferred.installInto($);

  $(function() {
    $('pre[data-visible=false]').hide();
  });
}(Zepto, Deferred));
