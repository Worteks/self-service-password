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
{if $result !== 'passwordchanged'}
    {if $show_help}
    <div class="fr-alert fr-alert--info fr-mb-md-6v"> <!--dsfr style for info message-->
    {$msg_resetbyquestionshelp|unescape: "html" nofilter}
    {if $question_populate_enable }
        <br /> {$msg_questionspopulatehint}
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
            <form action="#" method="post" class="form-horizontal">
                <div class="fr-fieldset__element">
                    <div class="fr-input-group">
                        <label for="login" class="fr-label">{$msg_login}</label>
                        <input type="text" name="login" id="login" value="{$login}" class="fr-input" />
                    </div>
                </div>

                {if $questions_count > 1}
                    {for $q_num = 1 to $questions_count}
                        <div class="row mb-3">
                            <label for="question{$q_num}" class="col-sm-4 col-form-label text-end">{$msg_question} {$q_num}</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-fw fa-question"></i></span>
                                    <select name="question[]" id="question{$q_num}" class="form-control question">
                                        <option value="">{$msg_question}</option>
                                        {foreach from=$msg_questions key=value item=text}
                                            <option value="{$value}" {if $question[$q_num-1] == $value}selected="selected"{/if}>{$text}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>

                    <div class="fr-fieldset__element">
                        <div class="fr-input-group">
                            <label for="answer{$q_num}" class="fr-label">{$msg_answer} {$q_num}</label>
                            <input type="text" name="answer[]" id="answer{$q_num}" class="fr-input" />
                        </div>
                    </div>

                    {/for}
                {else}

                <div class="fr-fieldset__element"> <!--dsfr question-->
                    <div class="fr-select-group">
                        <label class="fr-label" for="question">{$msg_question}</label>
                        <select class="fr-select" id="question" name="question">
                            <option value="" selected disabled hidden> Sélectionner une option</option>
                            {foreach from=$msg_questions key=value item=text}
                            <option value="{$value}">{$text}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>


                    <div class="fr-fieldset__element"> <!--dsfr answer-->
                        <div class="fr-input-group">
                            <label for="answer" class="fr-label">{$msg_answer}</label>
                            <input type="text" name="answer" id="answer" class="fr-input" />
                        </div>
                    </div>

                {/if}
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

{/if}
