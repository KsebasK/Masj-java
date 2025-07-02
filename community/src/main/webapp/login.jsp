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
    
    <link rel="stylesheet" href="Styles/Login.css">
    <link rel="stylesheet" href="Login.css"/>
    
    <style>
        .alert-message {
            padding: 12px;
            margin: 10px 0;
            border-radius: 4px;
            font-family: 'Noto Sans', sans-serif;
            text-align: center;
        }
        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
    </style>
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

            <%-- Manejo de mensajes de éxito --%>
            <% if (request.getAttribute("status") != null) { %>
                <div class="alert-message alert-success">
                    <%= request.getAttribute("status") %>
                </div>
            <% } %>

            <%-- Manejo de errores desde parámetros URL (como session_expired) --%>
            <% 
            String errorParam = request.getParameter("error");
            if (errorParam != null) {
                String errorMessage = "";
                String alertClass = "alert-danger";
                
                switch(errorParam) {
                    case "session_expired":
                        errorMessage = "Su sesión ha expirado. Por favor ingrese nuevamente.";
                        alertClass = "alert-warning";
                        break;
                    case "invalid_credentials":
                        errorMessage = "Correo o contraseña incorrectos";
                        break;
                    case "access_denied":
                        errorMessage = "No tiene permisos para acceder a esa página";
                        break;
                    default:
                        errorMessage = "Ocurrió un error durante el inicio de sesión";
                }
            %>
                <div class="alert-message <%= alertClass %>">
                    <%= errorMessage %>
                </div>
            <% } %>

            <%-- Manejo de errores desde atributos request --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert-message alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="SvLogin" method="POST">
                <input type="email" name="correo" id="CorreoElectronico" placeholder="Correo" required>
                <input type="password" name="contrasena" id="Contraseña" placeholder="Contraseña" required>
                <a class="contraseña" href="recuperarPassword.jsp">Olvidé mi contraseña</a>
                <button type="submit" class="enviar">Iniciar Sesión</button>
            </form>
        </div>

        <div class="registro">
            <h2 class="cuenta">¿No tienes una cuenta?</h2>
            <a href="index.jsp" class="inicia">Regístrate aquí</a>
        </div>
    </div>
</body>
</html>