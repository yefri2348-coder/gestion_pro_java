<%-- 
    Document   : registro
    Created on : 17/02/2026, 10:16:39 p. m.
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro - Gestión Pro</title>
    <style>
        body{
            font-family: Arial;
            background: linear-gradient(135deg,#4b6cb7,#182848);
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .card{
            background:white;
            padding:30px;
            border-radius:10px;
            width:300px;
            text-align:center;
        }

        input{
            width:100%;
            padding:10px;
            margin:10px 0;
        }

        button{
            width:100%;
            padding:10px;
            background:#182848;
            color:white;
            border:none;
        }

        a{
            text-decoration:none;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Registro</h2>

    <form action="RegisterServlet" method="post">
        <input type="text" name="nombre" placeholder="Nombre" required>
        <input type="email" name="correo" placeholder="Correo" required>
        <input type="password" name="password" placeholder="Contraseña" required>
        <button type="submit">Registrarse</button>
    </form>

    <br>
    <a href="index.jsp">Volver al Login</a>

    <% if(request.getParameter("error") != null){ %>
        <p style="color:red;">Error al registrar</p>
    <% } %>

</div>

</body>
</html>
