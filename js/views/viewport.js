(function() {

  presentation.views.Viewport = Ext.extend(Ext.Panel, {
    fullscreen: true,
    layout: 'card',
    cardSwitchAnimation: 'cube',
    initComponent: function() {
      Ext.apply(presentation.views, {
        slideDisplay: new presentation.views.SlideDisplay()
      });
      return presentation.views.Viewport.superclass.initComponent.apply(this, arguments);
    }
  });

}).call(this);
