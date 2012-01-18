sencha_touch_slides.views.Viewport = Ext.extend(Ext.Panel,
  fullscreen: true,
  layout: 'card',
  cardSwitchAnimation: 'cube',
  initComponent: ->
    Ext.apply(sencha_touch_slides.views, {
      slideDisplay: new sencha_touch_slides.views.SlideDisplay()
    })

    # We need to call the superclass of this Viewport (Ext.Panel),
    # to let this loaded event bubble up the tree
    sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments)    
)

