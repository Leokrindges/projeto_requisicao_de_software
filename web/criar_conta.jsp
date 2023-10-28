<%-- 
    Document   : criar_conta
    Created on : 21 de out. de 2023, 09:31:57
    Author     : Usuario
--%>

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

    <body>
        <form id="create-form" class="form-criar_conta" action="login.jsp">
            <h1>Criar Conta</h1>
            <div>
                <div class="mb-3">
                    <label for="criar-email" class="form-label">Novo E-mail</label>
                    <input type="email" class="form-control" id="criar-email"
                           aria-describedby="emailHelp" required="true">
                    <div id="emailHelp" class="form-text">Utilize seu e-mail para criar a conta.</div>
                </div>
                <div class="mb-3">
                    <label for="criar-senha" class="form-label">Nova Senha</label>
                    <input type="password" class="form-control" id="criar-senha" required="true">
                    <div id="emailHelp" class="form-text">Utilize uma senha e anote para
                        não esquecer.</div>
                </div>
                <div class="mb-3">
                    <select class="form-select" aria-label="Default select example" id="tipo_usuario" required="true" name="tipo_usuario"  >
                        <option value="">Selecione o tipo de Usuário</option>
                        <option value="1">Administrador</option>
                        <option value="2">Usuário</option>
                    </select>
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-secondary button-cancelar" >Cancelar</button>
                <button type="submit" class="btn btn-primary">Criar conta</button>
            </div>
        </form>
    </body>
</html>
