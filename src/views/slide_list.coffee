sencha_touch_slides.views.SlideList = Ext.extend(Ext.List,
  # All we need to do for this list is tell it which data
  # store to use. It'll do the rest
  store: sencha_touch_slides.stores.slides
)
