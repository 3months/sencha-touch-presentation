(function() {

  sencha_touch_slides.stores.slides = new Ext.data.Store({
    model: 'sencha_touch_slides.models.Slide',
    sorters: [
      {
        property: 'sequence',
        direction: 'ASC'
      }
    ],
    proxy: {
      type: 'ajax',
      url: 'data/slides.json',
      reader: {
        type: 'json',
        root: 'slides'
      },
      listeners: {
        exception: function(store, response, op) {
          if (response.status === 0) {
            return op.request.callback.call(op.request.scope, null, true, response);
          }
        }
      }
    },
    autoLoad: true
  });

}).call(this);
