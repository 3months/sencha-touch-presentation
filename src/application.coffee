Ext.regApplication(
  name: 'sencha_touch_slides',
  launch: ->
    sencha_touch_slides.views.viewport = new sencha_touch_slides.views.Viewport()
    Ext.dispatch({
      controller: sencha_touch_slides.controllers.slides
      action: 'show',
      forward: true
    })
)
