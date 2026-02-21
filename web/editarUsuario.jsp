<%@ page import="modelo.Usuario" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");

    if (u == null) {
%>
        <h2 style="color:red;">Usuario no encontrado</h2>
        <a href="UsuarioServlet?accion=listar">Volver</a>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario - Gestión Pro</title>

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
        }

        .container{
            padding:40px;
        }

        .card{
            background:white;
            padding:30px;
            border-radius:10px;
            box-shadow:0 2px 5px rgba(0,0,0,0.1);
            width:400px;
            margin:auto;
        }

        input{
            width:100%;
            padding:10px;
            margin:10px 0;
            border-radius:5px;
            border:1px solid #ccc;
        }

        button{
            width:100%;
            padding:10px;
            background:#004aad;
            color:white;
            border:none;
            border-radius:5px;
            cursor:pointer;
        }

        button:hover{
            background:#00337a;
        }
    </style>
</head>

<body>

<header>
    <h2>Gestión Pro - Editar Usuario</h2>
</header>

<div class="container">
    <div class="card">

        <form action="UsuarioServlet" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= u.getId() %>">

            <label>Nombre:</label>
            <input type="text" name="nombre" value="<%= u.getNombre() %>" required>

            <label>Correo:</label>
            <input type="email" name="correo" value="<%= u.getCorreo() %>" required>

            <label>Password:</label>
            <input type="text" name="password" value="<%= u.getPassword() %>" required>

            <button type="submit">Actualizar Usuario</button>
        </form>

    </div>
</div>

</body>
</html>

