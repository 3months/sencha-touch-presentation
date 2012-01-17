(function() {

  sencha_touch_slides.views.Viewport = Ext.extend(Ext.Panel, {
    fullscreen: true,
    layout: 'card',
    cardSwitchAnimation: 'slide',
    initComponent: function() {
      Ext.apply(sencha_touch_slides.views, {
        slideDisplay: new sencha_touch_slides.views.SlideDisplay()
      });
      return sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments);
    }
  });

}).call(this);
