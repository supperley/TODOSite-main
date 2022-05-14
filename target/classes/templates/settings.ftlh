<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <div class="text-center">
            <h1>Настройки</h1>
            <hr>
        </div>
        <div class="d-flex pt-3 pb-3 border-bottom">
            <p class="mb-0 lh-sm">
                <label class="form-label mb-0" for="name">
                    <strong class="d-block">Сменить имя пользователя</strong>
                </label>
            </p>
            <input type="text" required class="form-control"
                   id="userName" name="name" value="${user.name}">
        </div>
        <div class="d-flex pt-3 pb-3 border-bottom">
            <p class="mb-0 lh-sm">
                <label class="form-label mb-0" for="phone">
                    <strong class="d-block">Сменить номер телефона</strong>
                </label>
            </p>
            <input type="text" required class="form-control"
                   id="phone" name="phone" value="${user.phoneNumber}">
        </div>
        <div class="d-flex pt-3 pb-3 border-bottom">
            <p class="mb-0 lh-sm">
                <label class="form-label mb-0" for="email">
                    <strong class="d-block">Сменить e-mail</strong>
                </label>
            </p>
            <input type="text" required class="form-control"
                   id="email" name="email" value="${user.email}">
        </div>
        <div class="d-flex pt-3 pb-3 border-bottom">
            <p class="mb-0 lh-sm">
                <label class="form-label mb-0" for="avatar">
                    <strong class="d-block">Сменить аватар</strong>
                </label>
            </p>
            <input class="form-control mb-2" type="file" name="avatar" id="avatar">
        </div>
        <span style="float: right">
        <a href="?theme=light">Light</a>
        |
        <a href="?theme=dark">Dark</a>
    </span>
    </div>
</@t.template>