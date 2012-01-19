presentation.views.Viewport = Ext.extend(Ext.Panel,
  fullscreen: true,
  layout: 'card',
  cardSwitchAnimation: 'cube',
  initComponent: ->
    Ext.apply(presentation.views, {
      slideDisplay: new presentation.views.SlideDisplay()
    })

    # We need to call the superclass of this Viewport (Ext.Panel),
    # to let this loaded event bubble up the tree
    presentation.views.Viewport.superclass.initComponent.apply(this, arguments)    
)

