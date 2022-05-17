const checkbox = document.querySelector('.form-check-input');
const text = document.querySelector('.form-check-label');

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