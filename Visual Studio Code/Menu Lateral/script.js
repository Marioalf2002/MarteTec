$(".menu > ul > li").click(function (e){
    //Remove Active From Already Active
    $(this).siblings().removeClass("active");
    //Add Active To Clicked
    $(this).toggleClass("active");
    //If Has Sub Menu Open It
    $(this).find("ul").slideToggle();
    //Close Other Sub Menu If Anu Open
    $(this).siblings().find("ul").slideUp();
    //Remove Active Class Of Sub Menu Items
    $(this).siblings().find("ul").find("li").removeClass("active");
});


$(".menu-btn").click(function (){
    $(".sidebar").toggleClass("active");
    $(".menu-btn").toggleClass("active");
    $(".contenedor").toggleClass("active");
})