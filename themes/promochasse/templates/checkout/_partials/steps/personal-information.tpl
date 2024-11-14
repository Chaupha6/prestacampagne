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
{block name='header'}
  {block name='header_nav'}
    <nav class="header-nav">
      <div class="container">
        <div class="row">
          <div class="col-md-6 hidden-sm-down" id="_desktop_logo">
            <a href="{$urls.base_url}">
              <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name} {l s='logo' d='Shop.Theme.Global'}">
            </a>
          </div>
          <div class="col-md-6 text-xs-right hidden-sm-down">
            {hook h='displayNav1'}
          </div>
          <div class="hidden-md-up text-sm-center mobile">
            {hook h='displayNav2'}
            <div class="float-xs-left" id="menu-icon">
              <i class="material-icons">&#xE5D2;</i>
            </div>
            <div class="float-xs-right" id="_mobile_cart"></div>
            <div class="float-xs-right" id="_mobile_user_info"></div>
            <div class="top-logo" id="_mobile_logo"></div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </nav>
  {/block}

  {block name='header_top'}
    <div class="header-top hidden-md-up">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="row">
              {hook h='displayTop'}
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
          <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
          <div class="js-top-menu-bottom">
            <div id="_mobile_currency_selector"></div>
            <div id="_mobile_language_selector"></div>
            <div id="_mobile_contact_link"></div>
          </div>
        </div>
      </div>
    </div>
    {hook h='displayNavFullWidth'}
  {/block}
{/block}

/*-------randev106-----------*/
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  {if $customer.is_logged && !$customer.is_guest}

    <p class="identity">
      {* [1][/1] is for a HTML tag. *}
      {l s='Connected as [1]%firstname% %lastname%[/1].'
        d='Shop.Theme.Customeraccount'
        sprintf=[
          '[1]' => "<a href='{$urls.pages.identity}'>",
          '[/1]' => "</a>",
          '%firstname%' => $customer.firstname,
          '%lastname%' => $customer.lastname
        ]
      }
    </p>
    <p>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Not you? [1]Log out[/1]'
        d='Shop.Theme.Customeraccount'
        sprintf=[
        '[1]' => "<a href='{$urls.actions.logout}'>",
        '[/1]' => "</a>"
        ]
      }
    </p>
    {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
      <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
    {/if}

  {else}

    <ul class="nav nav-inline my-2" role="tablist">
      <li class="nav-item">
        <a
          class="nav-link {if !$show_login_form}active{/if}"
          data-toggle="tab"
          href="#checkout-guest-form"
          role="tab"
          aria-controls="checkout-guest-form"
          {if !$show_login_form} aria-selected="true"{/if}
          >
          {if $guest_allowed}
            {l s='Order as a guest' d='Shop.Theme.Checkout'}
          {else}
            {l s='Create an account' d='Shop.Theme.Customeraccount'}
          {/if}
        </a>
      </li>

      <li class="nav-item">
        <span href="nav-separator"> | </span>
      </li>

      <li class="nav-item">
        <a
          class="nav-link {if $show_login_form}active{/if}"
          data-link-action="show-login-form"
          data-toggle="tab"
          href="#checkout-login-form"
          role="tab"
          aria-controls="checkout-login-form"
          {if $show_login_form} aria-selected="true"{/if}
        >
          {l s='Sign in' d='Shop.Theme.Actions'}
        </a>
      </li>
    </ul>

    <div class="tab-content">
      <div class="tab-pane {if !$show_login_form}active{/if}" id="checkout-guest-form" role="tabpanel" {if $show_login_form}aria-hidden="true"{/if}>
        {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
      </div>
      <div class="tab-pane {if $show_login_form}active{/if}" id="checkout-login-form" role="tabpanel" {if !$show_login_form}aria-hidden="true"{/if}>
        {render file='checkout/_partials/login-form.tpl' ui=$login_form}
      </div>
    </div>


  {/if}
{/block}
