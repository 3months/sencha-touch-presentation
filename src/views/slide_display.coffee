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
          ui: 'back',
          listeners: {
            tap: ->
              Ext.dispatch(
                controller: sencha_touch_slides.controllers.slides
                action: 'show'
                slide: sencha_touch_slides.views.slideDisplay.items.first().record
              )
          }
        ),
        new Ext.Spacer(),
        new Ext.Button(
          text: 'Forward',
          ui: 'forward',
          listeners: {
            tap: ->
              Ext.dispatch(
                controller: sencha_touch_slides.controllers.slides,
                action: 'show',
                slide: sencha_touch_slides.views.slideDisplay.items.first().record,
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
        toolbar = sencha_touch_slides.views.slideDisplay.getDockedItems()[0]
        toolbar.setTitle(record.get('title'))
    )
  ],

  initComponent: ->
    # We need to call the superclass of this Panel
    # to let this loaded event bubble up the tree
    sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments)   
)
