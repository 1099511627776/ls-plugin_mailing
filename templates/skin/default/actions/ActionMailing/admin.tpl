{include file="header.tpl"}
    <ul>
    {foreach from=$aSubscribers item=oSubs}
        <li>
            {$oSubs->getUserMail()} ({$oSubs->getUserName()})
            <a href="{router page="mailing"}unsubscribe?email={$oSubs->getUserMail()}&hash={$oSubs->getUnsubHash()}">delete</a>
            {if !$oSubs->getActivated()}
            <a href="{router page="mailing"}aactivate?email={$oSubs->getUserMail()}&hash={$oSubs->getUnsubHash()}">activate</a>
            {/if}
        </li>
    {/foreach}
    </ul>
{include file="paging.tpl" aPaging=$aPaging}
{include file="footer.tpl"}