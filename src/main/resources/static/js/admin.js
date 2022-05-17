const table = document.querySelector('.table');

if (getCookie('theme') === 'dark') {
    table.classList.toggle('table-light');
    table.classList.toggle('table-dark');
}