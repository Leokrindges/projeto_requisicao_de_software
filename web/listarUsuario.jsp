<%-- 
    Document   : editarUsuarios
    Created on : 3 de nov. de 2023, 16:07:04
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
        <title>Listagem dos Usuários</title>
        <link rel="stylesheet" href="estilo.css">
        <style>
            h1{
                color: #4c79d3;
            }
        </style>
    </head>


    <%@include file="menu.jsp" %>

    <body>
        <h1>Listagem dos usuários</h1>
        <div class="container">

            <%            ArrayList<Usuario> user = new UsuarioDAO().consultar();
            %>

            <table class="table">
                <th>Código</th>
                <th>E-mail usuário</th>
                <th>senha</th>
                <th>Tipo de usuário</th>
                <th>Editar</th>
                <th>Excluir</th>
                    <%
                        for (int i = 0; i < user.size(); i++) {
                    %>
                <tr>
                    <td><%= user.get(i).getId()%></td>
                    <td><%= user.get(i).getUsuario()%></td>
                    <td><%= user.get(i).getSenha()%></td>
                    <td><%= user.get(i).getTipoUsuario()%></td>

                    <td><a href="acao?a=editarUsuario&id=<%= user.get(i).getId()%>" class="btn btn-success">Editar</a></td>
                    <td><a href="acao?a=excluirUsuario&id=<%= user.get(i).getId()%>" class="btn btn-danger">Excluir</a></td>
                </tr>
                <%
                    }
                %>

            </table>
            <%-- Exibe a mensagem na página --%>
            <% String mensagemExcluirSucesso = (String) request.getAttribute("mensagemExcluirSucesso"); %>
            <% if (mensagemExcluirSucesso != null) { %>
            <div class="mensagem" style="color: blue;
                 font-size: 18px;
                 margin-top: 10px;">
                <%= mensagemExcluirSucesso %>
            </div>
            <% } %>
            <%-- Exibe a mensagem na página --%>
            <% String mensagemExcluirErro = (String) request.getAttribute("mensagemExcluirErro"); %>
            <% if (mensagemExcluirErro != null) { %>
            <div class="mensagem" style="color: red;
                 font-size: 18px;
                 margin-top: 10px;">
                <%= mensagemExcluirErro %>
            </div>
            <% } %>
        </div>

    </body>
</html>