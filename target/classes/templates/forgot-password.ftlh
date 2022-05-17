<#import "blocks/template.ftlh" as t>
<@t.template user>
    <main class="text-center form-signin mb-4 p-3 p-lg-5 rounded-3 border shadow-lg">
        <form action="/forgot_password" method="post">
            <img class="mb-4" src="../static/images/logo.svg" alt="" width="72" height="57">
            <h2 class="mb-4 fw-normal">Сбросить пароль</h2>

            <div class="form-floating mb-3">
                <input type="email" class="form-control" required id="email" name="email" placeholder="name@example.com">
                <label for="email">Электронная почта</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone">
                <label for="phoneNumber">Номер телефона</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                <label for="password">Новый пароль</label>
            </div>
            <button class="w-100 btn btn-lg btn-primary mb-5" type="submit">Восстановить</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="liveToast" class="toast align-items-center text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <#if errorMessage??>${errorMessage}</#if>
                        <#if okMessage??>${okMessage}</#if>
                    </div>
                    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <script>
            <#if errorMessage??>
            const toastLiveExample = document.getElementById('liveToast');
            toastLiveExample.classList.remove('text-bg-success');
            toastLiveExample.classList.add("text-bg-danger");
            const toast = new bootstrap.Toast(toastLiveExample);
            toast.show();
            </#if>
            <#if okMessage??>
            const toastLiveExample = document.getElementById('liveToast');
            toastLiveExample.classList.remove('text-bg-danger');
            toastLiveExample.classList.add("text-bg-success");
            const toast = new bootstrap.Toast(toastLiveExample);
            toast.show();
            </#if>
        </script>
        <h5><a href="/login">Вернуться ко входу</a></h5>
        <p class="mt-5 mb-3 text-muted">© 2022</p>
    </main>
</@t.template>