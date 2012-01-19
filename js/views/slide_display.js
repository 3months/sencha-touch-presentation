(function() {

  presentation.views.SlideDisplay = Ext.extend(Ext.Panel, {
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
            id: 'backbutton',
            listeners: {
              tap: function() {
                return Ext.dispatch({
                  controller: presentation.controllers.slides,
                  action: 'show',
                  slide: presentation.views.slideDisplay.items.first().record
                });
              }
            }
          }), new Ext.Spacer(), new Ext.Button({
            text: 'Forward',
            ui: 'forward',
            id: 'forwardbutton',
            listeners: {
              tap: function() {
                return Ext.dispatch({
                  controller: presentation.controllers.slides,
                  action: 'show',
                  slide: presentation.views.slideDisplay.items.first().record,
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
        styleHtmlContent: true,
        tpl: new Ext.XTemplate('<tpl for=".">', '<div class="slide">', '<section class="content">{content_markup}</section>', '</div>', '</tpl>'),
        updateWithRecord: function(record) {
          var navbar, parent, toolbar;
          this.record = record;
          this.update(this.record.data);
          parent = presentation.views.slideDisplay;
          toolbar = parent.getDockedItems()[0];
          toolbar.setTitle(record.get('title'));
          navbar = parent.getDockedItems()[1];
          navbar.setTitle("" + (record.get('sequence')) + " of " + (presentation.stores.slides.getCount()));
          if (record === presentation.stores.slides.first()) {
            navbar.getComponent('backbutton').disable();
          } else {
            navbar.getComponent('backbutton').enable();
          }
          if (record === presentation.stores.slides.last()) {
            return navbar.getComponent('forwardbutton').disable();
          } else {
            return navbar.getComponent('forwardbutton').enable();
          }
        }
      })
    ],
    initComponent: function() {
      return presentation.views.Viewport.superclass.initComponent.apply(this, arguments);
    }
  });

}).call(this);
