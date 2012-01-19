(function() {

  presentation.stores.slides = new Ext.data.Store({
    model: 'presentation.models.Slide',
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
        type: 'json'
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
