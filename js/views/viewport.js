(function() {

  sencha_touch_slides.views.Viewport = Ext.extend(Ext.Panel, {
    fullscreen: true,
    layout: 'card',
    cardSwitchAnimation: 'slide',
    initComponent: function() {
      sencha_touch_slides.views.slides = [];
      sencha_touch_slides.stores.slides.data.each(function(record) {
        return sencha_touch_slides.views.slides.push(new sencha_touch_slides.views.SlideDisplay().setRecord(record));
      });
      this.items = [sencha_touch_slides];
      return sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments);
    }
  });

}).call(this);
