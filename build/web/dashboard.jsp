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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión Pro - Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Iconos -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
        }

        .sidebar {
            height: 100vh;
            background: #1f2440;
            color: white;
            padding: 20px;
        }

        .sidebar a {
            display: block;
            color: #cfd8dc;
            text-decoration: none;
            margin: 15px 0;
        }

        .sidebar a:hover {
            color: white;
            padding-left: 5px;
        }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">

        <!-- SIDEBAR -->
        <div class="col-md-3 col-lg-2 sidebar">
            <h4>Gestión Pro</h4>
            <hr>

            <a href="#"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a href="UsuarioServlet?accion=listar"><i class="bi bi-people"></i> Usuarios</a>
            <a href="#"><i class="bi bi-kanban"></i> Proyectos</a>
            <a href="#"><i class="bi bi-list-task"></i> Tareas</a>
            <a href="LogoutServlet"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
        </div>

        <!-- CONTENIDO -->
        <div class="col-md-9 col-lg-10 p-4">

            <!-- HEADER -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3>Bienvenido, <%= usuario.getNombre() %></h3>
            </div>

            <!-- CARDS -->
<div class="row g-3">

    <div class="col-md-4">
   <a href="<%= request.getContextPath() %>/UsuarioServlet?accion=listar" class="d-block text-decoration-none">
            <div class="card text-white bg-primary shadow">
                <div class="card-body">
                    <h5><i class="bi bi-people"></i> Usuarios</h5>
                    <p>Administrar usuarios</p>
                </div>
            </div>
        </a>
    </div>

    <div class="col-md-4">
        <div class="card text-white bg-success shadow">
            <div class="card-body">
                <h5><i class="bi bi-kanban"></i> Proyectos</h5>
                <p>Gestión de proyectos</p>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card text-dark bg-warning shadow">
            <div class="card-body">
                <h5><i class="bi bi-list-task"></i> Tareas</h5>
                <p>Control de tareas</p>
            </div>
        </div>
    </div>

</div>

            <!-- PANEL -->
            <div class="card mt-4 shadow">
                <div class="card-body">
                    <h4>Panel Principal</h4>
                    <p>Bienvenido al sistema Gestión Pro. Desde aquí puedes administrar usuarios, proyectos y tareas.</p>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>


