{if $result !== 'tokensent' and $result !== 'tokensent_ifexists'}
{if $show_help}
    <div class="fr-alert fr-alert--info fr-mb-md-6v"> <!--dsfr style for info message-->
        {if $mail_address_use_ldap}
            {$msg_sendtokenhelpnomail|unescape: "html" nofilter}
        {else}
            {$msg_sendtokenhelp|unescape: "html" nofilter}
        {/if}
        {if $attribute_mail_update}
        <br /><i class="fa fa-fw fa-pencil-square-o"></i>
            {$msg_sendtokenhelpupdatemail|unescape: "html" nofilter}
        {/if}
    </div>
{/if}

<div class="fr-container fr-background-alt--grey fr-px-md-0 fr-pt-10v fr-pt-md-14v fr-pb-6v fr-pb-md-10v">
<div class="fr-grid-row fr-grid-row--gutters fr-grid-row--center">
<div class="fr-col-12 fr-col-md-10 fr-col-lg-9"> <!--dsfr container for large padding-->
<form action="#" method="post" class="form-horizontal">

    <div class="fr-fieldset__element"> <!--dsfr login-->
        <div class="fr-input-group">
            <label for="login" class="fr-label">{$msg_login}</label>
            <input type="text" name="login" id="login" value="{$login}" class="fr-input" />
        </div>
    <input type="hidden" name="formtoken" id="formtoken" value="{$formtoken}" />
    </div>

    {if !$mail_address_use_ldap}
    <div class="fr-fieldset__element"> <!--dsfr email-->
        <div class="fr-input-group">
            <label for="mail" class="fr-label">{$msg_mail}</label>
            <input type="email" name="email" id="email" value="{$usermail}" class="fr-input" />
        </div>
    </div>

    {/if}
    {if ($use_captcha)}
        {$captcha_html nofilter}
    {/if}
    <div class="fr-fieldset__element"> <!--dsfr submit button-->
        <div class="fr-btns-group--right">
            <button type="submit" class="fr-mt-2v fr-btn fr-btn">
            <i class="fa fa-fw fa-check-square-o"></i> {$msg_submit}
            </button>
        </div>
    </div>

</form>
</div>
</div>
</div>
{/if}
