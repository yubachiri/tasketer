$(document).on 'turbolinks:load', ->
  $('.sortable-list').sortable
    axis: 'y'
    items: '.item'
    handle: '.draggable_icon'

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = {_method: 'put'}
      params[item_data.modelName] = {row_order_position: item.index()}
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
