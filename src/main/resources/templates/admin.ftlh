<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Панель администратора</h1><hr>
    <div class="table-responsive">
        <table class="table w-100 table-light table-striped table-hover">
            <tr class="table-dark">
                <th scope="col">Email</th>
                <th scope="col">Активность</th>
                <th scope="col">Роли</th>
                <th scope="col">Подробная информация</th>
                <th scope="col">Редактирование</th>
            </tr>
            <#list users as user>
                <tr>
                    <th>${user.email}</th>
                    <th><#if user.active>true<#else>false</#if></th>
                    <th><#list user.roles as role>${role}</#list></th>
                    <th><a href="/user/${user.id}">Подробная информация</a></th>
                    <th><a href="/admin/user/edit/${user.id}">Изменить</a></th>
                </tr>
            <#else>
                <h3>Пользователей нет</h3>
            </#list>
        </table>
    </div>
</@t.template>