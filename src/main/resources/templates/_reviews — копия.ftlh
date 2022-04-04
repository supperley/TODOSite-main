<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1>Список задач</h1><hr>
    <div class="row">
        <aside class="col-3">
            <form method="get" action="/">
                <div>
                    <label for="searchGroup" class="col-form-label">Приоритет</label>
                    <div class="">
                        <select id="searchGroup" class="form-select">
                            <option value="">Приоритет не выбран</option>
                            <option value="Высокий">Высокий</option>
                            <option value="Средний">Средний</option>
                            <option value="Низкий">Низкий</option>
                            <option value="Нет">Нет</option>
                        </select>
                    </div>
                </div>
                <div>
                    <label class="col-form-label" for="searchWord">Поиск среди задач</label>
                    <div class="">
                        <input class="form-control" type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if>
                               id="searchWord">
                    </div>
                </div>
                <div>
                    <button style="width: 100%" type="submit" class="btn btn-dark mt-3">Поиск</button>
                </div>
            </form>
        </aside>
        <div class="col-9" id="masonry" data-masonry='{"percentPosition": true }'>
            <div class="row">
            <#list reviews as review>
                <div class="col-sm-6 col-lg-4 mb-4">
                    <a href="/review/${review.id}" class="review-link">
                        <div class="card text-black bg-light my-9 review">
                            <#if review.previewImageId != -1>
                                <img src="/images/${review.previewImageId}"
                                     class="card-img-top">
                            </#if>
                            <div class="d-flex align-items-center">
                                <div class="rounded-0 ms-2" style="min-width: 25px; text-align: center">
                                    <input class="form-check-input" type="checkbox" value="">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${review.title}</h5>
                                    <h6 class="card-title">${review.group}</h6>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            <#else>
                <h1 style="text-align: center">Не найдено</h1>
            </#list>
            </div>
        </div>
    </div>
</@t.template>