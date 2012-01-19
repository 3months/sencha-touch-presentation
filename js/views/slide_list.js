(function() {

  presentation.views.SlideList = Ext.extend(Ext.List, {
    store: presentation.stores.slides
  });

}).call(this);
