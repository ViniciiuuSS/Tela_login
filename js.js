function tela_cadastro() {  
    $(".form_login_tag").css({
        'display' : 'none'
    })
    $(".form_cadastro_tag").css({
        'display' : 'block'
    })
}

function tela_login() {  
    $(".form_cadastro_tag").css({
        'display' : 'none'
    })
    $(".form_login_tag").css({
        'display' : 'block'
    })
}