(function() {

  Ext.regApplication({
    name: 'sencha_touch_slides',
    launch: function() {
      sencha_touch_slides.views.viewport = new sencha_touch_slides.views.Viewport();
      return Ext.dispatch({
        controller: sencha_touch_slides.controllers.slides,
        action: 'show'
      });
    }
  });

}).call(this);
