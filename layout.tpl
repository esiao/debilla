{*
 * =|= Layout ===================================================
 *
 * Master layout and structure of theme.
 * Includes theme's <head> and <body>, sidebars and footer.
 * ==============================================================
 *}

<!DOCTYPE html>
{* Stop conditional comments blocking downloads. (http://bit.ly/LXcukK) *}
<!--[if IE]><![endif]-->
<html lang="{$meta_language}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width">

        {* Title set in Back Office > Preferences > SEO & URLs. *}
        <title>{$meta_title|escape:'htmlall':'UTF-8'}</title>

        {* Meta description for SERPs. *}
        {if isset($meta_description) AND $meta_description}
            <meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
        {/if}

        {* Prestashop supports meta keywords, so little harm in including them here. (http://bit.ly/P4FuYL) *}
        {if isset($meta_keywords) AND $meta_keywords}
            <meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
        {/if}

        {* Robots settings set in Back office. Don't forget to generate a robots.txt too. *}
        <meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />

        {* Favicon displayed in address bar, tabs and bookmarks. (http://bit.ly/P4F7xg) *}
        <link rel="icon" href="{$favicon_url}?{$img_update_time}">

        {* Google Fonts *}
        <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,400italic,700' rel='stylesheet' type='text/css'>

        {* Include all CSS files from page controller's SetMedia() *}
        {if isset($css_files)}
            {foreach from=$css_files key=css_uri item=media}
                <link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
            {/foreach}
        {/if}

        {* Required Prestashop JavaScript configuration. *}
        <script type="text/javascript">
            var baseDir = '{$content_dir|addslashes}';
            var baseUri = '{$base_uri|addslashes}';
            var static_token = '{$static_token|addslashes}';
            var token = '{$token|addslashes}';
            var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
            var priceDisplayMethod    = {$priceDisplay};
            var roundMode             = {$roundMode};
        </script>

        {* Include all JavaScript files from page controller's SetMedia(). *}
        {if isset($js_files)}
            {foreach from=$js_files item=js_uri}
                <script type="text/javascript" src="{$js_uri}"></script>
            {/foreach}
        {/if}

        {* HTML5Shiv enables HTML5 elements in older versions of Internet Explorer. (http://bit.ly/LX9S6f) *}
        <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

        {* Header modules hook *}
        {$HOOK_HEADER}
    </head>

    <body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="{if $hide_left_column}hide-left-column{/if} {if $hide_right_column}hide-right-column{/if}">

        {* Message shown if country is restricted from viewing the store. *}
        {if isset($restricted_country_mode) && $restricted_country_mode}
            <div id="restricted-country">
                <p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
            </div>
        {/if}

        {* Header *}
        <header>
            <div class="modules">
                <a href="{$base_dir}" class="logo">
                    <img src="{$css_dir}/img/logo.png" alt="Nabilla logo">
                </a>
                {$HOOK_TOP}
                <a href="#contentboxaudio">extrait</a>
            </div>
        </header>

        {* Center content - Uses other template files. *}
        <div id="center_column">
            {if !empty($template)}
                {$template}
            {/if}
        </div>

        {* Left sidebar *}
        <aside id="left_column" class="sidebar">
            {$HOOK_LEFT_COLUMN}
        </aside>

        {* Right sidebar *}
        <aside id="right_column" class="sidebar">
            {$HOOK_RIGHT_COLUMN}
        </aside>

        {* Footer *}
        <footer>
            <div class="modules">
                {$HOOK_FOOTER}
            </div>
            <p>Nabilla Benattia - Non, mais allô quoi ! - Tallac Records -  Copyright © 2014.</p>
        </footer>
    </body>
</html>

{* Includes overlay features when using Live Edit from the Back Office *}
{if !empty($live_edit)}
	{$live_edit}
{/if}