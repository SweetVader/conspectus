<#import "parts/common.ftl" as c>

<@c.page>
<h2>List of users</h2>

<table class="table table-hover">
    <form method="post" >
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Role</th>
                <th scope="col">Active</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <#list users as user>
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><#if user.active==true>ACTIVE<#else>BLOCK</#if></td>
                <td><a href="/user/${user.id}">Edit</a> </td>
                <td>
                    <button name = "CurrentDelete" type="submit" value="${user.id}" class="btn btn-outline-danger">Delete</button>
                </td>
            </tr>
        </#list>
        </tbody>
    </form>
</table>
</@c.page>