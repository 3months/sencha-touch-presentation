(function() {

  sencha_touch_slides.controllers.slides = new Ext.Controller({
    show: function(options) {
      this.slide_index || (this.slide_index = -1);
      if (options.forward) {
        this.slide_index += 1;
      } else {
        this.slide_index -= 1;
      }
      return sencha_touch_slides.views.viewport.setActiveItem(sencha_touch_slides.views.viewport.items[this.slide_index]);
    }
  });

}).call(this);
