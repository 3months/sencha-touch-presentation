(function() {

  sencha_touch_slides.stores.slides = new Ext.data.Store({
    model: 'sencha_touch_slides.models.slide',
    proxy: {
      type: 'ajax',
      url: 'data/slides.json',
      reader: {
        type: 'json',
        root: 'slides'
      }
    },
    autoLoad: true
  });

}).call(this);
