$(document).on('turbolinks:load', function () {
    $('.message .close').on('click', function () {
        $(this).closest('.message').transition('fade')
    });
    $('.ui.radio.checkbox').checkbox();
    $('.ui.dropdown').dropdown();
    $('.ui.accordion').accordion();

    $('.ws-name-edit').click(function (e) {
        var id = '#' + e.target.id;
        $('.ui.edit.modal' + id).modal('show');
    })
});
