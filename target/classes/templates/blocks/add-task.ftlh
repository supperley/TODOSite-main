<#macro add_task>
    <a class="btn btn-dark my-2" style="text-align: center; width: 100%"
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
                    <label for="priority" class="col-form-label">Приоритет</label>
                    <select id="priority" required name="priority" class="form-select">
                        <option value="">Приоритет не выбран</option>
                        <option value="3">Высокий</option>
                        <option value="2">Средний</option>
                        <option value="1">Низкий</option>
                        <option value="0">Нет</option>
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
</#macro>