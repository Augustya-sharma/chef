<?php
function get_current_page_url()
{
    if ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') || $_SERVER['SERVER_PORT'] == 443) {
        $url = 'https://';
    } else {
        $url = 'http://';
    }
    $url .= isset($_SERVER['HTTP_X_FORWARDED_HOST']) ? $_SERVER['HTTP_X_FORWARDED_HOST'] : $_SERVER['HTTP_HOST'];

    return $url . $_SERVER['REQUEST_URI'];
}

function print_meta(array $args = array())
{
    $defaults = array(
        'image' => CODENTHEME_THEME_URL . '/assets/images/logo/fb-icon.png',
        'title' => 'Codentheme | WordPress Themes & Plugins',
        'description' => "The #1 source of the best WordPress themes & plugins for any niche. 100% Money Back Guarantee. 6 months support included. 100% responsive design.",
        'url' => get_current_page_url(),
        'schema' => ''
    );
    $args = array_merge($args, $defaults);
    ?>
    <meta property="og:site_name" content="<?php bloginfo(); ?>"/>
    <meta property="og:type" content="website">
    <meta property="og:image"
          content="<?php echo $args['image'] ?>">
    <meta property="og:image:secure_url"
          content="<?php echo $args['image'] ?>">
    <meta property="og:title" content="<?php echo $args['title'] ?>">
    <meta property="og:description"
          content="<?php echo $args['description'] ?>">
    <meta property="og:url"
          content="<?php echo $args['url'] ?>">
    <meta name="description"
          content="<?php echo $args['description'] ?>"/>

    <meta name="twitter:card" content="summary"/>
    <meta name="twitter:description" content="<?php echo $args['description'] ?>"/>
    <meta name="twitter:title" content="<?php echo $args['title'] ?>"/>
    <meta name="twitter:image" content="<?php echo $args['image'] ?>"/>
    <meta name="twitter:site" content="@codentheme"/>
    <meta name="twitter:creator" content="@codentheme"/>

    <meta name="theme-color" content="#2b373a">
    <script type="application/ld+json">
        <?php echo '{"@context":"http://schema.org","@type":"WebSite","url":"' . esc_url(home_url()) . '","name":"' . get_bloginfo() . '","potentialAction":{"@type":"SearchAction","target":"https://codentheme.com/search/{search_term_string}","query-input":"required name=search_term_string"}}' ?>
    </script>
    <?php if (!empty($args['schema'])) { ?>
    <script type="application/ld+json">
        <?php echo $args['schema']; ?>
    </script>
<?php }
}