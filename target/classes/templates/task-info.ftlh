<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <#if images?has_content>
            <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <#if images?size gt 1>
                    <div class="carousel-indicators">
                        <#list images as image>
                            <button class="${(image?counter == 1)?then('active', '')}" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${(image?counter == 1)?then(0, (image?counter - 1))}" aria-current="true" aria-label="Slide"></button>
                        </#list>
                    </div>
                </#if>
                <div class="carousel-inner">
                    <#list images as image>
                        <div class="carousel-item <#if image.previewImage>active</#if>">
                            <img src="/images/${image.id}" class="d-block w-100" alt="...">
                        </div>
                    </#list>
                </div>
                <#if images?size gt 1>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </#if>
            </div>
        </#if>

        <h6 class="border-bottom pb-2 mb-0">${task.title}</h6>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-tags bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"/>
                <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"/>
            </svg>

            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">Tags</strong>
                ${task.tag}
            </p>
        </div>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-exclamation-octagon bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path d="M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353L4.54.146zM5.1 1 1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1H5.1z"/>
                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
            </svg>

            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">Priority</strong>
                <#switch task.priority>
                    <#case 3>
                        High
                        <#break>
                    <#case 2>
                        Medium
                        <#break>
                    <#case 1>
                        Low
                        <#break>
                    <#default>
                        None
                </#switch>
            </p>
        </div>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-justify-left bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
            </svg>
            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">Description</strong>
                ${task.description}
            </p>
        </div>
        <div class="d-flex justify-content-between align-items-center">
            <small class="d-block">
                <a href="/">Go back</a>
            </small>
            <div class="d-flex">
                <form action="/task/edit/${task.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-primary m-3">
                        Редактировать
                    </button>
                </form>
                <form action="/task/delete/${task.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-danger m-3">
                        Удалить
                    </button>
                </form>
            </div>
        </div>
    </div>
</@t.template>