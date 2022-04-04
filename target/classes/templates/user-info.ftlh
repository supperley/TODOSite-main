<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
            <img src="/static/images/avatar.png"
                 style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Обзоры пользователя ${user.name}</h1>
    <br>
    <div class="card-columns">
                    <#list reviews as review>
                        <a href="/review/${review.id}" class="review-link">
                            <div class="card text-white bg-dark my-3 review">
                                <img src="/images/${review.previewImageId}"
                                     class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">${review.title}</h5>
                                </div>
                            </div>
                        </a>
                    </#list>
    </div>
</@t.template>

