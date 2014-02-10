class Posmaster.Views.ZaikosIndex extends Backbone.View

  template: JST['zaikos/index']
  
  
  initialize: ->
    @collection.on('reset', @render, this)
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendZaikos)
    this
    
  appendZaikos: (zaiko) ->
    view = new Posmaster.Views.Zaiko(model: zaiko)
    $('#zaikos').append(view.render().el)