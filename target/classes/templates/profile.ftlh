<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <div class="text-center">
        <h1>Личный кабинет</h1>
            <hr>
            <img src="/static/images/avatar.png" style="border:2px solid black; border-radius: 20px" height="120">
        </div>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-tags bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"/>
                <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"/>
            </svg>

            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">Имя пользователя</strong>
                ${user.name}
            </p>
        </div>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-tags bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"/>
                <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"/>
            </svg>

            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">ID пользователя</strong>
                ${user.id}
            </p>
        </div>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-tags bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"/>
                <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"/>
            </svg>

            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">E-mail</strong>
                ${user.email}
            </p>
        </div>
        <div class="d-flex text-muted pt-3 border-bottom">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-tags bd-placeholder-img flex-shrink-0 ms-1 me-2 rounded" viewBox="0 0 16 16">
                <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"/>
                <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"/>
            </svg>

            <p class="pb-3 mb-0 small lh-sm">
                <strong class="d-block text-gray-dark">Номер телефона</strong>
                ${user.phoneNumber}
            </p>
        </div>
        <div class="d-flex flex-wrap justify-content-between align-items-center profile-nav">
            <div class="d-flex flex-wrap">
                <div class="px-2">
                    <a class="btn btn-outline-primary" href="/my/reviews">Мои задачи</a>
                </div>
                <div class="px-2">
                    <a class="btn btn-outline-primary" href="/settings">Настройки</a>
                </div>
            </div>
            <div class="d-block m-3">
                <#if user.isAdmin()>
                    <div class="d-block m-3">
                        <a class="btn btn-dark w-100 col-3" href="/admin">Панель администратора</a>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</@t.template>