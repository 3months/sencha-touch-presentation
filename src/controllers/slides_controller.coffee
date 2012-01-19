presentation.controllers.slides = new Ext.Controller(
  show: (options) ->
    # We normally set the slide_index as we traverse
    # the slides. If it doesn't already exist, set
    # it to zero

    if (options.slide?)
      slide_index = presentation.stores.slides.indexOf(options.slide)
      
      if options.forward? then slide_index += 1 else slide_index -= 1

    if (next_slide = presentation.stores.slides.getAt(slide_index))
      # Do nothing
    else
      next_slide = if options.slide? then options.slide else presentation.stores.slides.first()

    # Update our slide display
    presentation.views.slideDisplay.items.first().updateWithRecord(next_slide)
    presentation.views.viewport.setActiveItem(
      presentation.views.slideDisplay
    )
)
