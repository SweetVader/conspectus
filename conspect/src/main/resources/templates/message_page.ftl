<#import "parts/common.ftl" as c>

<@c.page>

<h2>${message.title}</h2>
<i>Author:  <a href="/user/profile/${message.author.id}">${message.authorName}</a></i>
<h6 class = "text-muted">Speciality № ${message.num}</h6>
<h6><i>#${message.tag}</i></h6><br/>
<h4>Description:</h4>
<div class="container-fluid">${message.text}</div><br/>
<h4>File:</h4>
<a href="/file/${message.filename}">${message.filename}</a><br/>

<h1><i class="fas fa-comments"></i></h1>

<div class="form-group mt-3 col-sm-6">
    <form method="post" action="/messages/${message.id}/comment">
        <div class="form-group">
            <input type="text" class="form-control ${(commentError??)?string('is-invalid', '')}"
                   value="<#if comment??>${comment}</#if>" name="comment" placeholder="Enter comment"/>
            <#if commentError??>
                <div class="invalid-feedback">
                    ${commentError}
                </div>
            </#if>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="hidden" name="id" value="<#if comment??>${comment}</#if>"/>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Add comment</button>
        </div>
    </form>
</div>



</@c.page>