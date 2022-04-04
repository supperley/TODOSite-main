<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои задачи</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-bs-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новую задачу
    </a>
    <div class="collapse mb-3" id="collapseExample">
        <form action="/task/create" method="post" enctype="multipart/form-data">
            <div class="row justify-content-between">
                <div class="mb-3 col-4">
                    <label for="reviewName" class="col-form-label">Название задачи</label>
                    <input type="text" required class="form-control"
                           id="reviewName" name="title">
                </div>

                <div class="mb-3 col-4">
                    <label for="reviewTag" class="col-form-label">Тэги задачи</label>
                    <input type="tag" required class="form-control"
                           id="reviewЕфп" name="tag">
                </div>

                <div class="mb-3 col-4">
                    <label for="searchGroup" class="col-form-label">Приоритет</label>
                    <select id="searchGroup" required name="group" class="form-select">
                        <option value="">Приоритет не выбран</option>
                        <option value="High">Высокий</option>
                        <option value="Medium">Средний</option>
                        <option value="Low">Низкий</option>
                        <option value="None">Нет</option>
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <label for="description" class="col-form-label">Описание задачи</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="mb-3">
                    <label class="form-label" for="file1">Первая фотография</label>
                    <input class="form-control" type="file" name="file1" id="file1">
            </div>
            <div class="mb-3">
                <label class="form-label" for="file1">Вторая фотография</label>
                <input class="form-control" type="file" name="file2" id="file2">
            </div>
            <div class="mb-3">
                <label class="form-label" for="file1">Третья фотография</label>
                <input class="form-control" type="file" name="file3" id="file3">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
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
</@t.template>