<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1>Личный кабинет</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <ul class="nav nav-pills flex-column mb-auto">
            <li>
                <h2>${user.name}</h2>
            </li>
            <li>
                    <#if user.isAdmin()>
                        <a class="btn btn-dark col-3"
                           href="/admin">
                            Панель администратора
                        </a>
                    </#if>
            </li>
            <li>
                <a class="btn btn-dark col-3"
                   href="/my/reviews">
                    Мои задачи
                </a>
            <li>
        </ul>
    </div>
</@t.template>