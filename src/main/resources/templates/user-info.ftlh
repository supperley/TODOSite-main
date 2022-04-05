<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
            <img src="/static/images/avatar.png"
                 style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
    </div>
    <hr>
    <h1 style="text-align: center">Задачи пользователя ${user.name}</h1>
    <br>
    <div class="col-12" id="masonry" data-masonry='{"percentPosition": true }'>
        <div class="row">
            <#list tasks as task>
                <a href="/task/${task.id}" class="col-sm-6 col-lg-4 task-link">
                    <div class="card text-white bg-dark my-3 task">
                        <#if task.previewImageId != -1>
                            <img src="/images/${task.previewImageId}" class="card-img-top">
                        </#if>
                        <div class="card-body">
                            <h5 class="card-title">${task.title}</h5>
                        </div>
                    </div>
                </a>
            </#list>
        </div>
    </div>
</@t.template>

