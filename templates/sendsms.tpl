{if $error_sms and $error_sms == 'smscrypttokensrequired'}
{elseif $error_sms and $error_sms == 'smsuserfound'}
    <div class="alert shadow alert-info">
    <form action="#" method="post" class="form-horizontal">
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label text-end">{$msg_userfullname}</label>
            <div class="col-sm-8">
                <p class="form-control-static">{$displayname}</p>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label text-end">{$msg_login}</label>
            <div class="col-sm-8">
                <p class="form-control-static">{$login}</p>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label text-end">{$msg_sms}</label>
            <div class="col-sm-8">
                <p class="form-control-static">{$smsdisplay}</p>
            </div>
        </div>
        <input type="hidden" name="formtoken" value="{$formtoken}" />
        <input type="hidden" name="encrypted_sms_login" value="{$encrypted_sms_login}" />
        <div class="row mb-3">
            <div class="offset-sm-4 col-sm-8">
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-fw fa-check-square-o"></i> {$msg_submit}
                </button>
            </div>
        </div>
    </form>
    </div>
{elseif $error_sms and ($error_sms == 'smssent' or $error_sms == 'smssent_ifexists' or $error_sms == 'tokenattempts')}
    <div class="alert shadow alert-info">
    <form action="#" method="post" class="form-horizontal">
        <div class="row mb-3">
            <label for="smstoken" class="col-sm-4 col-form-label text-end">{$msg_smstoken}</label>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-fw fa-key"></i></span>
                    <input type="text" name="smstoken" id="smstoken" class="form-control" placeholder="{$msg_smstoken}" />
                </div>
            </div>
        </div>
        <input type="hidden" name="token" value="{$token}" />
        <div class="row mb-3">
            <div class="offset-sm-4 col-sm-8">
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-fw fa-check-square-o"></i> {$msg_submit}
                </button>
            </div>
        </div>
    </form>
    </div>
{else}
    {if $show_help}
    <div class="fr-alert fr-alert--info fr-mb-md-6v"> <!--dsfr style for info message-->
        {if $sms_use_ldap}
            {$msg_sendsmshelpnosms|unescape: "html" nofilter}
        {else}
            {$msg_sendsmshelp|unescape: "html" nofilter}
        {/if}
        {if $attribute_phone_update}
        <br /><i class="fa fa-fw fa-pencil-square-o"></i>
            {$msg_sendsmshelpupdatephone|unescape: "html" nofilter}
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
            <input type="hidden" name="formtoken" value="{$formtoken}" />
        </div>
        {if ($use_captcha)}
            {$captcha_html nofilter}
        {/if}
        {if !$sms_use_ldap}

        <div class="fr-fieldset__element"> <!--dsfr phone-->
            <div class="fr-input-group">
                <label for="telephone" class="fr-label">{$msg_phone}</label>
                <input type="text" name="phone" id="phone" value="{$phone}" class="fr-input" />
            </div>
        </div>

        {/if}

        <div class="fr-fieldset__element"> <!--dsfr search button-->
            <div class="fr-btns-group--right">
                <button type="submit" class="fr-mt-2v fr-btn fr-btn">
                <i class="fa fa-fw fa-search"></i> {$msg_getuser}
                </button>
            </div>
        </div>
    </form>
    </div>
    </div>
    </div>
{/if}
