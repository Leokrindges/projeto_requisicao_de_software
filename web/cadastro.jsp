
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProjetoDAO"%>
<%@page import="entidade.Projeto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar</title>
        <link rel="stylesheet" href="./estilo.css">
    </head>

    <%@include file="menu.jsp" %>

    <%
       Projeto p = (Projeto) request.getAttribute("projeto_cadastro");

       if (p == null) {
           p = new Projeto();
       }      

    %>    

    <body>
        <h1>Cadastro de Projetos</h1>

        <div class="container">
            <form method="post" action="acao?a=salvarProjeto">
                <div class="mb-3">
                    <label for="nomeprojeto" class="form-label">Nome do Projeto</label>
                    <input type="text" class="form-control" id="nomeprojeto"  name="nomeprojeto" required="true" value="<%= p.getNomeProjeto() %>">
                </div>
                <div class="mb-3">
                    <label for="descrequisito" class="form-label">Descrição Requisito</label>
                    <input type="text" class="form-control" id="descrequisito"  name="descrequisito" required="true" value="<%= p.getDescricaoRequisito() %>" >
                </div>
                <div class="mb-3">
                    <label for="prioridade" class="form-label">Prioridade</label>
                    <select class="form-select" aria-label="Default select example" id="prioridade" required="true" name="prioridade" value="<%= p.getPrioridade() %>">
                        <option value="">Selecione a prioridade</option>
                        <option value="Baixa">Baixa</option>
                        <option value="Media">Media</option>
                        <option value="Alta">Alta</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="complexidade" class="form-label">Complexidade</label>
                    <select class="form-select" aria-label="Default select example" id="complexidade" required="true" name="complexidade" value="<%= p.getComplexidade() %>">
                        <option value="">Selecione a complexidade</option>
                        <option value="Baixa">Baixa</option>
                        <option value="Media">Media</option>
                        <option value="Alta">Alta</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="versao" class="form-label">Versão</label>
                    <input type="number" class="form-control" id="versao"  name="versao" required="true" value="<%= p.getVersao() %>">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Cadastrar</button>               
                </div>

                <%-- Exibe a mensagem na página --%>
                <% String mensagemErro = (String) request.getAttribute("mensagemErroCadastro"); %>
                <% if (mensagemErro != null) { %>
                <div class="mensagem" style="color: red;
                     font-size: 18px;
                     margin-top: 10px;">
                    <%= mensagemErro %>
                </div>
                <% } %>
                <%-- Exibe a mensagem na página --%>
                <% String mensagemSucesso = (String) request.getAttribute("mensagemSucessoCadastro"); %>
                <% if (mensagemSucesso != null) { %>
                <div class="mensagem" style="color: blue;
                     font-size: 18px;
                     margin-top: 10px;">
                    <%= mensagemSucesso %>
                </div>
                <% } %>

            </form>
        </div>    
    </body>
</html>
