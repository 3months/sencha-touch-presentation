(function() {

  sencha_touch_slides.controllers.slides = new Ext.Controller({
    show: function(options) {
      var next_slide, slide_index;
      if ((options.slide != null)) {
        slide_index = sencha_touch_slides.stores.slides.indexOf(options.slide);
        if (options.forward != null) {
          slide_index += 1;
        } else {
          slide_index -= 1;
        }
      } else {
        slide_index = 0;
      }
      if ((next_slide = sencha_touch_slides.stores.slides.getAt(slide_index))) {} else {
        next_slide = sencha_touch_slides.stores.slides.first();
      }
      sencha_touch_slides.views.slideDisplay.items.first().updateWithRecord(next_slide);
      return sencha_touch_slides.views.viewport.setActiveItem(sencha_touch_slides.views.slideDisplay);
    }
  });

}).call(this);
