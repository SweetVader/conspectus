<#import "parts/common.ftl" as c>

<@c.page>
<h5>${username}</h5>

<#include "parts/messageList.ftl" />

<#if isCurrentUser || isAdmin>
    <#include "parts/messageEdit.ftl" />
</#if>



</@c.page>