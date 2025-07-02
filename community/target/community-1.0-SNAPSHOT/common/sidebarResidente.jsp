<%
    String currentPage = request.getRequestURI();
%>
<div class="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/imagenes/logo-masj.png" alt="Logo">
        <h3>MASJ Residente</h3>
    </div>
    <div class="sidebar-menu">
        <h3>Principal</h3>
        <ul>
            <li><a href="residente.jsp" class="<%= currentPage.contains("residente.jsp") ? "active" : "" %>">
                <i class="fas fa-home"></i><span>Dashboard</span></a></li>
            <li><a href="ReservasResidente.jsp" class="<%= currentPage.contains("ReservasResidente.jsp") ? "active" : "" %>">
                <i class="fas fa-calendar-alt"></i><span>Reservas</span></a></li>
            <li><a href="QuejasResidente.jsp" class="<%= currentPage.contains("QuejasResidente.jsp") ? "active" : "" %>">
                <i class="fas fa-comment-alt"></i><span>Quejas</span></a></li>
            <li><a href="notificaciones.jsp" class="<%= currentPage.contains("notificaciones.jsp") ? "active" : "" %>">
                <i class="fas fa-bell"></i><span>Notificaciones</span></a></li>
            <li><a href="correspondencia.jsp" class="<%= currentPage.contains("correspondencia.jsp") ? "active" : "" %>">
                <i class="fas fa-envelope"></i><span>Correspondencia</span></a></li>
            <li><a href="comprobantes.jsp" class="<%= currentPage.contains("comprobantes.jsp") ? "active" : "" %>">
                <i class="fas fa-receipt"></i><span>Comprobante de Pago</span></a></li>
            <li><a href="perfil.jsp" class="<%= currentPage.contains("perfil.jsp") ? "active" : "" %>">
                <i class="fas fa-user"></i><span>Mi Perfil</span></a></li>
            <li><a href="login.jsp">
                <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span></a></li>
        </ul>
    </div>
</div>
