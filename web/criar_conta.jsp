<%-- 
    Document   : criar_conta
    Created on : 21 de out. de 2023, 09:31:57
    Author     : Usuario
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar Conta</title>
        <link rel="stylesheet" href="estilo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>

    <%@include file="menu.jsp" %>

    <%
       Usuario u = (Usuario) request.getAttribute("usuario_cadastro");

       if (u == null) {
           u = new Usuario();
       }      

    %>

    <body>
        <form id="create-form" class="form-criar_conta" method="post" action="acao?a=criarConta">
            <h1>Criar Conta</h1>
            <div>
                <div class="mb-3">
                    <label for="criarEmail" class="form-label">Novo E-mail</label>
                    <input type="email" class="form-control" id="criarEmail" name="criarEmail" aria-describedby="emailHelp" required="true" value="<%= u.getUsuario() %>">
                    <div id="emailHelp" class="form-text">Utilize seu e-mail para criar a conta.</div>
                </div>
                <div class="mb-3">
                    <label for="criarSenha" class="form-label">Nova Senha</label>
                    <input type="password" class="form-control" id="criarSenha" name="criarSenha" required="true" value="<%= u.getSenha() %>">
                    <div id="emailHelp" class="form-text">Utilize uma senha e anote para
                        não esquecer.</div>
                </div>
                <div class="mb-3">
                    <label for="tipoUsuario" class="form-label">Tipo de Usuario</label>
                    <select class="form-select" aria-label="Default select example" id="tipoUsuario" required="true" name="tipoUsuario" value="<%= u.getTipoUsuario() %>">
                        <option value="">Selecione o tipo de Usuário</option>
                        <option value="Administrador">Administrador</option>
                        <option value="Usuario">Usuário</option>
                    </select>
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-primary">Criar conta</button>
            </div>
            <%-- Exibe a mensagem na página --%>
            <% String mensagemErroCadastro = (String) request.getAttribute("mensagemErroCadastro"); %>
            <% if (mensagemErroCadastro != null) { %>
            <div class="mensagem" style="color: red;
                 font-size: 18px;
                 margin-top: 10px;">
                <%= mensagemErroCadastro %>
            </div>
            <% } %>
            <%-- Exibe a mensagem na página --%>
            <% String mensagemSucessoCadastro = (String) request.getAttribute("mensagemSucessoCadastro"); %>
            <% if (mensagemSucessoCadastro != null) { %>
            <div class="mensagem" style="color: blue;
                 font-size: 18px;
                 margin-top: 10px;">
                <%= mensagemSucessoCadastro %>
            </div>
            <% } %>
        </form>
    </body>
</html>
