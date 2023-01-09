$(function () {
    /* Create extra */
    $("#save-menu-extras").on('click', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var form_data = {
            action: 'addMenuExtra',
            title: $("#add_extra_title").val(),
            price: $("#add_extra_price").val(),
            menu_id: $("#add-extras").data('menu-id')
        };

        $('#save-menu-extras').addClass('button-progress').prop('disabled', true);
        $("#extras-status").slideUp();
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $("#extras-status").addClass('success').removeClass('error').html('<p>' + response.message + '</p>').slideDown();
                    location.reload();
                } else {
                    $("#extras-status").removeClass('success').addClass('error').html('<p>' + response.message + '</p>').slideDown();
                }
                $('#save-menu-extras').removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    /* Delete extra */
    $(".delete-menu-extras").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var id = $(this).data('id'),
            $this = $(this);

        if (confirm(LANG_ARE_YOU_SURE)) {
            $this.addClass('button-progress').prop('disabled', true);
            $.ajax({
                type: "POST",
                url: ajaxurl,
                data: {
                    action: 'deleteMenuExtra',
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $this.closest('.extra-' + id).remove();
                    }
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });

    /* Update extra */
    $(".menu-extras-form").on('submit', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var $form = $(this),
            form_data = $form.serializeArray(),
            id = $form.data('id'),
            $btn = $form.find('button'),
            $status = $form.find('.notification');
        form_data.push({
            name: 'id',
            value: id
        });
        form_data.push({
            name: 'action',
            value: 'editMenuExtra'
        });


        $btn.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $status.slideUp();
                    $('.extra-' + id).find('.extra-display-name').html($form.find('.extra-title').val());
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                } else {
                    $status.removeClass('success').addClass('error').html('<p>' + response.message + '</p>').slideDown();
                }
                $btn.removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    /* Short extra */
    var $extras = $('#menu-extras');
    $extras.sortable({
        axis: 'y',
        handle: '.quickad-js-handle',
        update: function (event, ui) {
            var data = [];
            $extras.children('div').each(function () {
                data.push($(this).data('extraid'));
            });
            $.ajax({
                type: 'POST',
                url: ajaxurl,
                dataType: 'json',
                data: {action: 'updateExtrasPosition', position: data},
                success: function (response, textStatus, jqXHR) {
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });

    /* Create Variant Options */
    $("#save-variant-option").on('click', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var form_data = {
            action: 'addVariantOption',
            title: $("#add_variant_title").val(),
            options: $("#add_variant_options").val(),
            menu_id: $("#add-variant-option").data('menu-id')
        };

        $('#save-variant-option').addClass('button-progress').prop('disabled', true);
        $("#variant-option-error").slideUp();
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $("#variant-option-error").addClass('success').removeClass('error').html('<p>' + response.message + '</p>').slideDown();
                    location.reload();
                } else {
                    $("#variant-option-error").removeClass('success').addClass('error').html('<p>' + response.message + '</p>').slideDown();
                }
                $('#save-variant-option').removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    /* Delete variant option */
    $(".delete-variant-option").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var id = $(this).data('id'),
            $this = $(this);

        if (confirm(LANG_ARE_YOU_SURE)) {
            $this.addClass('button-progress').prop('disabled', true);
            $.ajax({
                type: "POST",
                url: ajaxurl,
                data: {
                    action: 'deleteVariantOption',
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $this.closest('.variant-option-' + id).remove();
                        location.reload();
                    }
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });

    /* Update variant option */
    $(".variant-options-form").on('submit', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var $form = $(this),
            form_data = $form.serializeArray(),
            id = $form.data('id'),
            $btn = $form.find('button'),
            $status = $form.find('.notification');

        form_data.push({name: 'id', value: id})
        form_data.push({name: 'action', value: 'editVariantOption'});

        $btn.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $status.slideUp();
                    $('.variant-option-' + id).find('.variant-option-title').html($form.find('.option-title').val());
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                    location.reload();
                } else {
                    $status.removeClass('success').addClass('error').html('<p>' + response.message + '</p>').slideDown();
                }
                $btn.removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    /* Short variant options */
    var $variant_options = $('#variant-options');
    $variant_options.sortable({
        axis: 'y',
        handle: '.quickad-js-handle',
        update: function (event, ui) {
            var data = [];
            $variant_options.children('div').each(function () {
                data.push($(this).data('optionid'));
            });
            $.ajax({
                type: 'POST',
                url: ajaxurl,
                dataType: 'json',
                data: {action: 'updateVariantOptionsPosition', position: data},
                success: function (response, textStatus, jqXHR) {
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });

    /* Create Variant */
    $("#save-variant").on('submit', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var $form = $(this),
            form_data = $form.serializeArray(),
            id = $form.data('id'),
            $btn = $form.find('button'),
            $status = $form.find('.notification');

        form_data.push({name: 'id', value: id})
        form_data.push({name: 'action', value: 'addVariant'});
        form_data.push({name: 'menu_id', value: $("#add-variant").data('menu-id')});

        $btn.addClass('button-progress').prop('disabled', true);
        $status.slideUp();
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $status.addClass('success').removeClass('error').html('<p>' + response.message + '</p>').slideDown();
                    location.reload();
                } else {
                    $status.removeClass('success').addClass('error').html('<p>' + response.message + '</p>').slideDown();
                }
                $btn.removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    /* Delete variant */
    $(".delete-variant").on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var id = $(this).data('id'),
            $this = $(this);

        if (confirm(LANG_ARE_YOU_SURE)) {
            $this.addClass('button-progress').prop('disabled', true);
            $.ajax({
                type: "POST",
                url: ajaxurl,
                data: {
                    action: 'deleteVariant',
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $this.closest('.variant-' + id).remove();
                    }
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });

    /* Update variant */
    $(".variants-form").on('submit', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var $form = $(this),
            form_data = $form.serializeArray(),
            id = $form.data('id'),
            $btn = $form.find('button'),
            $status = $form.find('.notification');

        form_data.push({name: 'id', value: id})
        form_data.push({name: 'action', value: 'editVariant'});

        $btn.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $status.slideUp();
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                    location.reload();
                } else {
                    $status.removeClass('success').addClass('error').html('<p>' + response.message + '</p>').slideDown();
                }
                $btn.removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    /* Short variants */
    var $variants = $('#variants');
    $variants.sortable({
        axis: 'y',
        handle: '.quickad-js-handle',
        update: function (event, ui) {
            var data = [];
            $variants.children('div').each(function () {
                data.push($(this).data('variantid'));
            });
            $.ajax({
                type: 'POST',
                url: ajaxurl,
                dataType: 'json',
                data: {action: 'updateVariantsPosition', position: data},
                success: function (response, textStatus, jqXHR) {
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });
});