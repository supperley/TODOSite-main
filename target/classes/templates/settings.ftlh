<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <div class="text-center">
            <h1>Настройки</h1>
            <hr>
        </div>
        <div class="container">
            <form action="/saveSettings" method="post" enctype="multipart/form-data">
                <div class="row pb-3 border-bottom">
                    <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
                        <label class="form-label mb-0" for="name">
                            <strong class="d-block text-center">Сменить имя пользователя</strong>
                        </label>
                    </p>
                    <div class="col-12 col-md-10">
                        <input type="text" required class="form-control"
                               id="name" name="name" value="${user.name}">
                    </div>
                </div>
                <div class="row pt-3 pb-3 border-bottom">
                    <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
                        <label class="form-label mb-0" for="phone">
                            <strong class="d-block text-center">Сменить номер телефона</strong>
                        </label>
                    </p>
                    <div class="col-12 col-md-10">
                        <input type="text" required class="form-control"
                               id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}">
                    </div>
                </div>
                <div class="row pt-3 pb-3 border-bottom">
                    <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
                        <label class="form-label mb-0" for="email">
                            <strong class="d-block text-center">Сменить e-mail</strong>
                        </label>
                    </p>
                    <div class="col-12 col-md-10">
                        <input type="text" required class="form-control"
                               id="email" name="email" value="${user.email}">
                    </div>
                </div>
                <div class="row py-3 border-bottom">
                    <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
                        <label class="form-label mb-0" for="file">
                            <strong class="d-block text-center">Сменить аватар</strong>
                        </label>
                    </p>
                    <div class="col-12 col-md-10">
                        <input type="file" class="form-control"
                               id="file" name="file">
                    </div>
                </div>
                <div class="row pt-3 pb-3 border-bottom">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" id="liveToastBtn" class="btn btn-dark col-12 col-md-2">Сохранить</button>
                </div>
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
            <div class="row pt-3 pb-3 border-bottom settings-switch">
                <p class="mb-3 mb-md-0 lh-sm p-0 col-12 col-md-2 d-flex justify-content-center align-items-center">
                    <label class="form-label mb-0" for="theme">
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
    <script src="/static/js/main.js"></script>
</@t.template>