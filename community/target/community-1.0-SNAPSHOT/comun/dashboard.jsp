<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>

<div class="main-content">
    <div class="top-navbar">
        <div class="search-bar">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Buscar..." id="searchInput">
        </div>
        <div class="user-profile">
            <div class="notification-bell" id="notificationBell">
                <i class="fas fa-bell"></i>
                <span class="notification-badge">3</span>
            </div>
            <img src="imagenes/default-user.png" alt="Admin">
            <div class="user-info">
                <h4>Administrador</h4>
                <small>MASJ</small>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="page-header">
            <h1>Panel de Administración</h1>
            <ul class="breadcrumb">
                <li><a href="#">Inicio</a></li>
                <li>Dashboard</li>
            </ul>
        </div>

        <div class="cards-grid">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Usuarios Registrados</div>
                    <div class="card-icon"><i class="fas fa-users"></i></div>
                </div>
                <div class="card-body">
                    <h3>128</h3>
                    <span class="stats up"><i class="fas fa-arrow-up"></i> 5%</span>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Visitantes Hoy</div>
                    <div class="card-icon"><i class="fas fa-user-friends"></i></div>
                </div>
                <div class="card-body">
                    <h3>12</h3>
                    <span class="stats down"><i class="fas fa-arrow-down"></i> 3%</span>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
