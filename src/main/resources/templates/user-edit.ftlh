<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1 style="text-align: center">Редактирование пользователя ${edited_user.name}</h1><hr>
    <div class="row pb-3 border-bottom">
        <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
            <label class="form-label mb-0" for="phone">
                <strong class="d-block text-center">ID пользователя</strong>
            </label>
        </p>
        <div class="col-12 col-md-10">
            ${edited_user.id}
        </div>
    </div>
<form action="/admin/user/edit" method="post">
    <div class="row pt-3 pb-3 border-bottom">
        <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
            <label class="form-label mb-0" for="name">
                <strong class="d-block text-center">Изменить роль</strong>
            </label>
        </p>
        <div class="col-12 col-md-10">
            <select id="role" required name="role" class="form-select">
                <#list roles as role>
                    <option <#if edited_user.roles?seq_contains(role)>selected</#if> value="${role}">${role}</option>
                </#list>
            </select>
        </div>
    </div>
<#--    <div class="row pt-3 pb-3 border-bottom">-->
<#--        <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">-->
<#--            <label class="form-label mb-0" for="phone">-->
<#--                <strong class="d-block text-center">Изменить номер телефона</strong>-->
<#--            </label>-->
<#--        </p>-->
<#--        <div class="col-12 col-md-10">-->
<#--            <input type="text" required class="form-control"-->
<#--                   id="phoneNumber" name="phoneNumber" value="${edited_user.phoneNumber}">-->
<#--        </div>-->
<#--    </div>-->

    <div class="d-flex flex-wrap justify-content-between align-items-center taskinfo-nav">
        <div class="d-block m-3">
            <a href="/admin">Вернуться</a>
        </div>
        <div class="d-flex flex-wrap">
            <input type="hidden" value="${edited_user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="mt-3 btn btn-dark">Сохранить</button>
        </div>
    </div>

</form>
</@t.template>