<#import "blocks/template.ftlh" as t>
<#import "blocks/add-task.ftlh" as t2>
<@t.template user>
    <h1 style="text-align: center">Мои задачи</h1>
    <hr>

    <@t2.add_task></@t2.add_task>

    <#if tasks?has_content>
        <div class="col-12" id="masonry" data-masonry='{"percentPosition": true }'>
            <div class="row">
                <#list tasks as task >
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <a href="/task/${task.id}" class="task-link">
                            <div class="card text-black bg-light my-3 task">
                                <div class="card-top d-flex align-items-center justify-content-between">
                                    <div class="rounded-0 ms-3" style="min-width: 25px; text-align: center">
                                        <form action="/task/check/${task.id}" method="post">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <input class="form-check-input" type="checkbox"
                                                   onChange="this.form.submit()" value="" <#if task.isChecked>checked</#if>>
                                        </form>
                                    </div>
                                    <form action="/task/delete/${task.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger m-3">
                                            Удалить
                                        </button>
                                    </form>
                                </div>
                                <#if task.previewImageId != -1>
                                    <img src="/images/${task.previewImageId}"
                                         class="card-img-top">
                                </#if>
                                <div class="card-body">
                                    <h5 class="card-title">${task.title}</h5>
                                    <h6 class="card-title">${task.priority}</h6>
                                </div>
                            </div>
                            </a>
                    </div>
                <#else>
                    <h1 style="text-align: center">Не найдено</h1>
                </#list>
            </div>
        </div>
    </#if>
</@t.template>