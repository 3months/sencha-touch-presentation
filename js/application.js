(function() {

  Ext.regApplication({
    name: 'presentation',
    launch: function() {
      presentation.views.viewport = new presentation.views.Viewport();
      return Ext.dispatch({
        controller: presentation.controllers.slides,
        action: 'show'
      });
    }
  });

}).call(this);
