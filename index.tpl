{*
 * =|= Homepage =================================================
 *
 * Homepage content and modules.
 * ==============================================================
 *}

{$HOOK_HOME}
<a id="logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
	<img class="logo" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if} />
</a>