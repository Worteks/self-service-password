
{if $display_footer}

<footer class="fr-footer" role="contentinfo" id="footer">
    <div class="fr-container">
        <div class="fr-footer__body">
            <div class="fr-footer__brand fr-enlarge-link">
                <p class="fr-logo">Ministère<br>de l'agriculture<br>et de la souveraineté<br>alimentaire</p>
            </div>
            <div class="fr-footer__content">
                <div>LDAP Tool Box Self Service Password - version {$version}</div>
            </div>
        </div>
        <div class="fr-footer__bottom">
            <ul class="fr-footer__bottom-list">
                <li class="fr-footer__bottom-item">
                    <a class="fr-footer__bottom-link" href="#">Plan du site</a>
                </li>
                <li class="fr-footer__bottom-item">
                    <a class="fr-footer__bottom-link" href="#">Accessibilité : non/partiellement/totalement conforme</a>
                </li>
                <li class="fr-footer__bottom-item">
                    <a class="fr-footer__bottom-link" href="#">Mentions légales</a>
                </li>
            </ul>
        </div>
    </div>
</footer>


{/if}
<div id="ltb-component" hidden>ssp</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="module" src="vendor/dsfr/dsfr.module.min.js"></script>
<script src="js/self-service-password.js"></script>
<script src="js/ppolicy.js"></script>
{if $captcha_js}
{$captcha_js nofilter}
{/if}
{if ($questions_count > 1)}
<script src="js/jquery.selectunique.js"></script>
<script>$(document).ready(function() { $('.question').selectunique(); })</script>
{/if}
</body>
</html>



