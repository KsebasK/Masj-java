
<%@ include file="common/header.jsp" %>
<%@ include file="common/sidebarResidente.jsp" %>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>

<!DOCTYPE html>
<html>
<head>
    <title>Redactar Queja</title>
      <link rel="stylesheet" href="Styles/admin.css">
</head>
<body>
<div class="main-content">
    <div class="content">
        <h2>Redactar una queja</h2>
        <form action="SvEnviarQueja" method="post">
            <input type="hidden" name="idResidente" value="<%= session.getAttribute("idResidente") %>">
            <input type="hidden" name="idAdministrador" value="4"><!-- Cambia el 3 si necesitas un admin específico -->

            <label for="motivoQueja">Motivo de la Queja:</label><br>
            <textarea name="motivoQueja" id="motivoQueja" rows="6" cols="60" placeholder="Escribe tu queja aquí..." required></textarea><br><br>

            <button type="submit" class="btn btn-primary">Enviar Queja</button>
        </form>
    </div>
</div>
</body>
</html>
