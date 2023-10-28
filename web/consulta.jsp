<%-- 
    Document   : consulta
    Created on : 22 de out. de 2023, 09:11:54
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consular</title>
        <link rel="stylesheet" href="estilo.css"/>
    </head>

    <%@include file="menu.jsp" %>


    <body>
        <h1>Consulta</h1>

        <div class="container">
            <form method="post" action="acao?a=consulta">
                <div class="mb-3">
                    <select class="form-select" aria-label="Default select example" id="id_prioridade" required="true" name="id_prioridade"  >
                        <option value="">Selecione pelo que deseja consultar</option>
                        <option value="1">Por prioridade</option>
                        <option value="2">Por complexidade</option>
                    </select>
                </div>
                <div class="mb-3">
                    <select class="form-select" aria-label="Default select example" id="id_prioridade" required="true" name="id_prioridade"  >
                        <option value="">Selecione o nivel</option>
                        <option value="1">Baixa</option>
                        <option value="2">Média</option>    
                        <option value="2">Alta</option>
                    </select>
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Consultar</button>
                </div>
            </form>
        </div>

        <div class="container">

            <div class="mt-3">
                <table class="table">
                    <th>ID requisito</th>
                    <th>Descrição requisito</th>
                    <th>ID projeto</th>
                    <th>prioridade</th>
                    <th>complexidade</th>
                    <th>Versão</th>

                    <th>Gerar Relatório PDF</th>

                </table>
            </div>
        </div>
    </body>
</html>
