$(document).on 'turbolinks:load', ->
  $('.sortable-list-TopTask').sortable
    items: '.item'
    handle: '.draggable_icon'
    connectWith: ['.sortable-list-NextTask', '.sortable-list-NotImportantTask', '.sortable-list-OtherTask']

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = {_method: 'put'}
      params[item_data.modelName] = {row_order_position: item.index(), type: 'TopTask'}
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params

  $('.sortable-list-NextTask').sortable
    items: '.item'
    handle: '.draggable_icon'
    connectWith: ['.sortable-list-TopTask', '.sortable-list-NotImportantTask', '.sortable-list-OtherTask']

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = {_method: 'put'}
      params[item_data.modelName] = {row_order_position: item.index(), type: 'NextTask'}
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params

  $('.sortable-list-NotImportantTask').sortable
    items: '.item'
    handle: '.draggable_icon'
    connectWith: ['.sortable-list-NextTask', '.sortable-list-TopTask', '.sortable-list-OtherTask']

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = {_method: 'put'}
      params[item_data.modelName] = {row_order_position: item.index(), type: 'NotImportantTask'}
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params

  $('.sortable-list-OtherTask').sortable
    items: '.item'
    handle: '.draggable_icon'
    connectWith: ['.sortable-list-NextTask', '.sortable-list-NotImportantTask', '.sortable-list-TopTask']

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = {_method: 'put'}
      params[item_data.modelName] = {row_order_position: item.index(), type: 'OtherTask'}
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params

# Semantic UI メッセージのクローズ
  $('.message .close').on 'click', ->
    $(this).closest('.message').transition('fade')
  $('.ui.radio.checkbox').checkbox()
  $('.ui.dropdown').dropdown()
  $('.ui.accordion').accordion()
