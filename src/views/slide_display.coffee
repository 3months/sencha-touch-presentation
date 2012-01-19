presentation.views.SlideDisplay = Ext.extend(Ext.Panel,
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
          ui: 'back',
          id: 'backbutton',
          listeners: {
            tap: ->
              Ext.dispatch(
                controller: presentation.controllers.slides
                action: 'show'
                slide: presentation.views.slideDisplay.items.first().record
              )
          }
        ),
        new Ext.Spacer(),
        new Ext.Button(
          text: 'Forward',
          ui: 'forward',
          id: 'forwardbutton',
          listeners: {
            tap: ->
              Ext.dispatch(
                controller: presentation.controllers.slides,
                action: 'show',
                slide: presentation.views.slideDisplay.items.first().record,
                forward: true
              )
          }
        )
      ]
    )
  ]

  items: [ 
    new Ext.Panel(
      autoHeight: true,
      layout: 'fit',
      styleHtmlContent: true,
      tpl: new Ext.XTemplate(
        '<tpl for=".">',
          '<div class="slide">',
            '<section class="content">{content_markup}</section>',
          '</div>',
        '</tpl>'
      ),
      
      # This is our own method - we are defining this, because we don't just want
      # to update this component - we also want to change some other things on the opage
      updateWithRecord: (record) ->
        this.record = record
        this.update(this.record.data)

        parent = presentation.views.slideDisplay
        toolbar = parent.getDockedItems()[0]
        toolbar.setTitle(record.get('title'))

        navbar = parent.getDockedItems()[1]
        navbar.setTitle(
          "#{record.get('sequence')} of #{presentation.stores.slides.getCount()}"
        )

        if (record == presentation.stores.slides.first())
          navbar.getComponent('backbutton').disable()
        else
          navbar.getComponent('backbutton').enable()

        if (record == presentation.stores.slides.last())
          navbar.getComponent('forwardbutton').disable()
        else
          navbar.getComponent('forwardbutton').enable()
    )
  ],

  initComponent: ->
    # We need to call the superclass of this Panel
    # to let this loaded event bubble up the tree
    presentation.views.Viewport.superclass.initComponent.apply(this, arguments)   
)
