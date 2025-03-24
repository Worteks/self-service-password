{include file="header.tpl"}

<header role="banner" class="fr-header">  <!--dsfr header-->
    <div class="fr-header__body">
        <div class="fr-container">
            <div class="fr-header__body-row">
                <div class="fr-header__brand fr-enlarge-link">
                    <div class="fr-header__brand-top">
                        <div class="fr-header__logo">
                            <p class="fr-logo">Ministère<br>de l'agriculture<br>et de la souveraineté<br>alimentaire</p>
                        </div>
                    </div>
                    <div class="fr-header__service">
                        <a href="index.php">
                            <p class="fr-header__service-title">{$msg_title}</p>
                        </a>
                        <p class="fr-header__service-tagline">Self service password</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
        {if $show_menu }
            {include file="menu.tpl"}
       <!--dsfr pas d'alternative, le menu doit être présent et s'il y a un titre c'est dans le main-->
        {/if}

</header>

<main role="main" id="content">
    <div class="fr-container fr-mt-8v fr-mt-md-14v fr-mb-2v fr-mb-md-8v">

       <!-- <div class="fr-grid-row fr-grid-row--gutters fr-grid-row--center">             <div class="fr-col-12 fr-col-md-10 fr-col-lg-8">                <h1 class="fr-h2">{$msg_title}</h1>            </div>        </div>        -->
       <!--dsfr title-->

        <div class="fr-grid-row fr-grid-row--gutters fr-grid-row--center">
            <div class="fr-col-12 fr-col-md-10 fr-col-lg-8">
                {if count($dependency_errors)}
                {foreach from=$dependency_errors key=result item=result_array}
                    {if $result_array['criticity'] == "danger"} <!-- dsfr contournement problème mapping : l'indication "danger" doit être remplacée par "error", pour "warning" et "success" ce sont les mêmes -->
                    <div class="fr-alert fr-alert--error fr-mb-md-6v">
                        {$result_array['error']|unescape: "html" nofilter}
                    </div>
                    {else}
                    <div class="fr-alert fr-alert--{$result_array['criticity']} fr-mb-md-6v">
                        {$result_array['error']|unescape: "html" nofilter}
                    </div>
                    {/if}
                {/foreach}
                {else}
                {if $error != ""}
                    {if $result_criticity == "danger"} <!-- dsfr contournement problème mapping : l'indication "danger" doit être remplacée par "error", pour "warning" et "success" ce sont les mêmes -->
                    <div class="fr-alert fr-alert--error fr-mb-md-6v">
                        {$error|unescape: "html" nofilter}
                        {if $show_extended_error and $extended_error_msg}
                        ({$extended_error_msg})
                        {/if}
                    </div>
                    {else}
                    <div class="fr-alert fr-alert--{$result_criticity} fr-mb-md-6v">
                        {$error|unescape: "html" nofilter}
                        {if $show_extended_error and $extended_error_msg}
                        ({$extended_error_msg})
                        {/if}
                    </div>
                    {/if}
                {/if}
                {include file="$action.tpl"}
                {/if}
            </div>
        </div>

    </div>
</main>

{include file="footer.tpl"}
