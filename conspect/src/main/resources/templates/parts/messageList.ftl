<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <div class="m-2">
            <span>${message.text}</span><br/>
            <i>#${message.tag}</i>
        </div>
        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top" >
        </#if>
        <div class="card-footer text-muted">
            <#if user??>
                <a href="/user/profile/${message.author.id}">${message.authorName}</a>
            <#else> <a href="/guest">${message.authorName}</a>
            </#if>
            <#include "security.ftl">
            <#if message.author.id == currentUserId || isAdmin>
                <a class="btn btn-primary" href="/user/profile/${message.author.id}?message=${message.id}">
                    Edit
                </a>
            </#if>
        </div>
    </div>
    <#else>
    No message
    </#list>
</div>