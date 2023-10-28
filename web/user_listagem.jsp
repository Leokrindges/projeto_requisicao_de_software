<%-- 
    Document   : user_listagem
    Created on : 22 de out. de 2023, 10:06:29
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilo.css"/>
    </head>

    <%@include file="menu_user.jsp" %>


    <body>
        <h1>Lista de Cadastros</h1>
        <div class="container">


            <table class="table">
                <th>ID Projeto</th>
                <th>Nome do Projeto</th>
                <th>Prioridade</th>
                <th>Complexidade</th>
                <th>Descrição Requisito</th>
                <th>Versão</th>

                <th>Gerar relatório PDF</th>


            </table>
        </div>
    </body>
</html>
