{if $prehook_return and $display_prehook_error and $prehook_return > 0}
    <div class="fr-alert fr-alert--warning fr-mb-md-6v"> <!--dsfr style for warning message-->
    {$prehook_output[0]}
    </div>
{/if}
{if $posthook_return and $display_posthook_error and $posthook_return > 0}
    <div class="fr-alert fr-alert--warning fr-mb-md-6v"> <!--dsfr style for warning message-->
    {$posthook_output[0]}
    </div>
{/if}
{if $result !== "passwordchanged"}
    {if $show_help }
        <div class="fr-alert fr-alert--info fr-mb-md-6v"> <!--dsfr style for info message-->
        {$msg_changehelp}
        {if $msg_changehelpextramessage}
           <br />{$msg_changehelpextramessage|unescape: "html" nofilter}
        {/if}
        {if !$show_menu and ($use_questions or $use_tokens or $use_sms or $change_sshkey) }
            <ul>
                {if $use_questions}
                    <li>{$msg_changehelpquestions|unescape: "html" nofilter}</li>
                {/if}
                {if $use_tokens}
                    <li>{$msg_changehelptoken|unescape: "html" nofilter}</li>
                {/if}
                {if $use_sms}
                    <li>{$msg_changehelpsms|unescape: "html" nofilter}</li>
                {/if}
                {if $change_sshkey}
                    <li>{$msg_changehelpsshkey|unescape: "html" nofilter}</li>
                {/if}
            </ul>
        {/if}
        </div>
    {/if}
    <!--dsfr il faut enlever la possibilité de mettre le ppolicy au-dessus, il doit être intégré dans le cadre, en bas
    {if $pwd_show_policy !== "never" and $pwd_show_policy_pos === 'above'}
        {include file="policy.tpl"}
    {/if}
    -->
    <div class="fr-container fr-background-alt--grey fr-px-md-0 fr-pt-10v fr-pt-md-14v fr-pb-6v fr-pb-md-10v">
    <div class="fr-grid-row fr-grid-row--gutters fr-grid-row--center">
    <div class="fr-col-12 fr-col-md-10 fr-col-lg-9"> <!--dsfr container for large padding-->
    <form action="#" method="post">

        <div class="fr-fieldset__element"> <!--dsfr login-->
            <div class="fr-input-group">
                <label for="login" class="fr-label">{$msg_login}</label>
                <input type="text" name="login" id="login" value="{$login}" class="fr-input" />
            </div>
        </div>

        <div class="fr-fieldset__element"> <!--dsfr password-->
            <div class="fr-input-group">
                <label for="oldpassword" class="fr-label">{$msg_oldpassword}</label>
                <input type="password" autocomplete="current-password" name="oldpassword" id="oldpassword" class="fr-input" />
            </div>
        </div>

        <div class="fr-fieldset__element"> <!--dsfr password-->
            <div class="fr-input-group">
                <label for="newpassword" class="fr-label">{$msg_newpassword}</label>
                <input type="password" autocomplete="new-password" name="newpassword" id="newpassword" class="fr-input"/>
            </div>
        </div>

        <div class="fr-fieldset__element"> <!--dsfr password-->
            <div class="fr-input-group">
                <label for="confirmpassword" class="fr-label">{$msg_confirmpassword}</label>
                <input type="password" autocomplete="new-password" name="confirmpassword" id="confirmpassword" class="fr-input"/>
            </div>
        </div>

        <div class="fr-fieldset__element"> <!--password policy-->
        {if $pwd_show_policy !== "never" and $pwd_show_policy_pos === 'below'}
        {include file="policy.tpl"}
        {/if}
        </div>

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

{elseif $msg_passwordchangedextramessage}
    <div class="result alert shadow alert-{$result_criticity}">
    <i class="fa fa-fw {$result_fa_class}" aria-hidden="true"></i> {$msg_passwordchangedextramessage|unescape: "html" nofilter}
    </div>
{/if}
