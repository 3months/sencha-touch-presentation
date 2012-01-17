sencha_touch_slides.views.SlideDisplay = Ext.extend(Ext.Panel,
  dockedItems: [
    new Ext.Toolbar(
      dock: 'top'
    ),
    new Ext.Toolbar(
      dock: 'bottom', # <- Attach at bottom of the window
      ui: 'light',
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
  ]

  items: [ 
    new Ext.DataView(
      store: sencha_touch_slides.stores.slides,
      autoHeight: true,
      itemSelector: 'div.slide',
      emptyText: 'No slide selected.'
      tpl: new Ext.XTemplate(
        '<tpl for=".">',
          '<section class="content">{content_markup}</section>',
        '</tpl>'
      ),
      
      # This is our own method - we are defining this, because we don't just want
      # to update this component - we also want to change some other things on the opage
      updateWithRecord: (record) ->
        this.update(record.data)
        toolbar = sencha_touch_slides.views.slideDisplay.getDockedItems()[0]
        toolbar.setTitle(record.get('title'))
    )
  ],

  initComponent: ->
    # We need to call the superclass of this Panel
    # to let this loaded event bubble up the tree
    sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments)   
)
