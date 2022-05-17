<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1 style="text-align: center">Редактирование пользователя ${user.name}</h1><hr>
<form action="/admin/user/edit" method="post">
    <select id="role" required name="role" class="form-select">
    <#list roles as role>
        <option <#if user.roles?seq_contains(role)>selected</#if> value="${role}">${role}</option>
    </#list>
    </select>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit" class="mt-3 btn btn-dark">Сохранить</button>
</form>
</@t.template>