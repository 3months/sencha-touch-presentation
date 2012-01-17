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
            ui: 'back',
            listeners: {
              tap: function() {
                return Ext.dispatch({
                  controller: sencha_touch_slides.controllers.slides,
                  action: 'show',
                  slide: sencha_touch_slides.views.slideDisplay.items.first().record
                });
              }
            }
          }), new Ext.Spacer(), new Ext.Button({
            text: 'Forward',
            ui: 'forward',
            listeners: {
              tap: function() {
                return Ext.dispatch({
                  controller: sencha_touch_slides.controllers.slides,
                  action: 'show',
                  slide: sencha_touch_slides.views.slideDisplay.items.first().record,
                  forward: true
                });
              }
            }
          })
        ]
      })
    ],
    items: [
      new Ext.Panel({
        autoHeight: true,
        layout: 'fit',
        tpl: new Ext.XTemplate('<tpl for=".">', '<div class="slide">', '<section class="content">{content_markup}</section>', '</div>', '</tpl>'),
        updateWithRecord: function(record) {
          var toolbar;
          this.record = record;
          this.update(this.record.data);
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
