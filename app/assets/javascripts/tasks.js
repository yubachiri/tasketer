$(document).on('turbolinks:load', function () {
    sortableFunction('.sortable-list-TopTask', 'TopTask');
    sortableFunction('.sortable-list-NextTask', 'NextTask');
    sortableFunction('.sortable-list-NotImportantTask', 'NotImportantTask');
    sortableFunction('.sortable-list-OtherTask', 'OtherTask');
});

function sortableFunction(klass, taskType) {
    var targetClasses = [
        '.sortable-list-TopTask',
        '.sortable-list-NextTask',
        '.sortable-list-NotImportantTask',
        '.sortable-list-OtherTask'
    ];
    $(klass).sortable({
        items: '.item',
        handle: '.draggable_icon',
        connectWith: targetClasses,
        update: function (e, ui) {
            if (this === ui.item.parent()[0]) {
                doUpdate(e, ui, taskType);
            }
        }
    });
}

function doUpdate(e, ui, taskName) {

    var item = ui.item;
    var item_data = item.data();
    var params = {_method: 'put'};
    params[item_data.modelName] = {
        row_order_position: item.index(),
        type: taskName
    };

    $.ajax({
        type: 'POST',
        url: item_data.updateUrl,
        dataType: 'json',
        data: params,
        success: function (data, textStatus, jqXHR) {
        }
    });
}
