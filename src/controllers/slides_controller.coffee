sencha_touch_slides.controllers.slides = new Ext.Controller(
  show: (options) ->
    # We normally set the slide_index as we traverse
    # the slides. If it doesn't already exist, set
    # it to zero

    this.slide_index ||= -1
    
    if (options.forward)
      this.slide_index += 1
    else
      this.slide_index -= 1

    sencha_touch_slides.views.viewport.setActiveItem(
      sencha_touch_slides.views.viewport.items[this.slide_index]
    )
)
