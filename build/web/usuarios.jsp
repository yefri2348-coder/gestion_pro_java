<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>
<%
    List<Usuario> lista = (List<Usuario>) request.getAttribute("usuarios");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestión Pro - Usuarios</title>

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

        header a{
            color:white;
            text-decoration:none;
            font-weight:bold;
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
            padding:25px;
            border-radius:10px;
            box-shadow:0 2px 5px rgba(0,0,0,0.1);
        }

        table{
            width:100%;
            border-collapse: collapse;
            margin-top:20px;
        }

        th, td{
            padding:12px;
            border-bottom:1px solid #ddd;
            text-align:center;
        }

        th{
            background:#004aad;
            color:white;
        }

        .btn{
            padding:6px 12px;
            border-radius:5px;
            text-decoration:none;
            color:white;
            font-size:13px;
        }

        .editar{
            background:orange;
        }

        .eliminar{
            background:red;
        }

        .nuevo{
            background:green;
            display:inline-block;
            margin-bottom:15px;
        }

        .btn:hover{
            opacity:0.85;
        }
    </style>
</head>

<body>

<header>
    <h2>Gestión Pro</h2>
    <a href="dashboard.jsp">Volver al Dashboard</a>
</header>

<div class="container">

    <div class="sidebar">
        <h3 style="color:white;">Menú</h3>
        <a href="UsuarioServlet?accion=listar">Gestionar Usuarios</a>
        <a href="#">Proyectos</a>
        <a href="#">Tareas</a>
        <a href="LogoutServlet">Cerrar Sesión</a>
    </div>

    <div class="content">
        <div class="card">

            <h2>Lista de Usuarios</h2>

            <a class="btn nuevo" href="registro.jsp">Nuevo Usuario</a>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Acciones</th>
                </tr>

                <% if (lista != null && !lista.isEmpty()) {
                    for (Usuario u : lista) { %>

                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getNombre() %></td>
                    <td><%= u.getCorreo() %></td>
                    <td>
                        <a class="btn editar" 
                           href="UsuarioServlet?accion=editar&id=<%=u.getId()%>">
                           Editar
                        </a>

                        <a class="btn eliminar" 
                           href="UsuarioServlet?accion=eliminar&id=<%=u.getId()%>"
                           onclick="return confirm('¿Seguro que deseas eliminar este usuario?')">
                           Eliminar
                        </a>
                    </td>
                </tr>

                <%  } 
                   } else { %>

                <tr>
                    <td colspan="4">No hay usuarios registrados</td>
                </tr>

                <% } %>

            </table>

        </div>
    </div>

</div>

</body>
</html>

