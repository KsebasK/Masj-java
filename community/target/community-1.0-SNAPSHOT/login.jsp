<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/src/main/webapp/Styles/Login.css">
</head>
<body>

<div class="container">
    <div class="background"></div>
    <div class="circles">
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
    </div>
    <div class="lines"></div>
    <div class="neon-ring"></div>
    <div class="glow"></div>
    <div class="MASJ">
        <div class="letter M">M</div>
        <div class="letter A">A</div>
        <div class="letter S">S</div>
        <div class="letter J">J</div>
    </div>
</div>

<div class="contenedor">
    <div class="formulario">
        <h1 class="ci">Iniciar Sesión</h1>

        <% if (request.getAttribute("status") != null) { %>
            <div class="alert alert-success" role="alert">
                <%= request.getAttribute("status") %>
            </div>
        <% } %>

        <form action="SvLogin" method="POST">
            <input type="email" name="correo" id="CorreoElectronico" placeholder="Correo" required>
            <input type="password" name="contrasena" id="Contraseña" placeholder="Contraseña" required>
            <a class="contraseña" href="recuperarPassword.jsp">Olvidé mi contraseña</a>
            <button type="submit" class="enviar">Iniciar Sesión</button>
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>

    <div class="registro">
        <h2 class="cuenta">¿No tienes una cuenta?</h2>
        <a href="registro.jsp" class="inicia">Regístrate aquí</a>
    </div>
</div>

</body>
</html>
