class Posmaster.Views.Zaiko extends Backbone.View

  template: JST['zaikos/zaiko']
  tagName: 'tr'
  
  events:
    'blur input.zaiko_value': 'updateZaikovalue'
    'submit input.zaiko_value': 'updateZaikovalue'
    'click button.zaiko_destroy': 'destroyZaiko'


  render: ->
    $(@el).html(@template(zaiko: @model))
    this
    
  updateZaikovalue: ->
    value = event.target.value
    unless value is ''
      @model.set(value: value)
      @model.save()
      
  destroyZaiko: (event) ->
    if confirm '削除していいですか？'
      #@model.destroy()
      console.log $(event.target)
      console.log $(event.target).parent().parent()
      id = $(event.target).data('id')
      console.log id
      #$('#tb tr').eq(id).remove();
      $(event.target).parent().parent().remove()
      
