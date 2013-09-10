{assign var="bNoSidebar" value=true}
{include file='header.tpl' menu='talk'}
<style type="text/css" media='all'> 
    @import url({$sTemplateWebPathPluginMailing}/css/style.css); 
</style>

{include file='editor.tpl'}

<div class="topic" style="display: none;">
    <div class="content" id="text_preview"></div>
</div>

<div class="topic">
    <h1>{$aLang.plugin.mailing.ml_title}</h1>
    <form action="" method="post" id="mlForm">
        <input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />
        <input type="hidden" name="mailing_id" value="{$oMailing->getMailingId()}" />
        <div class="fieldset">
            <label for="subject">{$aLang.talk_create_title}:</label>
            <input class="input-text input-width-full" name="subject" id="subject" type="text"  size="55" 
                   value="{$oMailing->getMailingTitle()}"/>
        </div>
        <div class="fieldset">
            <div class="note"></div>
             <label for="talk_text">{$aLang.talk_create_text}:</label>
            <textarea name="talk_text" id="talk_text" class="mce-editor markitup-editor input-width-full" rows="12">{$oMailing->getMailingText()}</textarea>
        </div>

        <div class="fieldset">
            <span class="input-note">{$aLang.plugin.mailing.ml_edit_warning}</span>
        </div>
        <div class="fieldset">
            {$aLang.plugin.mailing.ml_sex}:
            <br />
            <input name="aSex[]" type="checkbox" value="man" {if in_array('man', $oMailing->getMailingSex())}checked="checked"{/if} /> — {$aLang.user_stats_sex_man}
            <br />
            <input name="aSex[]" type="checkbox" value="woman" {if in_array('woman', $oMailing->getMailingSex())}checked="checked"{/if}/> — {$aLang.user_stats_sex_woman}
            <br />
            <input name="aSex[]" type="checkbox" value="other" {if in_array('other', $oMailing->getMailingSex())}checked="checked"{/if}/> — {$aLang.user_stats_sex_other}
            <br />
        </div>
        {if $sTemplateWebPathPluginL10n}
            <div class="fieldset">
                {$aLang.plugin.mailing.ml_lang}:
                <br />
                {foreach from=$aLangs key=sLangKey item=sLangText}
                    <input name="aLangs[]" type="checkbox" value="{$sLangKey}" {if in_array($sLangKey, $oMailing->getMailingLang())}checked="checked"{/if} /> — 
                    <img src="{$sTemplateWebPathPluginL10n}images/flags/{$sLangKey}.png" alt="{$sLangKey}"/>
                    <br />
                {/foreach}
            </div>
        {/if}
        <p class="buttons">
            <input type="submit" name="submit_mailing_edit" style="width:90px" value="{$aLang.plugin.mailing.ml_save}"/>
            <input type="submit" name="cancel" style="width:90px" value="{$aLang.plugin.mailing.ml_cancel}"/>
        </p>
    </form>
</div>

{include file='footer.tpl'}