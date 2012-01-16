sencha_touch_slides.views.SlideDisplay = Ext.extend(Ext.Panel,
  dockedItems: [
    new Ext.Toolbar(
      dock: 'bottom', # <- Attach at bottom of the window
      items: [
        new Ext.Button(
          text: 'Back',
          ui: 'back'
        ),
        new Ext.Spacer(),
        new Ext.Button(
          text: 'Forward',
          ui: 'forward',
        )
      ]
    )
  ],

  # We use setRecord() in our viewport to load a record into this
  # view. Because this object is just a dumb panel, we need to
  # actually handle the display ourselves. What this is demonstrating, 
  # however, is that any component can be extended with our own behaviour
  # - in this case, we're going to add code to display the slide within
  # the panel content area.
  setRecord: (record) ->
    this.record = record
    this.title = record.get('title')

    # We need to return the Panel object (this) 
    # because we push the returned value of setRecord() onto
    # the array of viewport items
    this
)
