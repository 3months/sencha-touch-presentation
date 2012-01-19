(function() {

  presentation.controllers.slides = new Ext.Controller({
    show: function(options) {
      var next_slide, slide_index;
      if ((options.slide != null)) {
        slide_index = presentation.stores.slides.indexOf(options.slide);
        if (options.forward != null) {
          slide_index += 1;
        } else {
          slide_index -= 1;
        }
      }
      if ((next_slide = presentation.stores.slides.getAt(slide_index))) {} else {
        next_slide = options.slide != null ? options.slide : presentation.stores.slides.first();
      }
      presentation.views.slideDisplay.items.first().updateWithRecord(next_slide);
      return presentation.views.viewport.setActiveItem(presentation.views.slideDisplay);
    }
  });

}).call(this);
