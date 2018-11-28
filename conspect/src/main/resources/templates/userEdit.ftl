<#import "parts/common.ftl" as c>

<@c.page>
<h5>User editor</h5>

<form method="post">
    <div class="col-sm-4 mt-3">
        <input type="text" class="form-control" name="username" value="${user.username}">
    </div>
    <div class = "mt-2"><h6>Role:</h6></div>
    <#list roles as role>
        <div class = "mt-2">
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>

    <div class = "mt-2"><h6>Status:</h6></div>
    <div class = "mt-2">
        <input type="radio" name="status" value="1" <#if user.isActive()==true>checked</#if>>
        <label>ACTIVE</label>
        <input type="radio" name="status" value="0" <#if user.isActive()==false>checked</#if>>
        <label>BLOCK</label>
    </div>

    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button class="btn btn-primary" type="submit">Save</button>

</form>
</@c.page>