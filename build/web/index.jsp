<%-- 
    Document   : index
    Created on : 11/02/2026, 5:28:51 a. m.
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión Pro | Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background: linear-gradient(135deg, #211f40, #99aef2);
        }

        .container{
            width:350px;
            background:white;
            padding:40px;
            border-radius:15px;
            box-shadow:0 15px 30px rgba(0,0,0,0.2);
        }

        .container h2{
            text-align:center;
            margin-bottom:25px;
            color:#1f4037;
        }

        .input-group{
            margin-bottom:20px;
        }

        .input-group label{
            font-size:14px;
            color:#555;
        }

        .input-group input{
            width:100%;
            padding:10px;
            margin-top:5px;
            border-radius:8px;
            border:1px solid #ccc;
            outline:none;
            transition:0.3s;
        }

        .input-group input:focus{
            border-color:#1f4037;
        }

        .btn{
            width:100%;
            padding:10px;
            border:none;
            border-radius:8px;
            background:#1f2440;
            color:white;
            font-weight:bold;
            cursor:pointer;
            transition:0.3s;
        }

        .btn:hover{
            background:#161f31;
        }

        .footer{
            margin-top:15px;
            text-align:center;
            font-size:13px;
        }

        .footer a{
            text-decoration:none;
            color:#1f4037;
            font-weight:bold;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Gestión Pro</h2>
       
       <form action="LoginServlet" method="post">

            <div class="input-group">
                <label>Correo electrónico</label>
                <input type="email" name="correo" required>
            </div>

            <div class="input-group">
                <label>Contraseña</label>
                <input type="password" name="password" required>
            </div>

            <button type="submit" class="btn">Iniciar Sesión</button>

            <div class="footer">
                ¿No tienes cuenta? <a href="registro.jsp">Regístrate</a>

            </div>

        </form>
    </div>

</body>
</html>
