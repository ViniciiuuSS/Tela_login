<!--#include file="includes/conexao.asp"-->
<!--#include file="includes/functions.asp"-->
<%
Set RsS = Server.CreateObject("ADODB.RecordSet")
sSQL = "select login, senha from usuarios where login is not null"


RsS.Open sSQL, Conn, 0, 1
'response.write(sSQL)

   
vArray = "" 
vArray_senha = "" 

While Not RsS.EOF
    login = CStr("" & RsS(0))
    senha = CStr("" & RsS(1))

    if login <> "" and senha <> "" then
        vArray = vArray & "'" & login & "'" & ","
        vArray_senha = vArray_senha & "'" & senha & "'" & ","
    end if

    RsS.MoveNext
    'response.Write(vArray) & "<br />"
Wend
   
RsS.Close
Set RsS = Nothing
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Portifolio Vinicius</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <link rel="stylesheet" type="text/css" href="js/MYRIADPROREGULAR/font.css" />
    <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
    <script type="text/javascript"  src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="@sweetalert2/themes/dark/dark.css">
    <script type="text/javascript"  src="sweetalert2/dist/sweetalert2.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script type="text/javascript"  nomodule="" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/sweetalert-master/sweetalert-master/dist/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="js/sweetalert-master/sweetalert-master/dist/sweetalert.css">
    <script type="text/javascript" src="js.js"></script>
    <style type="text/css">
        body{
            display:flex;
            justify-content: space-around;
            background-color: #00000c;
            margin:0;
            padding:0;
            font-family: 'MYRIADPROREGULAR'
        }
         *::selection {
            background: white;
            color: black;
        }
        #form_login
        {   
            position: relative;
            height: 600px;
            width: 800px;
            text-align: left;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10%;
            background-color:rgb(32, 28, 28);
            border-radius: 10px;
            box-shadow: 0 0 10px white;
        }
        .icon_git{
            font-size: 40px;
        }
        .icon_git:hover{
           transform: scale(1.1);
        }
        .header_form{
            width: 100%;
            display: flex;
            justify-content: flex-end
        }
        a {
            color:white;
            text-decoration: none;
            display: flex;
            align-items: center;
            margin: 10px;
        }
        .main_form{
            display: flex;
            width: 100%;
            justify-content: space-around;
            margin-top: 15%;
        }
        label{
            display: block;
            padding: 10px;
        }
        input{
            outline: none;
            border: none;
            background: #e5edff;
            height: 30px;
            color: black;
            padding: 10px 10px;
            font-size: 20px;
            width: 95%;
            border-radius: 5px;
            box-shadow: 0 0 5px white;
        }
        input:focus{
            background-color: #2b3549;
            transform: scale(1.03);
            color: white;
        }
        input::before{
            color: black;
        }
        input::placeholder{
            color: black;
        }
        input:focus::placeholder{
            color: white;
        }
        .container-imagem {
            position: relative;
            height: 100%;
            width: 100%;
            /* adicionando imagem de fundo */
            background: url('img/fundo.png');
            background-size: cover;
            border: 1px solid black;
            border-radius: 12px;
        }
        .container-imagem:hover {
            transform: scale(1.1);
            box-shadow: 0 0 10px white;
        }
        .box_submit{
            display: block;
            padding: 10px;
            text-align:center;
        }
        .wrapper{
            display: flex;
            justify-content: center;
        }
        .Hover_Me{
            display: block;
            width: 200px;
            height: 40px;
            text-decoration: none;
            color: rgb(255, 255, 255);
            text-align: center;
            position: relative;
            transition: all .35s;
            background: none;
        }
        .Hover_Me:after{
            position: absolute;
            content: "";
            height: 100%;
            background: #ff003b;
            transition: all .35s;
            cursor: pointer;
        }

        .Hover_Me:hover{
            color: #fff;
            background: #880e38;
            box-shadow: 0 0 15px #880e38;
            cursor: pointer;
        }
        .Hover_Me:hover:after{
            width: 100%;
            cursor: pointer;
        }

        .criar_cadastro{
            display: block;
            width: 200px;
            height: 40px;
            text-decoration: none;
            color: rgb(255, 255, 255);
            text-align: center;
            position: relative;
            transition: all .35s;
            background: none;
        }
        .criar_cadastro:after{
            position: absolute;
            content: "";
            height: 100%;
            background: #ff003b;
            transition: all .35s;
            cursor: pointer;
        }

        .criar_cadastro:hover{
            color: #fff;
            background: #880e38;
            box-shadow: 0 0 15px #880e38;
            cursor: pointer;
        }
        .criar_cadastro:hover:after{
            width: 100%;
            cursor: pointer;
        }
        #form_cadastro
        {   
            height: 600px;
            width: 800px;
            text-align: left;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10%;
            background-color:rgb(32, 28, 28);
            border-radius: 10px;
            box-shadow: 0 0 10px white;
        }
        .form_cadastro_tag{
            display: block;
        }
        .form_cadastro_tag{
            display: none;
        }
    </style>
