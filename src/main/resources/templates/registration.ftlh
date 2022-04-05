<#import "blocks/template.ftlh" as t>
<@t.template user>
    <main class="text-center form-signin mb-4 p-3 p-lg-5 rounded-3 border shadow-lg">
        <form action="/registration" method="post">
            <img class="mb-4" src="../static/images/logo.svg" alt="" width="72" height="57">
            <h2 class="mb-4 fw-normal">Регистрация</h2>

            <div class="form-floating mb-3">
                <input type="text" class="form-control <#if RequestParameters.error??>is-invalid</#if>" required id="name" name="name" placeholder="Username">
                <label for="name">Имя пользователя</label>
            </div>

            <div class="form-floating mb-3">
                <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" required name="email" placeholder="name@example.com">
                <label for="email">Электронная почта</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone">
                <label for="phoneNumber">Номер телефона</label>
            </div>

            <div class="form-floating mb-3">
                <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" required name="password" placeholder="Password">
                <label for="password">Пароль</label>
            </div>

            <button class="w-100 btn btn-lg btn-primary mb-5" type="submit">Зарегистрироваться</button>
            <h5>Есть аккаунт? <a href="/login">Войти</a></h5>
            <p class="mt-5 mb-3 text-muted">© 2022</p>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
        <#if errorMessage??>
            <h2 style="color: red">${errorMessage}</h2>
        </#if>
    </main>
</@t.template>