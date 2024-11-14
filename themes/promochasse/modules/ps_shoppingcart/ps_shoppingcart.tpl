{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<!--group user- cart -->
<div id="_desktop_cart" style="display: inline;float: right; justify-content: space-between;">
<span class="group" style="display:inline;margin-left:10px;">
    <span ><a href="#"> <img src="/themes/promochasse/img/lock.png" alt="lock"> </a></span>
   {* <span><a href="http://dev.pouf-design.priviconcept.org/mon-compte"> <img src="/themes/bizkick/assets/img/user.png" alt="user"></a></span>*}
    <span>

          <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
           <div class="header">
             {if $cart.products_count > 0}
             <a rel="nofollow" href="{$cart_url}">
              {/if}
              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              <span class="hidden-sm-down">{l s='' d='Shop.Theme.Checkout'}</span>
              <span class="cart-products-count">({$cart.products_count})</span>
              {if $cart.products_count > 0}
             </a>
             {/if}
           </div>
          </div>

    </span>
</span>
</div>

{*<style>*}
   {*.group li{*}
        {*display: flex;*}
        {*float: right;*}
       {*/* width: 482px;*/*}
        {*justify-content: space-between;*}
{*</style>*}
{*<!--/group-->*}

{*<div id="_desktop_cart">*}
  {*<div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">*}
    {*<div class="header">*}
      {*{if $cart.products_count > 0}*}
        {*<a rel="nofollow" href="{$cart_url}">*}
      {*{/if}*}
        {*<i class="fa fa-shopping-cart" aria-hidden="true"></i>*}
        {*<span class="hidden-sm-down">{l s='' d='Shop.Theme.Checkout'}</span>*}
        {*<span class="cart-products-count">({$cart.products_count})</span>*}
      {*{if $cart.products_count > 0}*}
        {*</a>*}
      {*{/if}*}
    {*</div>*}
  {*</div>*}
{*</div>*}
