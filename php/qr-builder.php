<?php
if(checkloggedin())
{
    $restaurant = ORM::for_table($config['db']['pre'].'restaurant')
        ->where('user_id', $_SESSION['user']['id'])
        ->find_one();

    $MainFileName = null;
    $main_imageName = get_restaurant_option($restaurant['id'],'qr_image');

    if(isset($_POST['submit'])){
        if(!empty($_FILES['qr_image']['name'])) {
            $target_dir = ROOTPATH . "/storage/restaurant/logo/";
            $result = quick_file_upload('qr_image', $target_dir);
            if ($result['success']) {
                $MainFileName = $result['file_name'];
                resizeImage(300, $target_dir . $MainFileName, $target_dir . $MainFileName);
                if ($main_imageName && file_exists($target_dir . $main_imageName)) {
                    unlink($target_dir . $main_imageName);
                }
            } else {
                $errors[]['message'] = $result['error'];
            }
        }

        if($MainFileName){
            update_restaurant_option($restaurant['id'],'qr_image',$MainFileName);
        }
        update_restaurant_option($restaurant['id'],'qr_fg_color',$_POST['qr_fg_color']);
        update_restaurant_option($restaurant['id'],'qr_bg_color',$_POST['qr_bg_color']);
        update_restaurant_option($restaurant['id'],'qr_padding',$_POST['qr_padding']);
        update_restaurant_option($restaurant['id'],'qr_radius',$_POST['qr_radius']);
        update_restaurant_option($restaurant['id'],'qr_mode',$_POST['qr_mode']);
        update_restaurant_option($restaurant['id'],'qr_text',$_POST['qr_text']);
        update_restaurant_option($restaurant['id'],'qr_text_color',$_POST['qr_text_color']);
        update_restaurant_option($restaurant['id'],'qr_mode_size',$_POST['qr_mode_size']);
        update_restaurant_option($restaurant['id'],'qr_position_x',$_POST['qr_position_x']);
        update_restaurant_option($restaurant['id'],'qr_position_y',$_POST['qr_position_y']);

        transfer($link['QRBUILDER'],$lang['SAVED_SUCCESS'],$lang['SAVED_SUCCESS']);
        exit;
    }

    if(isset($restaurant['user_id'])){
        $url = $config['site_url'];
        $id = $restaurant['id'];
        $name = $restaurant['name'];
        $slug = $restaurant['slug'];
        if(!empty($slug)) {
            $url = $url . $slug . '?qr-id=' . urlencode(quick_xor_encrypt($slug, 'quick-qr'));
        }else{
            $url = $link['RESTAURANT'].'/' . $id;
        }
    }else{
        $url = $config['site_url'];
    }
    $qr_image = $config['site_url']. "storage/logo/".$config['site_logo'];
    if($image_name = get_restaurant_option($restaurant['id'],'qr_image')){
        $qr_image = $config['site_url']. "storage/restaurant/logo/".$image_name;
    }

    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/qr_builder.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['QRBUILDER']));
    $page->SetParameter ('SCAN_URL', $url);
    $page->SetParameter ('QR_FG_COLOR', get_restaurant_option($restaurant['id'],'qr_fg_color','#000000'));
    $page->SetParameter ('QR_BG_COLOR', get_restaurant_option($restaurant['id'],'qr_bg_color','#ffffff'));
    $page->SetParameter ('QR_PADDING', get_restaurant_option($restaurant['id'],'qr_padding','2'));
    $page->SetParameter ('QR_RADIUS', get_restaurant_option($restaurant['id'],'qr_radius','50'));
    $page->SetParameter ('QR_MODE', get_restaurant_option($restaurant['id'],'qr_mode','2'));
    $page->SetParameter ('QR_IMAGE', $qr_image);
    $page->SetParameter ('QR_TEXT', get_restaurant_option($restaurant['id'],'qr_text',$restaurant['name']));
    $page->SetParameter ('QR_TEXT_COLOR', get_restaurant_option($restaurant['id'],'qr_text_color', $config['theme_color']));
    $page->SetParameter ('QR_MODE_SIZE', get_restaurant_option($restaurant['id'],'qr_mode_size','10'));
    $page->SetParameter ('QR_POSITION_X', get_restaurant_option($restaurant['id'],'qr_position_x','50'));
    $page->SetParameter ('QR_POSITION_Y', get_restaurant_option($restaurant['id'],'qr_position_y','50'));
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    headerRedirect($link['LOGIN']);
}
?>