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
        </ul>
        <h3>Gestión</h3>
        <ul>
            <li><a href="<%=request.getContextPath()%>/SvUsuario" class="<%= currentPage.contains("mostrarUsuarios.jsp") ? "active" : "" %>">
                  <i class="fas fa-users"></i><span>Usuarios</span></a></li>

              <li><a href="<%=request.getContextPath()%>/SvResidentesAdmin" class="<%= currentPage.contains("mostrarResidentes.jsp") ? "active" : "" %>">
            <i class="fas fa-building"></i><span>Apartamentos</span></a></li>
             <li><a href="vehiculos.jsp" class="<%= currentPage.contains("vehiculos.jsp") ? "active" : "" %>">
                <i class="fas fa-car"></i><span>Vehículos</span></a></li>
            <li><a href="visitantes.jsp" class="<%= currentPage.contains("visitantes.jsp") ? "active" : "" %>">
                <i class="fas fa-user-friends"></i><span>Visitantes</span></a></li>
            <li><a href="zonas.jsp" class="<%= currentPage.contains("zonas.jsp") ? "active" : "" %>">
                <i class="fas fa-swimming-pool"></i><span>Zonas Comunes</span></a></li>
            <li><a href="<%=request.getContextPath()%>/SvQuejasAdmin" class="<%= currentPage.contains("SvQuejasAdmin") ? "active" : "" %>">
                <i class="fas fa-comment-alt"></i><span>Quejas</span></a></li>
        </ul>
                  
        <h3>Configuración</h3>
        <ul>
            <li><a href="login.jsp" class="<%= currentPage.contains("login.jsp") ? "active" : "" %>">
                <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span></a></li>
        </ul>
    </div>
</div>