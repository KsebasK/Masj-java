<%
    String currentPage = request.getRequestURI();
%>
<div class="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/imagenes/logo-masj.png" alt="Logo">
        <h3>MASJ Admin</h3>
    </div>
    <div class="sidebar-menu">
        <h3>Principal</h3>
        <ul>
            <li><a href="admin.jsp" class="<%= currentPage.contains("admin.jsp") ? "active" : "" %>">
                <i class="fas fa-home"></i><span>Dashboard</span></a></li>
            <li><a href="estadisticas.jsp" class="<%= currentPage.contains("estadisticas.jsp") ? "active" : "" %>">
                <i class="fas fa-chart-line"></i><span>Estadísticas</span></a></li>
            <li><a href="notificaciones.jsp" class="<%= currentPage.contains("notificaciones.jsp") ? "active" : "" %>">
                <i class="fas fa-bell"></i><span>Notificaciones</span></a></li>
        </ul>
        <h3>Gestión</h3>
        <ul>
            <li><a href="mostrarUsuarios.jsp" class="<%= currentPage.contains("mostrarUsuarios.jsp") ? "active" : "" %>">
                <i class="fas fa-users"></i><span>Usuarios</span></a></li>
            <li><a href="apartamentos.jsp" class="<%= currentPage.contains("apartamentos.jsp") ? "active" : "" %>">
                <i class="fas fa-building"></i><span>Apartamentos</span></a></li>
            <li><a href="vehiculos.jsp" class="<%= currentPage.contains("vehiculos.jsp") ? "active" : "" %>">
                <i class="fas fa-car"></i><span>Vehículos</span></a></li>
            <li><a href="visitantes.jsp" class="<%= currentPage.contains("visitantes.jsp") ? "active" : "" %>">
                <i class="fas fa-user-friends"></i><span>Visitantes</span></a></li>
            <li><a href="zonas.jsp" class="<%= currentPage.contains("zonas.jsp") ? "active" : "" %>">
                <i class="fas fa-swimming-pool"></i><span>Zonas Comunes</span></a></li>
            <li><a href="paqueteria.jsp" class="<%= currentPage.contains("paqueteria.jsp") ? "active" : "" %>">
                <i class="fas fa-box"></i><span>Paquetería</span></a></li>
            <li><a href="quejas.jsp" class="<%= currentPage.contains("quejas.jsp") ? "active" : "" %>">
                <i class="fas fa-comment-alt"></i><span>Quejas</span></a></li>
        </ul>
        <h3>Configuración</h3>
        <ul>
            <li><a href="ajustes.jsp" class="<%= currentPage.contains("ajustes.jsp") ? "active" : "" %>">
                <i class="fas fa-cog"></i><span>Ajustes</span></a></li>
            <li><a href="logout.jsp" class="<%= currentPage.contains("logout.jsp") ? "active" : "" %>">
                <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span></a></li>
        </ul>
    </div>
</div>