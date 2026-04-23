<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Usuario> lista = (List<Usuario>) request.getAttribute("usuarios");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>

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

            <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a href="UsuarioServlet?accion=listar"><i class="bi bi-people"></i> Usuarios</a>
            <a href="#"><i class="bi bi-kanban"></i> Proyectos</a>
            <a href="#"><i class="bi bi-list-task"></i> Tareas</a>
            <a href="LogoutServlet"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
        </div>

        <!-- CONTENIDO -->
        <div class="col-md-9 col-lg-10 p-4">

            <h3 class="mb-4">Gestión de Usuarios</h3>

            <!-- BOTÓN AGREGAR -->
            <a href="registro.jsp" class="btn btn-success mb-3">
                <i class="bi bi-person-plus"></i> Nuevo Usuario
            </a>

            <!-- TABLA -->
            <div class="card shadow">
                <div class="card-body">

                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>

                        <%
                            if (lista != null) {
                                for (Usuario u : lista) {
                        %>

                        <tr>
                            <td><%= u.getId() %></td>
                            <td><%= u.getNombre() %></td>
                            <td><%= u.getCorreo() %></td>
                            <td>
                                <a href="UsuarioServlet?accion=editar&id=<%= u.getId() %>" class="btn btn-warning btn-sm">
                                    <i class="bi bi-pencil"></i>
                                </a>

                                <a href="UsuarioServlet?accion=eliminar&id=<%= u.getId() %>" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Eliminar usuario?')">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>

                        <%
                                }
                            }
                        %>

                        </tbody>
                    </table>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>