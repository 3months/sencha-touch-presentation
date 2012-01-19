presentation.stores.slides = new Ext.data.Store(
  model: 'presentation.models.Slide',
  sorters: [
    {
      property: 'sequence',
      direction: 'ASC'
    }
  ]
  
  # The proxy is incredibly powerful. It's the interface between
  # your datastore and your application. Sencha Touch supports
  # session storage, local storage, and AJAX out of the box

  proxy: {
    type: 'ajax',
    url: 'data/slides.json',
    reader: {
      type: 'json',
      root: 'slides'
    },
    listeners: {
      exception: (store, response, op) ->
        # Normally you will be running your Sencha Touch
        # application from either a webserver or at the 
        # very least, retrieving your records from a webserver
        #
        # We are using a local JSON file, and Sencha Touch is being
        # good and telling us that the response failed (because files 
        # loaded from the filesystem have a response status of 0, not 200, 304 etc
        # Let's catch 0 status codes, and callback to Sencha telling it
        # that the request worked
        #
        # Typically, you can also use the 'exception' event on a datastore
        # to trigger authentication, log things, etc.
        #
        if (response.status == 0)
          op.request.callback.call(op.request.scope, null, true, response)
    }
  },
  autoLoad: true
)
