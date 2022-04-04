<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Авторизация</h1>
    <hr>
    <div class="d-flex justify-content-around align-items-center">
        <div class="col-md-8 col-lg-6 col-xl-4">
            <form action="/login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Электронная почта</label>
                    <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
                    <div id="email" class="invalid-feedback">
                        Неверная электронная почта
                    </div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Пароль</label>
                    <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
                    <div id="password" class="invalid-feedback">
                        Неверный пароль
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" style="width: 100%" class="btn btn-dark">Войти</button>
            </form>
        </div>
        <h4>Нет аккаунта? <a href="/registration">Зарегистрируйся!</a></h4>
    </div>
    <hr>
</@t.template>