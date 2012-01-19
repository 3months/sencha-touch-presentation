Ext.regApplication(
  name: 'presentation',
  launch: ->
    presentation.views.viewport = new presentation.views.Viewport()
    Ext.dispatch({
      controller: presentation.controllers.slides
      action: 'show'
    })
)
