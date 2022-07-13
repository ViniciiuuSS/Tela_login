<!--#include file="includes/conexao.asp"-->
<!--#include file="includes/functions.asp"-->
<!--#include file="includes/md5.asp"-->
<%
    usuario = Cstr("" & Request.Form("usu_cadastro"))
    senha = Cstr("" & Request.Form("senha_date"))

    conn.execute("insert into usuarios (login, senha) values ('" & usuario & "', '" & senha & "')")
    destino = "index.asp?alt=2"
    Response.Redirect(destino)

conn.Close
Set conn = Nothing

%>