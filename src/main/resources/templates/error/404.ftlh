<#--<html>-->
<#--<head>-->
<#--    <meta charset="utf-8">-->
<#--    <title>404 ftl page</title>-->
<#--</head>-->
<#--<body>-->
<#--<span>404 ftl page!</span>-->
<#--</body>-->
<#--</html>-->
<#import "../blocks/template.ftlh" as t>
<@t.template>
    <main class="container">
        <div class="bg-light p-5 rounded">
            <h1>Ошибка 404</h1>
            <p class="lead">Кажется что-то пошло не так! Страница, которую вы запрашиваете, не существует.
                Возможно она устарела, была удалена, или был введен неверный адрес в адресной строке.</p>
            <a class="btn btn-lg btn-primary" href="/" role="button">Вернуться на главную »</a>
        </div>
    </main>
</@t.template>