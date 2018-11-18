<#import "parts/common.ftl" as c>

<@c.page>


<h3>Sorry, you should enter or register to continue...</h3>

<div class="mt-3">
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button  class="btn btn-primary" type="submit">Sign In</button>
    </form>
</div>


</@c.page>