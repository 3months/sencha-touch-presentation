sencha_touch_slides.stores.slides = new Ext.data.Store(
  model: 'sencha_touch_slides.models.slide',
  
  # The proxy is incredibly powerful. It's the interface between
  # your datastore and your application. Sencha Touch supports
  # session storage, local storage, and AJAX out of the box

  proxy: {
    type: 'ajax',
    url: 'data/slides.json',
    reader: {
      type: 'json'
      root: 'slides'
    }
  },
  autoLoad: true
)
