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
        <form action="/review/create" method="post" enctype="multipart/form-data">
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
                        <option value="Высокий">Высокий</option>
                        <option value="Средний">Средний</option>
                        <option value="Низкий">Низкий</option>
                        <option value="Нет">Нет</option>
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
    <div class="row" data-masonry='{"percentPosition": true }'>
        <#list reviews as review >
            <div class="col-sm-6 col-lg-4 mb-4">
                <a href="/review/${review.id}" class="review-link">
                    <div class="card text-black bg-light my-3 review">
                        <div class="card-top">
                            <form action="/review/delete/${review.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-danger m-3">
                                    Удалить
                                </button>
                            </form>
                        </div>
                        <img src="/images/${review.previewImageId}"
                             class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">${review.title}</h5>
                            <h6 class="card-title">${review.group}</h6>
                        </div>
                    </div>
                    </a>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>