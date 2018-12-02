<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search conspectus">
            <button type="submit" class="btn btn-primary ml-2"><i class="fas fa-search"></i></button>
        </form>
    </div>
</div>

<#include "parts/messageList.ftl" />

</@c.page>