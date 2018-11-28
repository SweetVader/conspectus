<#import "parts/common.ftl" as c>

<@c.page>
<h2>List of users</h2>

<table class="table table-hover">

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
                    <a class="btn btn-outline-danger" href="/user/${user.id}/delete">Delete</a>
                </td>
            </tr>
        </#list>
        </tbody>

</table>
</@c.page>