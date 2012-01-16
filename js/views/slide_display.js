(function() {

  sencha_touch_slides.views.SlideDisplay = Ext.extend(Ext.Panel, {
    dockedItems: [
      new Ext.Toolbar({
        dock: 'bottom',
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
    setRecord: function(record) {
      this.record = record;
      this.title = record.get('title');
      return this;
    }
  });

}).call(this);
