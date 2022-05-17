<#import "blocks/template.ftlh" as t>
<@t.template user>
    <main class="text-center form-signin p-3 p-lg-5 rounded-3 border shadow-lg">
        <form action="/login" method="post">
            <img class="mb-4" src="../static/images/logo.svg" alt="" width="72" height="57">
            <h2 class="mb-4 fw-normal">Вход</h2>

            <div class="form-floating mb-3">
                <input type="email" class="form-control" required id="email" name="username" placeholder="name@example.com">
                <label for="email">Электронная почта</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" required id="password" name="password" placeholder="Password">
                <label for="password">Пароль</label>
            </div>

            <button class="w-100 btn btn-lg btn-primary mb-5" type="submit">Войти</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
        <h5>Нет аккаунта? <a href="/registration">Регистрация</a></h5>
        <h5><a href="/forgot_password">Забыли пароль</a>?</h5>
        <p class="mt-5 mb-3 text-muted">© 2022</p>
    </main>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast align-items-center text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    Неверный логин или пароль
                </div>
                <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <script>
        <#if RequestParameters.error??>
        const toastLiveExample = document.getElementById('liveToast');
        toastLiveExample.classList.remove('text-bg-success');
        toastLiveExample.classList.add("text-bg-danger");
        const toast = new bootstrap.Toast(toastLiveExample);
        toast.show();
        </#if>
    </script>
</@t.template>