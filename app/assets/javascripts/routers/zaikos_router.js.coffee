class Posmaster.Routers.Zaikos extends Backbone.Router

  routes:
    '': 'index'
  
  initialize: ->
    @collection = new Posmaster.Collections.Zaikos()
    @collection.fetch(reset: true)
 
  index: ->
    view = new Posmaster.Views.ZaikosIndex(collection: @collection)
    $('#abcs').html(view.render().el)
