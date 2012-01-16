sencha_touch_slides.views.Viewport = Ext.extend(Ext.Panel,
  fullscreen: true,
  layout: 'card',
  cardSwitchAnimation: 'slide',
  initComponent: ->
    # This method is fired when the component is setup
    # This is where we want to actually load up our views
    
    # We want to add the following collection of views
    # to a single array in our 'views' namespace
    sencha_touch_slides.views.slides = []
    sencha_touch_slides.stores.slides.data.each( (record) ->
      sencha_touch_slides.views.slides.push(
        new sencha_touch_slides.views.SlideDisplay().setRecord(record)
      )
    )

    # Tell the viewport that it contains our slides
    this.items = [sencha_touch_slides]

    # We need to call the superclass of this Viewport (Ext.Panel),
    # to let this loaded event bubble up the tree
    sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments)    
)

