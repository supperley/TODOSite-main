console.log("test");

const checkbox = document.querySelector('.form-check-input');
const text = document.querySelector('.form-check-label');

// возвращает куки с указанным name,
// или undefined, если ничего не найдено
function getCookie(name) {
    let matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

if (getCookie('theme') === 'dark') {
    checkbox.checked = true;
    text.outerHTML = "Темная";
}

checkbox.addEventListener('change', function () {
    setTimeout(
        () => {
            if (this.checked) {
                location.href = "?theme=dark";
            } else {
                location.href = "?theme=light";
            }
        }
    )
})