jQuery(function ($) {
    var $notification_sound = $('.order-notification-sound');

    var audioogg = new Audio(siteurl+'includes/assets/audio/message.ogg');
    var audiomp3 = new Audio(siteurl+'includes/assets/audio/message.mp3');

    localStorage.notification_sound = localStorage.notification_sound || 1;
    if(localStorage.notification_sound == 1){
        $notification_sound.html('<i class="icon-feather-volume-2"></i>');
    }else{
        $notification_sound.html('<i class="icon-feather-volume-x"></i>');
    }

    // complete order
    $(document).on('click','.qr-complete-order', function(e) {
        e.preventDefault();
        var id = $(this).data('id'),
            $this = $(this);

        $this.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: {
                action: 'completeOrder',
                id: id
            },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $this.closest('tr').find('.order-status')
                        .removeClass('gray').addClass('green')
                        .attr('title',LANG_COMPLETE)
                        .html('<i class="icon-feather-check"></i>');
                }
                $this.removeClass('button-progress').prop('disabled', false);
            }
        });
    });

    // delete order
    $(document).on('click','.qr-delete-order', function(e) {
        e.preventDefault();
        var id = $(this).data('id'),
            $this = $(this);
        if(confirm(LANG_ARE_YOU_SURE)) {
            $this.addClass('button-progress').prop('disabled', true);
            $.ajax({
                type: "POST",
                url: ajaxurl,
                data: {
                    action: 'deleteOrder',
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $this.closest('tr').remove();
                    }
                    $this.removeClass('button-progress').prop('disabled', false);
                }
            });
        }
    });

    // view order
    $(document).on('click','.qr-view-order', function(e) {
        e.preventDefault();
        var id = $(this).data('id'),
            $this = $(this);

        $('#order-print-content').html($('.order-print-tpl-'+id).html());

        $.magnificPopup.open({
            items: {
                src: '#view-order',
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            }
        });
    });

    // mute notification
    $(document).on('click','.order-notification-sound', function(e) {
        e.preventDefault();
        if(localStorage.notification_sound == 1){
            localStorage.notification_sound = 0;
            $notification_sound.html('<i class="icon-feather-volume-x"></i>');
        }else{
            localStorage.notification_sound = 1;
            $notification_sound.html('<i class="icon-feather-volume-2"></i>');
            audiomp3.play();
            audioogg.play();
        }
    });

    // print order
    $(document).on('click','.order-print-button', function(e) {
        var mywindow = window.open('', 'qr_print');
        var html = '<html><head><title>Print</title> <meta charset="UTF-8">\n' +
            '        <meta name="viewport" content="width=device-width, initial-scale=1.0">\n' +
            '        <meta http-equiv="X-UA-Compatible" content="ie=edge">' +
            '<link rel="stylesheet" href="'+siteurl+'templates/'+template_name+'/css/style.css?ver={VERSION}" type="text/css" />' +
            '</head><body><div class="order-print">'+
            $('.order-print').html() +
            '</div></body></html>';
        mywindow.document.write(html);
        mywindow.print();
        //mywindow.close();
        mywindow.document.close();
        //return true;
    });
});