</head>
<body>
    <% If Request("alt") = "2" Then %>
        <script type="text/javascript">
            Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Login cadastrado!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#usuario_cadastro").css({
                        'background' : 'red'
                })
        </script>
    <% End If %>
    <form name="frm" action="" method="post" target="_parent" class="form_login_tag">
        <input type="hidden" name="usu" id="usu">
        <div id="form_login">
            <div id="container-imagem_login" class="container-imagem">
                <div class="header_form">
                    <a href="https://github.com/ViniciiuuSS"><ion-icon name="logo-github" class="icon_git"></ion-icon>@ViniciiuuSS</a>
                </div>
                <div class="main_form">
                    <div class="login_main">
                        <label><p style="color: white;">LOGIN</p><input type="text" id="usuario_login" class="usuario_login" placeholder="Login..." required></label>
                        <label><p style="color: white;">SENHA</p><input type="password" id="senha_login" class="usuario_login" placeholder="Senha..." required></label>
                        <div style="display: flex;">
                            <label class="wrapper">
                                <input type="button" id="entrar_submit_login" class="Hover_Me" value="Entrar" onclick="submitForm_login(this)" >
                            </label>
                            <label class="wrapper">
                                <input type="button" id="criar_cadastro_login" class="criar_cadastro" value="Criar Cadastro" onclick="tela_cadastro()">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <form name="frm_castro" action="" method="post" target="_parent" class="form_cadastro_tag">
        <input type="hidden" name="usu_cadastro" id="usu_cadastro">
        <input type="hidden" name="senha_date" id="senha_date">
        <input type="hidden" name="confirm_senha_date" id="confirm_senha_date">
        <div id="form_cadastro">
            <div id="container-imagem" class="container-imagem">
                <div class="header_form">
                    <a href="https://github.com/ViniciiuuSS"><ion-icon name="logo-github" class="icon_git"></ion-icon>@ViniciiuuSS</a>
                </div>
                <div class="main_form" style="margin-top: 10%;">
                    <div class="login_main">
                        <label><p style="color: white;">CRIAR LOGIN:</p><input type="text" id="usuario_cadastro" class="usuario_login" placeholder="Login..." required></label>
                        <label><p style="color: white;">CRIAR SENHA</p><input type="password" id="senha_cadastro" class="usuario_login" placeholder="Senha..." onkeyup="userEvent_cadastro(event);" required></label>
                        <label><p style="color: white;">CONFIRMAR SENHA</p><input type="password" id="confirmar_senha_cadastro" class="usuario_login" placeholder="Confirmar Senha..." onkeyup="userEvent_cadastro(event);" required></label>
                        <div style="display: flex;">
                            <label class="wrapper">
                                <input type="button" id="criar_cadastro" class="criar_cadastro" value="Criar Cadastro" onclick="submitForm_cadastro(this)">
                            </label>
                            <label class="wrapper">
                                <input type="button" id="entrar_submit" class="Hover_Me" value="Entrar" onclick="tela_login()">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function submitForm_cadastro(button) {
            document.getElementById("usu_cadastro").value = document.getElementById("usuario_cadastro").value
            document.getElementById("senha_date").value = document.getElementById("senha_cadastro").value
            var controle_swal = 0;
            var array_login = [<%=vArray %>];
            array_login.forEach(separa_array)
            function separa_array(item) {
                var usu_cadastro = usuario_cadastro.value
                if (usu_cadastro == item) {
                    controle_swal = 1;
                }
            }
            var senha = [senha_cadastro.value]
            if (senha[0].length != 0) {
                if (senha[0].length < 9) {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'error',
                        title: 'Senha menor do que o permitido!',
                        showConfirmButton: false,
                        timer: 1500
                    })
                    $("#confirmar_senha_cadastro").css({
                        'box-shadow': '0 0 15px red'
                    })
                    $("#senha_cadastro").css({
                        'box-shadow': '0 0 15px red'
                    })
                    return;
                }
            }
            if (controle_swal == 1) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Login já cadastrado!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#usuario_cadastro").css({
                    'box-shadow': '0 0 15px red'
                })
                usuario_cadastro.value = ""
                return;
            }
            if (usuario_cadastro.value == "") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Campo login vazio!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#usuario_cadastro").css({
                    'box-shadow': '0 0 15px red'
                })
                usuario_cadastro.value = ""
                return;
            }

            
            if (confirmar_senha_cadastro.value != senha_cadastro.value) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Senhas diferentes!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#confirmar_senha_cadastro").css({
                    'box-shadow': '0 0 15px red'
                })
                $("#senha_cadastro").css({
                    'box-shadow': '0 0 15px red'
                })
                $("#usuario_cadastro").css({
                    'background': 'white',
                    'color': 'black'

                })
                confirmar_senha_cadastro.value = ""
                return;
            }
            if (confirmar_senha_cadastro.value == "" && senha_cadastro.value == "") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Campos senha vazias!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#confirmar_senha_cadastro").css({
                    'box-shadow': '0 0 15px red'
                })
                $("#senha_cadastro").css({
                    'box-shadow': '0 0 15px red'
                })
                return;
            }
            if (controle_swal != 1 && confirmar_senha_cadastro.value != "" && senha_cadastro.value != "") {
                with (frm_castro) {


                    button.disabled = "disabled";
                    action = "login_grava.asp";
                    submit();
                }
            }

        }
        function userEvent_cadastro(evt) {
            if (evt.keyCode == 13) {

                submitForm_cadastro(frm_castro.criar_cadastro);
            }
        }

        function submitForm_login(button) {
            var controle_swal = 0;
            var array_login = [<%=vArray %>];
            array_login.forEach(separa_array)
            function separa_array(item) {
                var usu_cadastro = usuario_login.value
                if (usu_cadastro == item) {
                    controle_swal = 1;
                }
            }
            var controle_swal_senha = 0;
            var array_senha = [<%=vArray_senha %>];
            array_senha.forEach(separa_array_senha)
            function separa_array_senha(item) {
                var senha_login_main = senha_login.value
                if (senha_login_main == item) {
                    controle_swal_senha = 1;
                }
            }
            if (controle_swal == 1 && controle_swal_senha == 0) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Senha errada!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#senha_login").css({
                    'box-shadow': '0 0 15px red'
                })
                return;

            }
            if (controle_swal == 0 && controle_swal_senha == 1) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Login errado!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#usuario_login").css({
                    'box-shadow': '0 0 15px red'
                })
                return;

            }
            if (usuario_login.value == "" && senha_login.value == "") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Campos vazios [Senha e Login]!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#usuario_login").css({
                    'box-shadow': '0 0 15px red'
                })
                $("#senha_login").css({
                    'box-shadow': '0 0 15px red'
                })
                return;
            }
            if (controle_swal != 1 && controle_swal_senha != 1) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Cadastro não existe [Senha e Login errados]!',
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#usuario_login").css({
                    'box-shadow': '0 0 15px red'
                })
                $("#senha_login").css({
                    'box-shadow': '0 0 15px red'
                })
                return;

            }
            if (controle_swal == 1 && controle_swal_senha == 1 && usuario_login.value != "" && senha_login.value != "") {
                with (frm) {
                    button.disabled = "disabled";
                    action = "https://www.google.com.br/";
                    submit();
                }
            }
        }
        function userEvent_cadastro(evt) {
            if (evt.keyCode == 13) {
                submitForm_login(frm.criar_cadastro_login);
            }
        }
    </script>
</body>
</html>
