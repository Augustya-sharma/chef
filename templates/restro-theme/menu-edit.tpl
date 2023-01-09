{OVERALL_HEADER}

<!-- Dashboard Container -->
<div class="dashboard-container">

    <div class="dashboard-sidebar">
        <div class="dashboard-sidebar-inner" data-simplebar>
            <div class="dashboard-nav-container">
                <!-- Responsive Navigation Trigger -->
                <a href="#" class="dashboard-responsive-nav-trigger">
					<span class="hamburger hamburger--collapse">
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</span>
                    <span class="trigger-title">{LANG_DASH_NAVIGATION}</span>
                </a>

                <!-- Navigation -->
                <div class="dashboard-nav">
                    <div class="dashboard-nav-inner">

                        <ul data-submenu-title="{LANG_MANAGEMENT}">
                            <li><a href="{LINK_DASHBOARD}"><i class="icon-feather-grid"></i> {LANG_DASHBOARD}</a></li>
                            <li><a href="{LINK_ADD_RESTAURANT}"><i
                                            class="icon-material-outline-restaurant"></i> {LANG_RESTAURANT}</a></li>
                            <li class="active"><a href="{LINK_MENU}"><i class="icon-feather-menu"></i> {LANG_MENU}</a>
                            </li>
                            <li><a href="{LINK_ORDER}"><i class="icon-feather-activity"></i> {LANG_ORDERS}</a></li>
                            <li><a href="{LINK_MEMBERSHIP}"><i class="icon-feather-gift"></i> {LANG_MEMBERSHIP}</a></li>
                            <li><a href="{LINK_QRBUILDER}"><i
                                            class="icon-material-outline-dashboard"></i> {LANG_QRBUILDER}</a></li>
                            IF("{QUICKORDER_ENABLE}" == "1"){
                            <li><a href="{LINK_WHATSAPP_ORDERING}"><i
                                            class="fa fa-whatsapp padding-right-25"></i> {LANG_WHATSAPP_ORDERING}</a>
                            </li>
                            {:IF}
                        </ul>
                        <ul data-submenu-title="{LANG_ACCOUNT}">
                            <li><a href="{LINK_TRANSACTION}"><i
                                            class="icon-material-outline-description"></i> {LANG_TRANSACTIONS}</a></li>
                            <li><a href="{LINK_ACCOUNT_SETTING}"><i
                                            class="icon-material-outline-settings"></i> {LANG_ACCOUNT_SETTING}</a></li>
                            <li><a href="{LINK_LOGOUT}"><i
                                            class="icon-material-outline-power-settings-new"></i> {LANG_LOGOUT}</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Navigation / End -->

            </div>
        </div>
    </div>
    <!-- Dashboard Sidebar / End -->
    <!-- Dashboard Content-->
    <div class="dashboard-content-container" data-simplebar>
        <div class="dashboard-content-inner">
            <!-- Dashboard Headline -->
            <div class="dashboard-headline">
                <h3>{MENU_NAME}</h3>
                <div class="headline-right">
                    IF({SHOW_LANGS}){
                    <div class="btn-group bootstrap-select user-lang-switcher">
                        <button type="button" class="btn dropdown-toggle btn-default" data-toggle="dropdown"
                                title="English">
                            <span class="filter-option pull-left">EN</span>&nbsp;
                            <span class="caret"></span>
                        </button>
                        <div class="dropdown-menu scrollable-menu open">
                            <ul class="dropdown-menu inner">
                                {LOOP: LANGS}
                                    <li data-lang="{LANGS.file_name}" data-code="{LANGS.code}">
                                        <a role="menuitem" tabindex="-1" rel="alternate"
                                           href="#">{LANGS.name}</a>
                                    </li>
                                {/LOOP: LANGS}
                            </ul>
                        </div>
                    </div>
                    {:IF}
                </div>
            </div>

            <div class="js-accordion">

                <!-- Variants Options -->
                <div class="dashboard-box js-accordion-item margin-top-0 margin-bottom-30">
                    <div class="headline js-accordion-header">
                        <h3>{LANG_VARIANT_OPTIONS}</h3>
                        <div class="margin-left-auto line-height-1">
                            <a href="#add-variant-option"
                               class="popup-with-zoom-anim btn-sm button ripple-effect add-variant-option"
                               data-tippy-placement="top" title="{LANG_ADD_VARIANT_OPTION}">
                                <i class="icon-feather-plus color-white"></i>
                            </a>
                        </div>
                    </div>
                    <div class="content with-padding padding-bottom-10 js-accordion-body dark" style="display: none">
                        <div class="js-accordion" id="variant-options">
                            {LOOP: VARIANT_OPTIONS}
                                <div class="dashboard-box js-accordion-item margin-top-0 margin-bottom-30 variant-option-{VARIANT_OPTIONS.id}"
                                     data-optionid="{VARIANT_OPTIONS.id}">
                                    <!-- Headline -->
                                    <div class="headline js-accordion-header small">
                                        <h3><i class="icon-feather-menu quickad-js-handle"></i> <span
                                                    class="variant-option-title">{VARIANT_OPTIONS.title}</span></h3>
                                        <div class="margin-left-auto line-height-1">
                                            <a href="#" data-id="{VARIANT_OPTIONS.id}"
                                               class="button red ripple-effect btn-sm delete-variant-option" title="{LANG_DELETE}"
                                               data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </div>
                                    <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                        <form class="variant-options-form" method="post" action="#" data-id="{VARIANT_OPTIONS.id}">
                                            <div class="notification error" style="display:none"></div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <h5>{LANG_TITLE}</h5>
                                                        <input type="text" class="with-border option-title"
                                                               name="title" value="{VARIANT_OPTIONS.title}"
                                                               placeholder="{LANG_VARIANT_OPTIONS_TITLE}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <h5>{LANG_VARIANT_OPTIONS}</h5>
                                                        <input type="text" class="with-border" name="options"
                                                               value="{VARIANT_OPTIONS.options}"
                                                               placeholder="{LANG_VARIANT_OPTIONS_PLACEHOLDER}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <label class="switch padding-left-40">
                                                            <input name="active" value="1"
                                                                   type="checkbox"
                                                                   IF("{VARIANT_OPTIONS.active}" == "1"){ checked {:IF}>
                                                            <span class="switch-button"></span> {LANG_AVAILABLE}
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="submit-field">
                                                <button type="submit" name="submit"
                                                        class="button ripple-effect">{LANG_SAVE}</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            {/LOOP: VARIANT_OPTIONS}
                        </div>
                    </div>
                </div>

                <!-- Variants -->
                <div class="dashboard-box js-accordion-item margin-top-0 margin-bottom-30">
                    <div class="headline js-accordion-header">
                        <h3>{LANG_VARIANTS}</h3>
                        <div class="margin-left-auto line-height-1">
                            <a href="#add-variant"
                               class="popup-with-zoom-anim btn-sm button ripple-effect add-variant"
                               data-tippy-placement="top" title="{LANG_ADD_VARIANT}">
                                <i class="icon-feather-plus color-white"></i>
                            </a>
                        </div>
                    </div>
                    <div class="content with-padding padding-bottom-10 js-accordion-body dark" style="display: none">
                        <div class="js-accordion" id="variants">
                            {LOOP: VARIANTS}
                                <div class="dashboard-box js-accordion-item margin-top-0 margin-bottom-30 variant-{VARIANTS.id}"
                                     data-variantid="{VARIANTS.id}">
                                    <!-- Headline -->
                                    <div class="headline js-accordion-header small">
                                        <h3><i class="icon-feather-menu quickad-js-handle"></i> <span
                                                    class="variant-title">{VARIANTS.title}</span></h3>
                                        <div class="margin-left-auto line-height-1">
                                            <a href="#" data-id="{VARIANTS.id}"
                                               class="button red ripple-effect btn-sm delete-variant" title="{LANG_DELETE}"
                                               data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </div>
                                    <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                        <form class="variants-form" method="post" action="#" data-id="{VARIANTS.id}">
                                            <div class="notification error" style="display:none"></div>
                                            <div class="row">
                                                {LOOP: VARIANT_LOOP}
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <h5>{VARIANT_LOOP.title}</h5>
                                                        <select class="with-border selectpicker" id="variant_option_{VARIANT_LOOP.id}" name="variant_option[{VARIANT_LOOP.id}]">
                                                            {LOOP: OPTIONS_LOOP}
                                                                <option value="{OPTIONS_LOOP.key}" {OPTIONS_LOOP.selected}>{OPTIONS_LOOP.title}</option>
                                                            {/LOOP: OPTIONS_LOOP}
                                                        </select>
                                                    </div>
                                                </div>
                                                {/LOOP: VARIANT_LOOP}
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <h5>{LANG_PRICE}</h5>
                                                        <input type="text" class="with-border" id="add_variant_price" name="price" placeholder="{LANG_PRICE}" value="{VARIANTS.price}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="submit-field">
                                                        <label class="switch padding-left-40">
                                                            <input name="active" value="1" type="checkbox" IF("{VARIANTS.active}"=="1"){ checked {:IF}>
                                                            <span class="switch-button"></span> {LANG_AVAILABLE}
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="submit-field">
                                                <button type="submit" name="submit"
                                                        class="button ripple-effect">{LANG_SAVE}</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            {/LOOP: VARIANTS}
                        </div>
                    </div>
                </div>

                <!-- Extras -->
                <div class="dashboard-box js-accordion-item margin-top-0 margin-bottom-30">
                    <!-- Headline -->
                    <div class="headline js-accordion-header">
                        <h3>{LANG_EXTRAS}</h3>
                        <div class="margin-left-auto line-height-1">
                            <a href="#add-extras"
                               class="popup-with-zoom-anim btn-sm button ripple-effect add-menu-extras"
                               data-tippy-placement="top" title="{LANG_ADD_EXTRAS}">
                                <i class="icon-feather-plus color-white"></i>
                            </a>
                        </div>
                    </div>
                    <div class="content with-padding padding-bottom-10 js-accordion-body dark" style="display: none">
                        <div class="js-accordion" id="menu-extras">
                            {LOOP: EXTRAS}
                                <div class="dashboard-box js-accordion-item margin-top-0 margin-bottom-30 extra-{EXTRAS.id}"
                                     data-extraid="{EXTRAS.id}">
                                    <!-- Headline -->
                                    <div class="headline js-accordion-header small">
                                        <h3><i class="icon-feather-menu quickad-js-handle"></i> <span
                                                    class="extra-display-name">{EXTRAS.title}</span></h3>
                                        <div class="margin-left-auto line-height-1">
                                            <a href="#" data-id="{EXTRAS.id}"
                                               class="button red ripple-effect btn-sm delete-menu-extras" title="{LANG_DELETE}"
                                               data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </div>
                                    <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                        <form class="menu-extras-form" method="post" action="#" data-id="{EXTRAS.id}">
                                            <div class="notification error" style="display:none"></div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <h5>{LANG_TITLE}</h5>
                                                        <input type="text" class="with-border extra-title"
                                                               name="title" value="{EXTRAS.title}"
                                                               placeholder="{LANG_TITLE}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <h5>{LANG_PRICE}</h5>
                                                        <input type="text" class="with-border"
                                                               name="price" value="{EXTRAS.price}"
                                                               placeholder="{LANG_PRICE}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="submit-field">
                                                        <label class="switch padding-left-40">
                                                            <input name="active" value="1" type="checkbox" IF("{EXTRAS.active}"=="1"){ checked {:IF}>
                                                            <span class="switch-button"></span> {LANG_AVAILABLE}
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="submit-field">
                                                <button type="submit" name="submit"
                                                        class="button ripple-effect">{LANG_SAVE}</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            {/LOOP: EXTRAS}
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="dashboard-footer-spacer"></div>
            <div class="small-footer margin-top-15">
                <div class="small-footer-copyrights">
                    {COPYRIGHT_TEXT}
                </div>
                <ul class="footer-social-links">
                    IF('{FACEBOOK_LINK}'!=""){
                    <li>
                        <a href="{FACEBOOK_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{TWITTER_LINK}'!=""){
                    <li>
                        <a href="{TWITTER_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{INSTAGRAM_LINK}'!=""){
                    <li>
                        <a href="{INSTAGRAM_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{LINKEDIN_LINK}'!=""){
                    <li>
                        <a href="{LINKEDIN_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{PINTEREST_LINK}'!=""){
                    <li>
                        <a href="{PINTEREST_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-pinterest-p"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{YOUTUBE_LINK}'!=""){
                    <li>
                        <a href="{YOUTUBE_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-youtube-play"></i>
                        </a>
                    </li>
                    {:IF}
                </ul>
                <div class="clearfix"></div>
            </div>
            <!-- Footer / End -->
        </div>
    </div>
    <!-- Dashboard Content / End -->

</div>
<!-- Dashboard Container / End -->

</div>
<!-- Wrapper / End -->

<!-- Add Variant Option -->
<div id="add-variant-option" class="zoom-anim-dialog mfp-hide dialog-with-tabs" data-menu-id="{MENU_ID}">
    <div class="sign-in-form">
        <ul class="popup-tabs-nav">
            <li><a>{LANG_VARIANT_OPTIONS}</a></li>
        </ul>
        <div class="popup-tabs-container">
            <!-- Tab -->
            <div class="popup-tab-content">
                <div id="variant-option-error" class="notification error" style="display:none"></div>
                <div class="submit-field margin-bottom-0">
                    <input type="text" class="with-border" id="add_variant_title" name="option_title"
                           placeholder="{LANG_VARIANT_OPTIONS_TITLE}">
                </div>
                <div class="submit-field">
                    <input type="text" class="with-border margin-bottom-0" id="add_variant_options" name="options"
                           placeholder="{LANG_VARIANT_OPTIONS_PLACEHOLDER}">
                    <small>{LANG_VARIANT_OPTIONS_HINT}</small>
                </div>
                <!-- Button -->
                <button class="margin-top-0 button button-sliding-icon ripple-effect" type="submit"
                        id="save-variant-option">{LANG_SAVE} <i class="icon-material-outline-arrow-right-alt"></i></button>
            </div>

        </div>
    </div>
</div>

<!-- Add Variant -->
<div id="add-variant" class="zoom-anim-dialog mfp-hide dialog-with-tabs" data-menu-id="{MENU_ID}">
    <div class="sign-in-form">
        <ul class="popup-tabs-nav">
            <li><a>{LANG_VARIANTS}</a></li>
        </ul>
        <div class="popup-tabs-container">
            <!-- Tab -->
            <div class="popup-tab-content">
                IF({OPTIONS_COUNT}){
                <form id="save-variant" method="post" action="#">
                    <div id="variant-error" class="notification error" style="display:none"></div>
                    {LOOP: VARIANT_OPTIONS2}
                    <div class="submit-field">
                        <h5 class="margin-bottom-8">{VARIANT_OPTIONS2.title}</h5>
                        <select class="with-border selectpicker" id="variant_option_{VARIANT_OPTIONS2.id}" name="variant_option[{VARIANT_OPTIONS2.id}]">
                            {LOOP: OPTIONS_LOOP}
                                <option value="{OPTIONS_LOOP.key}">{OPTIONS_LOOP.title}</option>
                            {/LOOP: OPTIONS_LOOP}
                        </select>
                    </div>
                    {/LOOP: VARIANT_OPTIONS2}
                    <div class="submit-field">
                        <input type="text" class="with-border" id="add_variant_price" name="price"
                               placeholder="{LANG_PRICE}" required>
                    </div>
                    <!-- Button -->
                    <button class="margin-top-0 button button-sliding-icon ripple-effect" type="submit">{LANG_SAVE} <i class="icon-material-outline-arrow-right-alt"></i></button>
                </form>
                {ELSE}
                <div id="variant-error" class="notification error">{LANG_VARIANT_OPTION_WARNING}</div>
                {:IF}
            </div>

        </div>
    </div>
</div>

<!-- Add Extra -->
<div id="add-extras" class="zoom-anim-dialog mfp-hide dialog-with-tabs" data-menu-id="{MENU_ID}">
    <div class="sign-in-form">
        <ul class="popup-tabs-nav">
            <li><a>{LANG_EXTRAS}</a></li>
        </ul>
        <div class="popup-tabs-container">
            <!-- Tab -->
            <div class="popup-tab-content">
                <div id="extras-status" class="notification error" style="display:none"></div>
                <div class="submit-field margin-bottom-0">
                    <input type="text" class="with-border" id="add_extra_title" name="extra_title"
                           placeholder="{LANG_TITLE}">
                </div>
                <div class="submit-field">
                    <input type="text" class="with-border" id="add_extra_price" name="extra_price"
                           placeholder="{LANG_PRICE}">
                </div>
                <!-- Button -->
                <button class="margin-top-0 button button-sliding-icon ripple-effect" type="submit"
                        id="save-menu-extras">{LANG_SAVE} <i class="icon-material-outline-arrow-right-alt"></i></button>
            </div>
        </div>
    </div>
</div>

<script>
    var session_uname = "{USERNAME}";
    var session_uid = "{USER_ID}";
    var SITE_URL = "{SITE_URL}";
    // Language Var
    var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
    var LANG_ERROR = "{LANG_ERROR}";
    var LANG_CANCEL = "{LANG_CANCEL}";
    var LANG_DELETED = "{LANG_DELETED}";
    var LANG_ARE_YOU_SURE = "{LANG_ARE_YOU_SURE}";
    var LANG_YES_DELETE = "{LANG_YES_DELETE}";
    var LANG_SHOW = "{LANG_SHOW}";
    var LANG_HIDE = "{LANG_HIDE}";
    var LANG_HIDDEN = "{LANG_HIDDEN}";
    var LANG_TYPE_A_MESSAGE = "{LANG_TYPE_A_MESSAGE}";
    var LANG_JUST_NOW = "{LANG_JUST_NOW}";
    var LANG_PREVIEW = "{LANG_PREVIEW}";
    var LANG_SEND = "{LANG_SEND}";
    var LANG_STATUS = "{LANG_STATUS}";
    var LANG_SIZE = "{LANG_SIZE}";
    var LANG_NO_MSG_FOUND = "{LANG_NO_MSG_FOUND}";
    var LANG_ONLINE = "{LANG_ONLINE}";
    var LANG_OFFLINE = "{LANG_OFFLINE}";
    var LANG_GOT_MESSAGE = "{LANG_GOT_MESSAGE}";
</script>

<link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/alertify.css?ver={VERSION}"/>
<script src="{SITE_URL}templates/{TPL_NAME}/js/alertify.min.js?ver={VERSION}"></script>

<script src="{SITE_URL}templates/{TPL_NAME}/js/chosen.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.lazyload.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/tippy.all.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/simplebar.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-slider.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-select.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/snackbar.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/counterup.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/magnific-popup.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/slick.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.cookie.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js?ver={VERSION}"></script>

<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery-ui.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/menu-edit.js?ver={VERSION}"></script>
<script>
    /* THIS PORTION OF CODE IS ONLY EXECUTED WHEN THE USER THE LANGUAGE(CLIENT-SIDE) */
    $(function () {
        $('.language-switcher').on('click', '.dropdown-menu li', function (e) {
            e.preventDefault();
            var lang = $(this).data('lang');
            if (lang != null) {
                var res = lang.substr(0, 2);
                $('#selected_lang').html(res.toUpperCase());
                $.cookie('Quick_lang', lang, {path: '/'});
                location.reload();
            }
        });

        $('.user-lang-switcher').on('click', '.dropdown-menu li', function (e) {
            e.preventDefault();
            var lang = $(this).data('lang');
            var code = $(this).data('code');
            if (lang != null) {
                var res = lang.substr(0, 2);
                $('#selected_lang').html(res.toUpperCase());
                $.cookie('Quick_user_lang', lang, {path: '/'});
                $.cookie('Quick_user_lang_code', code, {path: '/'});
                location.reload();
            }
        });
    });
    $(document).ready(function () {
        var lang = $.cookie('Quick_lang');
        if (lang != null) {
            var res = lang.substr(0, 2);
            $('#selected_lang').html(res.toUpperCase());
        }

        var code = $.cookie('Quick_user_lang_code');
        if (code != null) {
            $('.user-lang-switcher .filter-option').html(code.toUpperCase());
        }

        $("#header-container").addClass('dashboard-header not-sticky');
    });
</script>
</body>
</html>