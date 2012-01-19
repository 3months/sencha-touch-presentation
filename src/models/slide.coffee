presentation.models.Slide = Ext.regModel('presentation.models.Slide',
  
  # Define the fields that this model has
  # This exposes them to accessors, get() and set(),
  # as well as a range of other methods used for things
  # like displaying forms
  fields: [
    { 
      name: 'title',
      type: 'string', # one of: string, float, bool, int
    },
    {
      name: 'content',
      type: 'string'
    },
    {
      name: 'sequence',
      type: 'int'
    },
    {
      name: 'content_markup',
      type: 'string',
      convert: (v, record) ->
        # First, let's instantiate our Markdown parser
        # Showdown, from Attacklabs - the only decent JS implementation
        # of a Markdown engine - now used by SO

        presentation.models.Slide.markdown_engine ||= new Markdown.getSanitizingConverter()

        # Next, let's parse the 'content' field into markup, and return it

        return presentation.models.Slide.markdown_engine.makeHtml(record.data.content)
    }
  ]

  # We can easily define validations on this model to ensure
  # that data is as we expect. These validations will stop
  # a form from submitting if there is invalid data
  validations: [
    { 
      type: 'presence',
      name: 'content'
    }
  ]

  # We can define helper methods on our models as we would in any other framework
)
