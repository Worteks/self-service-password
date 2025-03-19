<div class="fr-header__menu"> <!-- includes the grey line between logo and nav | j'ai supp modal pour garder le menu en colonne sur telephone -->
<div class="fr-container">
  <nav class="fr-nav" id="header-navigation" role="navigation" aria-label="Menu principal">
    <ul class="fr-nav__list">

      <li class="fr-nav__item">
        <a href="index.php"
        {if $action == 'change'}
        aria-current="page"
        {/if}
        class="fr-nav__link"
        >{$msg_title}
        </a>
      </li>

      {if $use_questions}
      <li class="fr-nav__item">
        <a href="?action=resetbyquestions"
        data-content="{$msg_changehelpquestions|strip_tags:false}"
        class="fr-nav__link"
        {if $action == 'resetbyquestions' or $action == 'setquestions'}
        aria-current="page"{/if}
        style="justify-content:left"
        ><i class="fa fa-fw fa-question-circle"></i> {$msg_menuquestions}</a> <!-- style="justify-content:left" surcharge du style pour que l'icône le texte restent collés quand le menu s'empile | le if aria-current sert mettre un syle particulier pour signaler que c'est la page en cours -->
      </li>

      {/if}
      {if $use_tokens}
      <li class="fr-nav__item">
        <a href="?action=sendtoken"
        data-content="{$msg_changehelptoken|strip_tags:false}"
        class="fr-nav__link"
        {if ($action == 'resetbytoken' and $source != 'sms') or $action == 'sendtoken'}
        aria-current="page"{/if}
        style="justify-content:left"
        ><i class="fa fa-fw fa-envelope"></i> {$msg_menutoken}</a>
      </li>

      {/if}
      {if $use_sms}
      <li class="fr-nav__item">
        <a href="?action=sendsms"
        data-content="{$msg_changehelpsms|strip_tags:false}"
        class="fr-nav__link"
        {if ($action == 'resetbytoken' and $source == 'sms') or $action == 'sendsms'}
        aria-current="page"{/if}
        style="justify-content:left"
        ><i class="fa fa-fw fa-mobile"></i> {$msg_menusms}</a>
      </li>

      {/if}
      {if $change_sshkey}
      <li class="fr-nav__item">
        <a href="?action=changesshkey"
        data-content="{$msg_changehelpsshkey|strip_tags:false}"
        class="fr-nav__link {if $action == 'changesshkey'}active{/if}"

        style="justify-content:left"
        ><i class="fa fa-fw fa-terminal"></i> {$msg_menusshkey}</a> <!-- il faut ajouter le if pour aria-current -->
      </li>

      {/if}
      {if $change_custompwdfield}
      {foreach from=$change_custompwdfield item=custompwdfield key=key}
      <li class="fr-nav__item">
        <a href="?action=changecustompwdfield&custompwdindex={$key}"
        data-content="{$msg_changehelpcustompwdfield|strip_tags:false|cat:$custompwdfield.label}"
        class="fr-nav__link {if $action == 'changecustompwdfield' and $key == $custompwdindex and $result !== "unknowncustompwdfield" }active{/if}"

        style="justify-content:left"
        ><i class="fa fa-fw fa-terminal"></i> {$msg_menucustompwdfield|cat:$custompwdfield.label} </a> <!--il faut ajouter le if pour aria-current -->
      </li>

      {/foreach}
      {/if}
    </ul>
  </nav>
</div>
</div>
