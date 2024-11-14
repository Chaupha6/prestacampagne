{*$contentwilliam nofilter*}

<p>{*$willAllSubcategory|@var_dump*}</p>

<div class="row promohometab_list text-uppercase">

    <div class="d-inline category-active active tt">Tout</div>

    {foreach $willAllSubcategory as $itemSub}

        <div class="d-inline category-active categoryid-{$itemSub.id_category}">{*$itemSub.id_category*} {$itemSub.name} {*$itemSub|@print_r*}</div>

    {/foreach}

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    {literal}
            $(document).ready(function(){
                $(".tt").click(function(){
                    $("div[class^='productofcategoryid-']").css("display","inline");
                    $(".category-active").removeClass("active");
                    $(this).addClass("active");
                });
            });
    {/literal}
    {foreach $willAllSubcategory as $itemSub}
        {literal}
            $(document).ready(function(){
                $(".categoryid-{/literal}{$itemSub.id_category}{literal}").click(function(){
                    $(".category-active").removeClass("active");
                    $(this).addClass("active");
                    $("div[class^='productofcategoryid-']").css("display","none");
                    $(".productofcategoryid-{/literal}{$itemSub.id_category}{literal}").css("display","inline");
                });
            });
        {/literal}
    {/foreach}
</script>

<p>{*$willAllObjects|@print_r*}</p>

<div class="row promohometab_list ">

    {foreach $willAllProducts.product as $item2}

        <div class="{foreach $item2.product_categId as $item_categ}productofcategoryid-{$item_categ} {/foreach}promohometab_product">

            {$date_insert=$item2.product_content->date_add|date_format:"%Y/%m/%d"}
            {$date_old = date("Y/m/d", strtotime("-20 day"))}

                <div class="row">

                    <div class="col-lg-12" id="imgPromo">

                        
                        <a href="{$urls.base_url}accueil/{$item2.product_id}-{$item2.product_content->link_rewrite.1}.html">
                           
                            {if $date_insert > $date_old}
                            <div class="nouveau_produit">nouveau</div>
                            {/if}

                            <img src="{$urls.base_url}{$item2.product_id}-home_default/{$item2.product_content->link_rewrite.1}.jpg" alt="{$item2.product_content->name.1}" class="img-fluid"/>

                        </a>

                    </div>

                    <div class="col-lg-12" id="PrixPromo">

                        {$item2.product_content->price|string_format:"%.2f"}&euro;

                    </div>
                    {*$item2.product_content|@print_r*}
                    <div class="col-lg-12" id="nomProduitPromo">

                        {*$item2.id_product*} {$item2.product_content->name.1}

                    </div>

                    <div class="col-lg-12" id="DescPromo">

                        {$item2.product_content->description_short.1|strip_tags|truncate:100}

                    </div>

                </div>
            </div>
    {/foreach}
</div>

{*debug*}



