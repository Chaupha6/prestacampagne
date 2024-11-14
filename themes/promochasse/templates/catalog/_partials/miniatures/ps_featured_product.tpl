{block name='product_miniature_item'}
    <div class="product-item">
        <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
            <div class="thumbnail-container">
                <div class="product-image-block">
                    {block name='product_thumbnail'}
                        <a href="{$product.url}" class="thumbnail product-thumbnail">
                            <div  >
                                <img class="back-thumb"
                                     src = "{$product.cover.bySize.home_default.url}"
                                     alt = "{*if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if*}"
                                     data-full-size-image-url = "{$product.cover.large.url}"
                                >
                            </div >
                        </a>
                        <a href="{$link->getManufacturerLink($product.id_manufacturer)}" class="thumbnail product-thumbnail">
                            <div  >
                                <img class="top-thumb" src='/img/m/{$product.id_manufacturer}.jpg' alt="{*$product.name_manufacturer*}">
                            </div >
                        </a>
                    {/block}
                    {if $product.show_price}
                        {if $product.has_discount}
                            {if $product.discount_type === 'percentage'}
                                <span class="discount-percentage">{$product.discount_percentage}</span>
                            {/if}
                        {/if}
                    {/if}
                    {block name='product_flags'}
                        <ul class="product-flags">
                            {foreach from=$product.flags item=flag}
                                <li class="product-flag {$flag.type}">{$flag.label}</li>
                            {/foreach}
                        </ul>
                    {/block}
                    <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
                        {block name='quick_view'}
                            <a class="quick-view" href="#" data-link-action="quickview">
                                <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
                            </a>
                        {/block}
                        {block name='product_variants'}
                            {if $product.main_variants}
                                {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                            {/if}
                        {/block}
                    </div>
                </div>
                <div class="product-description">
                    {block name='product_name'}
                        <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
                    {/block}
                    {block name='product_description_short'}
                        <div class="product-short-desc" id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
                    {/block}
                    {block name='product_price_and_shipping'}
                        {if $product.show_price}
                            <div class="product-price-and-shipping">
                                {if $product.has_discount}
                                    {hook h='displayProductPriceBlock' product=$product type="old_price"}

                                    <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                                    <span class="regular-price">{$product.regular_price}</span>
                                {/if}

                                {hook h='displayProductPriceBlock' product=$product type="before_price"}

                                <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                                <span itemprop="price" class="price">{$product.price}</span>

                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                            </div>
                        {/if}
                    {/block}
                    <div class="add">
                        <form action="{$urls.pages.cart}" class="cart-form-url" method="post">
                            <input type="hidden" name="token" class="cart-form-token" value="{$static_token}">
                            <input type="hidden" value="{$product.id_product}" name="id_product">
                            <input type="hidden" class="input-group form-control" value="1" name="qty" />
                            <button data-button-action="add-to-cart" class="btn btn-primary">{l s='Add to cart' d='Shop.Theme.Actions'}</button>
                        </form>
                    </div>
                    {block name='product_reviews'}
                        {hook h='displayProductListReviews' product=$product}
                    {/block}
                </div>
            </div>
        </article>
    </div>
{/block}