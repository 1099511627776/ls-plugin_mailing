{assign var="bNoSidebar" value=true}
{include file='header.tpl' menu='talk'}
<style type="text/css" media='all'>
    @import url({$sTemplateWebPathPluginMailing}/css/style.css);
</style>

{include file='editor.tpl'}

<div class="topic">
    <h1>{$aLang.plugin.mailing.ml_title}</h1>
    <form action="" method="post" id="mlForm">
        <input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />
        <div class="fieldset">
            <label for="subject">{$aLang.talk_create_title}:</label>
            <input class="input-text input-width-full" name="subject" id="subject" type="text"  size="55" value="{$_aRequest.subject}"/>
        </div>
        <div class="fieldset">
            <div class="note"></div>
            <label for="talk_text">{$aLang.talk_create_text}:</label>
            <textarea name="talk_text" class="mce-editor markitup-editor input-width-full" id="talk_text" rows="12">{$_aRequest.talk_text}</textarea>
        </div>
        <div class="fieldset">
            {$aLang.plugin.mailing.ml_sex}:
            <br />
            <input name="aSex[]" type="checkbox" value="man" checked="checked"/> — {$aLang.user_stats_sex_man}
            <br />
            <input name="aSex[]" type="checkbox" value="woman" checked="checked"/> — {$aLang.user_stats_sex_woman}
            <br />
            <input name="aSex[]" type="checkbox" value="other" checked="checked"/> — {$aLang.user_stats_sex_other}
            <br />
        </div>
        {if $sTemplateWebPathPluginL10n}
            <div class="fieldset">
                {$aLang.plugin.mailing.ml_lang}:
                <br />
                {foreach from=$aLangs key=sLangKey item=sLangText}
                    <input name="aLangs[]" type="checkbox" value="{$sLangKey}" checked="checked"/> —
                    <img src="{$sTemplateWebPathPluginL10n}images/flags/{$sLangKey}.png" alt="{$sLangKey}"/>
                    <br />
                {/foreach}
            </div>
        {/if}
        <div class="fieldset">
            <input name="active" id="active" type="checkbox" checked="checked"/> — {$aLang.plugin.mailing.ml_active}
            <br />
        </div>

        <div class="fieldset">
            <input id="talk" name="talk" type="checkbox" value="1" {if ($_aRequest.send_talk)}checked="checked"{/if}/> — {$aLang.plugin.mailing.ml_send_talk}
        </div>

        <p class="buttons">
            <input type="submit" name="submit" value="{$aLang.talk_create_submit}" />
            <input type="submit" name="submit_preview" value="{$aLang.topic_create_submit_preview}" onclick="$('#text_preview').parent().show(); ls.tools.textPreview('talk_text',false); return false;" />
        </p>
    </form>
</div>
<div class="topic" style="display: none;">
    <div class="content" id="text_preview"></div>
</div>

{include file='footer.tpl'}