(function() {

  sencha_touch_slides.views.SlideDisplay = Ext.extend(Ext.Panel, {
    dockedItems: [
      new Ext.Toolbar({
        dock: 'top'
      }), new Ext.Toolbar({
        dock: 'bottom',
        ui: 'light',
        items: [
          new Ext.Button({
            text: 'Back',
            ui: 'back'
          }), new Ext.Spacer(), new Ext.Button({
            text: 'Forward',
            ui: 'forward'
          })
        ]
      })
    ],
    items: [
      new Ext.DataView({
        store: sencha_touch_slides.stores.slides,
        autoHeight: true,
        itemSelector: 'div.slide',
        emptyText: 'No slide selected.',
        tpl: new Ext.XTemplate('<tpl for=".">', '<section class="content">{content_markup}</section>', '</tpl>'),
        updateWithRecord: function(record) {
          var toolbar;
          this.update(record.data);
          toolbar = sencha_touch_slides.views.slideDisplay.getDockedItems()[0];
          return toolbar.setTitle(record.get('title'));
        }
      })
    ],
    initComponent: function() {
      return sencha_touch_slides.views.Viewport.superclass.initComponent.apply(this, arguments);
    }
  });

}).call(this);
