(function() {

  presentation.models.Slide = Ext.regModel('presentation.models.Slide', {
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
          (_base = presentation.models.Slide).markdown_engine || (_base.markdown_engine = new Markdown.getSanitizingConverter());
          return presentation.models.Slide.markdown_engine.makeHtml(record.data.content);
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
