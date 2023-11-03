<%-- 
    Document   : editarUsuarios
    Created on : 3 de nov. de 2023, 16:33:07
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
        <title>Editar usuário</title>
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
        <form id="create-form" class="form-criar_conta" method="post" action="acao?a=edicaoUsuario">
            <h1>Editar Conta</h1>
            <div>
                <div class="mb-3">
                    <label for="idUsuario" class="form-label">ID Usuário</label>
                    <input type="text" class="form-control" id="idUsuario" name="idUsuario" required="true" aria-describedby="emailHelp" value="<%= u.getId() %>">
                </div>
                <div class="mb-3">
                    <label for="criarEmail" class="form-label">Novo E-mail</label>
                    <input type="email" class="form-control" id="criarEmail" name="criarEmail" aria-describedby="emailHelp" required="true" value="<%= u.getUsuario() %>">
                </div>
                <div class="mb-3">
                    <label for="criarSenha" class="form-label">Nova Senha</label>
                    <input type="password" class="form-control" id="criarSenha" name="criarSenha" required="true" value="<%= u.getSenha() %>">
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
                <button type="submit" class="btn btn-primary">Atualizar</button>
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