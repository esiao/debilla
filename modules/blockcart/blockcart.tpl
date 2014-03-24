{*
* =|= BLOCK CART ===============================================
* Display customers cart details in sidebar or header
* ==============================================================
*}

{* IMPORTANT : If you change some data here, you have to report these changes in the ./blockcart-json.js (to let ajaxCart available) *}

<section id="cart_block" class="block blockcart exclusive">
	{if $ajax_allowed}
		<script type="text/javascript">
			var CUSTOMIZE_TEXTFIELD = {$CUSTOMIZE_TEXTFIELD};
			var customizationIdMessage = '{l s='Customization #' mod='blockcart' js=1}';
			var removingLinkText = '{l s='remove this product from my cart' mod='blockcart' js=1}';
			var freeShippingTranslation = '{l s='Free shipping!' mod='blockcart' js=1}';
			var freeProductTranslation = '{l s='Free!' mod='blockcart' js=1}';
			var delete_txt = '{l s='Delete' mod='blockcart'}';
			var img_dir = '{$img_dir}';
		</script>
	{/if}

	<h1>
		<a href="{$link->getPageLink("$order_process", true)}">{l s='Cart' mod='blockcart'}</a>
		{if $ajax_allowed}
		<span id="block_cart_expand" {if isset($colapseExpandStatus) && $colapseExpandStatus eq 'expanded' || !isset($colapseExpandStatus)}class="hidden"{/if}>&nbsp;</span>
		<span id="block_cart_collapse" {if isset($colapseExpandStatus) && $colapseExpandStatus eq 'collapsed'}class="hidden"{/if}>&nbsp;</span>
		{/if}
	</h1>
</section>