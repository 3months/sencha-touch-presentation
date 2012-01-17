sencha_touch_slides.models.Slide = Ext.regModel('sencha_touch_slides.models.Slide',
  
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
)
