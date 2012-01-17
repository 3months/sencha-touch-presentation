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
      }, {
        name: 'content_markup',
        type: 'string',
        convert: function(v, record) {
          var _base;
          (_base = sencha_touch_slides.models.Slide).markdown_engine || (_base.markdown_engine = new Markdown.getSanitizingConverter());
          return sencha_touch_slides.models.Slide.markdown_engine.makeHtml(record.data.content);
        }
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
