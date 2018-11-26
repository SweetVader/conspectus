<#import "parts/common.ftl" as c>

<@c.page>
<h4>${username}</h4>

<form method="post" action="/delete">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Speciality number</th>
                <th scope="col">Tag</th>
                <th scope="col">File</th>
                <th></th>
                <th></th>
            </tr>
        </thead>

        <#list messages as message>

            <tbody>
                <#if message??>
                    <tr>
                        <th>${message.title}</th>
                        <td>${message.text}</td>
                        <td>${message.num}</td>
                        <td>${message.tag}</td>
                        <td><a href="/file/${message.filename}">${message.filename}</a></td>
                        <#include "parts/security.ftl">
                        <#if message.author.id == currentUserId || isAdmin>
                            <td><a class="btn btn-success" href="/user/profile/${message.author.id}?message=${message.id}">Edit</a></td>
                            <td><button type="submit" class="btn btn-danger">Delete</button></td>
                        <#else>
                            <td>Like?</td>
                            <td>Rating?</td>
                        </#if>
                    </tr>
                </#if>
            </tbody>
        </#list>
    </table>
</form>

<#include "parts/messageEdit.ftl" />

</@c.page>