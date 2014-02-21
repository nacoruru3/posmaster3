class Posmaster.Views.ZaikosIndex extends Backbone.View

  template: JST['zaikos/index']
  
  
  initialize: ->
    @collection.on('reset', @render, this)
  
  events:
    'click a.zaiko_value': 'sortvalue'
    'click a.zaiko_update': 'sortdate'
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendZaikos)
    this
    
  appendZaikos: (zaiko) ->
    view = new Posmaster.Views.Zaiko(model: zaiko)
    $('#zaikos').append(view.render().el)
  
  sortvalue : (event) ->
    $(event.target).parent().parent().parent().parent().remove()
    sortname = $(event.target).data('id')
    updown = if sortname is 'valueup' then 'down' else 'up'
    $(@el).html(@template(sortname:$(event.target).data('id'),updown:updown,sortclum:'value'))
    @collection.comparator = if sortname is 'valueup' then (model)-> -model.get 'value' else (model)-> model.get 'value'
    #@collection.comparator = (a,b) -> return (b.get("value") - a.get("value"))
    @collection.sort()
    console.log 'value'
    @collection.each(@appendZaiko2)
  
  sortdate : (event) ->
    $(event.target).parent().parent().parent().parent().remove()
    sortname = $(event.target).data('id')
    updown = if sortname is 'updateup' then 'down' else 'up'
    $(@el).html(@template(sortname:$(event.target).data('id'),updown:updown,sortclum:'update'))
    #@collection.comparator = if sortname is 'updateup' then (zaiko)-> -zaiko.get 'updated_at' else (zaiko)-> zaiko.get 'updated_at'
    @collection.comparator = (a,b) -> return (b.get("updated_at")[5..2] - a.get("updated_at")[5..2])
    @collection.sort()
    @collection.each(@appendZaikos)
  
  appendZaiko2: (zaiko) ->
    view = new Posmaster.Views.Zaiko(model: zaiko)
    $('#zaikos').append(view.render().el)
