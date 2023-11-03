
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">    </head>

    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        li {
            display: inline;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">        

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="cadastro.jsp">Cadastrar Projetos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="editar.jsp">Listagem de Projetos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="consulta.jsp">Consultar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="criar_conta.jsp">Nova Conta</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listarUsuario.jsp">Listar Usuários</a>
                    </li>
                </ul>
                <form class="d-flex" role="search" action="acao?a=logout" method="post">                       
                    <button type="submit" class="btn button-logaut">Sair</button>
                </form>
            </div>
        </div>
    </nav>
</body>
</html>
