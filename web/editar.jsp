
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProjetoDAO"%>
<%@page import="entidade.Projeto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link rel="stylesheet" href="estilo.css">
        <style>
            h1{
                color: #4c79d3;
            }
        </style>
    </head>


    <%@include file="menu.jsp" %>

    <body>
        <h1>Listagem dos projetos</h1>
        <div class="container">
            <%            ArrayList<Projeto> projeto = new ProjetoDAO().consultar();
            %>

            <table class="table">
                <th>Código</th>
                <th>Nome do Projeto</th>
                <th>Prioridade</th>
                <th>Complexidade</th>
                <th>Descrição Requisito</th>
                <th>Versão</th>
                <th>Editar</th>
                <th>Excluir</th>


                <%
                for (int i = 0; i < projeto.size(); i++) {
                %>
                <tr>
                    <td><%= projeto.get(i).getCodigo()%></td>
                    <td><%= projeto.get(i).getNomeProjeto()%></td>
                    <td><%= projeto.get(i).getDescricaoRequisito()%></td>
                    <td><%= projeto.get(i).getPrioridade()%></td>
                    <td><%= projeto.get(i).getComplexidade()%></td>
                    <td><%= projeto.get(i).getVersao()%></td>


                    <td><a href="acao?a=editarProjeto&id=<%= projeto.get(i).getCodigo()%>" class="btn btn-success">Editar</a></td>
                    <td><a href="acao?a=excluirProjeto&id=<%= projeto.get(i).getCodigo()%>" class="btn btn-danger">Excluir</a></td>

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
