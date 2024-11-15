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
<div class="product-variants">
  {if $groups != []}
    <span id="main_label"><a href="#" id="open-page" onclick="openPopup()">Choisir sa taille</a></span>
    <div id="taille" style="">
      <div id="bloc">
        <div id="bloc-text">
          <h1 style="text-align: center; padding-top: 20px;">TABLEAU DES TAILLES</h1>
          <p style="text-align: left;"><span style="background-color: inherit; font-size: 25px; font-weight: bold; line-height: 1.5em;">Comment se mesurer ? </span></p>
          <p>1/ Prendre un mètre couture (ou ruban-mètre ou une ficelle, puis reporter après la prise de mesures sur une règle)</span></p>
          <p>2/ Ne gardez qu'une chemise sur soi</span></p>
          <p>3/ Vous tenir debout et bien droit</span></p>
          <p>4/ Prendre la mesure sans serrer (vous devez passer un doigt) : </span><br>
            - pour le tour de poitrine : c'est le point le plus fort</span><br>
            - pour le tour de taille : tour horizontal au plus creux de l'abdomen</span><br>
            - pour l'entrejambe : de la couture de l'entrejambe du pantalon au sol</span><br>
            - pour le tour de cou : tour horizontal juste en dessous de la pomme d'Adam. </span><br>
            - pour le tour de tête : tour horizontal du crâne au plus large, avec une passage à un centimètre au-dessus des oreilles. </span>
          </p>
          <img src="/img/cms/tableaux%20des%20tailles%20homme%20femme%20et%20enfant.jpg" alt="Tableau des tailles" style="width:100%; display: block;" />
        </div>


      </div>
      <div id="popup" class="popup">
        <span class="closePopup" onclick="closePopup()"><img src="https://www.passion-campagne.com/fermer.png" style="cursor: pointer;"/></span>
      </div>
    </div>
  {/if}
  {foreach from=$groups key=id_attribute_group item=group}
    <div class="clearfix product-variants-item">
      <span class="control-label">{$group.name}</span>
      {if $group.group_type == 'select'}
        <select
          class="form-control form-control-select"
          id="group_{$id_attribute_group}"
          data-product-attribute="{$id_attribute_group}"
          name="group[{$id_attribute_group}]">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
            <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
          {/foreach}
        </select>
      {elseif $group.group_type == 'color'}
        <ul id="group_{$id_attribute_group}">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
            <li class="float-xs-left input-container">
              <label>
                <input class="input-color" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                <span
                  {if $group_attribute.html_color_code}class="color" style="background-color: {$group_attribute.html_color_code}" {/if}
                  {if $group_attribute.texture}class="color texture" style="background-image: url({$group_attribute.texture})" {/if}
                ><span class="sr-only">{$group_attribute.name}</span></span>
              </label>
            </li>
          {/foreach}
        </ul>
      {elseif $group.group_type == 'radio'}
        <ul id="group_{$id_attribute_group}">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
            <li class="input-container float-xs-left">
              <label>
                <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                <span class="radio-label">{$group_attribute.name}</span>
              </label>
            </li>
          {/foreach}
        </ul>
      {/if}
    </div>
  {/foreach}
</div>

<style>
  div#taille{
    display:none;
    background:rgba(0,0,0,0.78);
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:1050;
    opacity:1;
    overflow-x: hidden;
    overflow-y: auto;
    padding-top: 30px!important;
  }
  div#popup{
    position: fixed;
    top: 4%;
    left: 80%;
    z-index: 10;
    color:white;
  }
  div#bloc-text {
    width: 60%!important;
    background-color: white;
    padding-left: 15px;
    margin-left: auto;
    margin-right: auto;
    padding-right: 15px;
    display: block;
}

  img.img_taille{
    width: 50%;
    margin-left: 396px;
    margin-top: -16px;
  }
  span img{
    width:37px;
  }
 </style>

 <script>
function openPopup(){
  document.getElementById('taille').style.display= 'block';
  document.getElementById('popup').style.display= 'block';
}

function closePopup() {
    document.getElementById('taille').style.display = 'none';    
    document.getElementById('popup').style.display = 'none'; 
}
</script>