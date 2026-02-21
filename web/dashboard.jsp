<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>

<%
    if(session.getAttribute("usuario") == null){
        response.sendRedirect("index.jsp");
        return;
    }

    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestión Pro - Dashboard</title>
    <style>
        body{
            margin:0;
            font-family: Arial;
            background:#f4f6f9;
        }

        header{
            background:#004aad;
            color:white;
            padding:15px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .container{
            display:flex;
        }

        .sidebar{
            width:220px;
            background:#083c76;
            height:100vh;
            padding:20px;
        }

        .sidebar a{
            display:block;
            color:white;
            text-decoration:none;
            padding:10px;
            margin:10px 0;
            border-radius:5px;
        }

        .sidebar a:hover{
            background:#0a68c2;
        }

        .content{
            padding:30px;
            flex:1;
        }

        .card{
            background:white;
            padding:20px;
            border-radius:10px;
            box-shadow:0 2px 5px rgba(0,0,0,0.1);
        }

        .logout{
            color:white;
            text-decoration:none;
        }
    </style>
</head>

<body>

<header>
    <h2>Gestión Pro</h2>
    <div>
        Bienvenido <%= usuario.getNombre() %> |
        <a class="logout" href="LogoutServlet">Cerrar sesión</a>
    </div>
</header>

<div class="container">

    <div class="sidebar">
        <h3>Menú</h3>
        <a href="UsuarioServlet?accion=listar">Gestionar Usuarios</a>
        <a href="#">Proyectos</a>
        <a href="#">Tareas</a>
    </div>

    <div class="content">
        <div class="card">
            <h2>Panel Principal</h2>
            <p>Bienvenido al sistema Gestión Pro.</p>
        </div>
    </div>

</div>

</body>
</html>


