<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <div class="text-center">
            <h1>Настройки</h1>
            <hr>
        </div>
        <div class="container">
            <div class="row pb-3 border-bottom">
                <p class="mb-0 lh-sm p-0 col-2 d-flex justify-content-center align-items-center">
                    <label class="form-label mb-0" for="name">
                        <strong class="d-block text-center">Сменить имя пользователя</strong>
                    </label>
                </p>
                <div class="col-10">
                    <input type="text" required class="form-control"
                           id="userName" name="name" value="${user.name}">
                </div>
            </div>
            <div class="row pt-3 pb-3 border-bottom">
                <p class="mb-0 lh-sm p-0 col-2  d-flex justify-content-center align-items-center">
                    <label class="form-label mb-0" for="phone">
                        <strong class="d-block text-center">Сменить номер телефона</strong>
                    </label>
                </p>
                <div class="col-10">
                    <input type="text" required class="form-control"
                           id="phone" name="phone" value="${user.phoneNumber}">
                </div>
            </div>
            <div class="row pt-3 pb-3 border-bottom">
                <p class="mb-0 lh-sm p-0 col-2 d-flex justify-content-center align-items-center">
                    <label class="form-label mb-0" for="email">
                        <strong class="d-block text-center">Сменить e-mail</strong>
                    </label>
                </p>
                <div class="col-10">
                    <input type="text" required class="form-control"
                           id="email" name="email" value="${user.email}">
                </div>
            </div>
            <div class="row pt-3 pb-3 border-bottom">
                <p class="mb-0 lh-sm p-0 col-2 d-flex justify-content-center align-items-center">
                    <label class="form-label mb-0" for="avatar">
                        <strong class="d-block text-center">Сменить аватар</strong>
                    </label>
                </p>
                <div class="col-10">
                    <input type="file" required class="form-control"
                           id="avatar" name="avatar" value="${user.email}">
                </div>
            </div>
            <div class="row pt-3 pb-3 border-bottom">
                <p class="mb-0 lh-sm p-0 col-2 d-flex justify-content-center align-items-center">
                    <label class="form-label mb-0" for="avatar">
                        <strong class="d-block text-center">Сменить тему</strong>
                    </label>
                </p>
                <div class="col-4">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                        <label class="form-check-label" for="flexSwitchCheckDefault">Светлая</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template>