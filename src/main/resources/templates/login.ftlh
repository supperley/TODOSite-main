<#import "blocks/template.ftlh" as t>
<@t.template user>
    <main class="text-center form-signin p-3 p-lg-5 rounded-3 border shadow-lg">
        <form action="/login" method="post">
            <img class="mb-4" src="../static/images/logo.svg" alt="" width="72" height="57">
            <h2 class="mb-4 fw-normal">Вход</h2>

            <div class="form-floating mb-3">
                <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" required id="email" name="username" placeholder="name@example.com">
                <label for="email">Электронная почта</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" required id="password" name="password" placeholder="Password">
                <label for="password">Пароль</label>
            </div>

            <button class="w-100 btn btn-lg btn-primary mb-5" type="submit">Войти</button>
            <h5>Нет аккаунта? <a href="/registration">Регистрация</a></h5>
            <p class="mt-5 mb-3 text-muted">© 2022</p>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
    </main>
</@t.template>