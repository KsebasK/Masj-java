<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Usuario" %>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp?error=session_expired");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Guardia</title>
    <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>

    <%@include file="common/sidebarGuardia.jsp" %>
    <%@include file="common/header.jsp" %>

    <div class="main-content">
        <div class="content"> 
            <div class="contenedor">
                <h1>Bienvenido Guardia</h1>
                <p>Aquí puedes registrar visitantes, verificar vehículos.</p>
            </div>
        </div>
    </div>
</body>
</html>
