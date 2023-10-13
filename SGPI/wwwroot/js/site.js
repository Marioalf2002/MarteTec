// MENU LATERAL
$(".menu > ul > li").click(function (e) {
    //Remove activar From Already activar
    $(this).siblings().removeClass("activar");
    //Add activar To Clicked
    $(this).toggleClass("activar");
    //If Has Sub Menu Open It
    $(this).find("ul").slideToggle();
    //Close Other Sub Menu If Anu Open
    $(this).siblings().find("ul").slideUp();
    //Remove activar Class Of Sub Menu Items
    $(this).siblings().find("ul").find("li").removeClass("activar");
});


$(".menu-boton").click(function () {
    $(".menu_lateral").toggleClass("activar");
    $(".menu-boton").toggleClass("activar");
})

//INICIO DE SESION
const logregBox = document.querySelector('.login-box');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');

registerLink.addEventListener('click', () => {
    logregBox.classList.add('activar');
});

loginLink.addEventListener('click', () => {
    logregBox.classList.remove('activar');
});