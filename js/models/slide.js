(function() {

  sencha_touch_slides.models.Slide = Ext.regModel('sencha_touch_slides.models.Slide', {
    fields: [
      {
        name: 'title',
        type: 'string'
      }, {
        name: 'content',
        type: 'string'
      }, {
        name: 'sequence',
        type: 'int'
      }
    ],
    validations: [
      {
        type: 'presence',
        name: 'content'
      }
    ]
  });

}).call(this);
