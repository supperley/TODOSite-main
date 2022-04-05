<#import "blocks/template.ftlh" as t>
<#import "blocks/add-task.ftlh" as t2>
<@t.template user>
    <h1>Список задач</h1><hr>
    <@t2.add_task></@t2.add_task>
    <div class="mt-3 row">
        <aside class="col-12 col-md-3 mb-4">
            <form method="get" action="/">
                <div>
                    <label for="priority" class="col-form-label">Приоритет</label>
                    <div>
                        <select id="priority" class="form-select" name="priority">
                            <option value="">Приоритет не выбран</option>
                            <option <#if priority?? && priority == "High">selected</#if> value="High">Высокий</option>
                            <option <#if priority?? && priority == "Medium">selected</#if> value="Medium">Средний</option>
                            <option <#if priority?? && priority == "Low">selected</#if> value="Low">Низкий</option>
                            <option <#if priority?? && priority == "None">selected</#if> value="None">Нет</option>
                        </select>
                    </div>
                </div>
                <div>
                    <label class="col-form-label" for="title">Поиск среди задач</label>
                    <div class="">
                        <input class="form-control" type="text" name="title" <#if title??>value="${title}"</#if>
                               id="title">
                    </div>
                </div>
                <div>
                    <button style="width: 100%" type="submit" class="btn btn-dark mt-3">Поиск</button>
                </div>
            </form>
        </aside>
        <#if tasks?has_content>
            <div class="col-12 col-md-9" id="masonry" data-masonry='{"percentPosition": true }'>
                <div class="row w-100">
                    <#list tasks as task>
                        <#if !task.isChecked>
                            <div class="col-sm-6 col-lg-4 mb-4">
                                <a href="/task/${task.id}" class="task-link">
                                    <div class="card text-black bg-light my-9 task">
                                        <#if task.previewImageId != -1>
                                            <img src="/images/${task.previewImageId}"
                                                 class="card-img-top" alt="previewImageId">
                                        </#if>
                                        <div class="d-flex align-items-center">
                                            <div class="rounded-0 ms-2" style="min-width: 25px; text-align: center">
                                                <form action="/task/check/${task.id}" method="post">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                    <input class="form-check-input" type="checkbox" onChange="this.form.submit()" value="">
                                                </form>
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title">${task.title}</h5>
                                                    <#switch task.priority>
                                                        <#case 3>
                                                            <h6 class="card-title text-danger">Высокий</h6>
                                                            <#break>
                                                        <#case 2>
                                                            <h6 class="card-title text-warning">Средний</h6>
                                                            <#break>
                                                        <#case 1>
                                                            <h6 class="card-title text-success">Низкий</h6>
                                                            <#break>
                                                        <#default>
                                                        <h6 class="card-title">Нет</h6>
                                                    </#switch>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </#if>
                    </#list>
                </div>
            </div>
        <#else>
            <h1 class="col-9" style="text-align: center">Не найдено</h1>
        </#if>
    </div>
</@t.template>