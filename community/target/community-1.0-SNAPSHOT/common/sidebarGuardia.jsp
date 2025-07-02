<%-- 
    Document   : sidebarGuardia
    Created on : 28/06/2025, 5:39:40?p. m.
    Author     : zzand
--%>

<%
    String currentPage = request.getRequestURI();
%>
<div class="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/imagenes/logo-masj.png" alt="Logo">
        <h3>MASJ Guardia</h3>
    </div>
    <div class="sidebar-menu">
        <h3>Principal</h3>
        <ul>
            <li><a href="guardia.jsp" class="<%= currentPage.contains("guardia.jsp") ? "active" : "" %>">
                <i class="fas fa-home"></i><span>Dashboard</span></a></li>
                 
        </ul>
        <h3>Gestión</h3>
        <ul>
               <li><a href="registrarVehiculo.jsp" class="<%= currentPage.contains("registrarVehiculo.jsp") ? "active" : "" %>">
                <i class="fas fa-car"></i><span>Vehículos</span></a></li>
            <li><a href="registrarVisitante.jsp" class="<%= currentPage.contains("registrarVisitante.jsp") ? "active" : "" %>">
                <i class="fas fa-user-friends"></i><span>Visitantes</span></a></li>
                <li><a href="login.jsp">
                <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span></a></li>
                           </ul>
      
       
    </div>
</div>