<a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">
    Private information
</a>
<div class="collapse multi-collapse <#if information??>show</#if>" id="multiCollapseExample1">
    <div class="form-group mt-3">
        <form method="post" action="/user/profile/${user.id}/information">
            <div class="form-group">
                <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       value="${user.username}" name="username" placeholder="Enter username"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(countryError??)?string('is-invalid', '')}"
                       value="<#if user.country??>${user.country}</#if>" name="country" placeholder="Enter country"/>
                <#if countryError??>
                    <div class="invalid-feedback">
                        ${countryError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(cityError??)?string('is-invalid', '')}"
                       value="<#if user.city??>${user.city}</#if>" name="city" placeholder="Enter city"/>
                <#if cityError??>
                    <div class="invalid-feedback">
                        ${cityError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(universityError??)?string('is-invalid', '')}"
                       value="<#if user.university??>${user.university}</#if>" name="university"  placeholder="Enter university"/>
                <#if universityError??>
                    <div class="invalid-feedback">
                        ${universityError}
                    </div>
                </#if>
            </div>
            <div class="form-group">Date of Birth:
                <#if user.DOB??>${user.DOB}<br/>Change:</#if>
            <input type="date" class="form-control" name="birth"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save information</button>
            </div>
        </form>
    </div>
</div>