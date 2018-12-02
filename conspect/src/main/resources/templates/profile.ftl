<#import "parts/common.ftl" as c>

<@c.page>
<h4>${username}</h4><br/>

<#include "parts/information.ftl" />


    <table class="table mt-3">
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

                    <tr>
                        <th><a href="/message/${message.id}">${message.title}</a></th>
                        <td>${message.text}</td>
                        <td>${message.num}</td>
                        <td>${message.tag}</td>
                        <td><a href="/file/${message.filename}">${message.filename}</a></td>
                        <#include "parts/security.ftl">
                        <#if message.author.id == currentUserId || isAdmin>
                            <td><a class="btn btn-success" href="/user/profile/${message.author.id}?message=${message.id}">Edit</a></td>
                            <td><a class = "btn btn-danger" href="/user/message/${message.id}/delete">Delete</a></td>
                        </#if>
                    </tr>

            </tbody>
        </#list>
    </table>


<#include "parts/messageEdit.ftl" />

</@c.page>