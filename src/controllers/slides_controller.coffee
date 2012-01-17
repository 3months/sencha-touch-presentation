sencha_touch_slides.controllers.slides = new Ext.Controller(
  show: (options) ->
    # We normally set the slide_index as we traverse
    # the slides. If it doesn't already exist, set
    # it to zero

    if (options.slide?)
      sencha_touch.stores.slides.sort('sequence', 'ASC')
      slide_index = sencha_touch_slides.stores.slides.indexOf(options.slide)
      
      if options.forward? then slide_index += 1 else slide_index -= 1
    else
      slide_index = 0

    next_slide = sencha_touch_slides.stores.slides.getAt(slide_index)

    sencha_touch_slides.views.viewport.setActiveItem(
      sencha_touch_slides.views.viewport.items[this.slide_index]
    )
)
