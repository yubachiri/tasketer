$(document).on 'turbolinks:load', ->
  sortableFunction('.sortable-list-TopTask', 'TopTask')
  sortableFunction('.sortable-list-NextTask', 'NextTask')
  sortableFunction('.sortable-list-NotImportantTask', 'NotImportantTask')
  sortableFunction('.sortable-list-OtherTask', 'OtherTask')


sortableFunction = (klass, taskType) ->
  targetClasses = [
    '.sortable-list-TopTask',
    '.sortable-list-NextTask',
    '.sortable-list-NotImportantTask',
    '.sortable-list-OtherTask'
  ]

  $(klass).sortable
    items: '.item'
    handle: '.draggable_icon'
    connectWith: targetClasses
    update: (e, ui) ->
      doUpdate(e, ui, taskType)

doUpdate = (e, ui, taskName) ->
  item = ui.item
  item_data = item.data()
  params = {_method: 'put'}
  params[item_data.modelName] = {row_order_position: item.index(), type: taskName}
  $.ajax
    type: 'POST'
    url: item_data.updateUrl
    dataType: 'json'
    data: params

    success: (data, textStatus, jqXHR) ->
      alert data
