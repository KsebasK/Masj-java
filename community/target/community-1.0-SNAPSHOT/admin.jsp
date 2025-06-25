<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Iconos Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
    <!-- Navbar superior -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <span class="navbar-brand">Administrador MASJ</span>
            <div class="d-flex">
                <a href="logout.jsp" class="btn btn-light">Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="SvUsuario">
                                <i class="bi bi-people"></i> Gestión de Usuarios
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionApartamentos.jsp">
                                <i class="bi bi-building"></i> Apartamentos y Conjuntos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionVehiculos.jsp">
                                <i class="bi bi-truck"></i> Vehículos y Parqueaderos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionVisitantes.jsp">
                                <i class="bi bi-person-bounding-box"></i> Visitantes
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Contenido principal -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Bienvenido Administrador</h1>
                </div>

                <p class="lead">Desde este panel puedes controlar todos los módulos del sistema MASJ. Usa el menú lateral para navegar por las diferentes secciones.</p>

                <!-- Tarjetas resumen opcionales -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="card text-white bg-success mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Usuarios</h5>
                                <p class="card-text">Gestiona usuarios y roles registrados.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-white bg-info mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Vehículos</h5>
                                <p class="card-text">Revisa vehículos y parqueaderos activos.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-white bg-warning mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Visitantes</h5>
                                <p class="card-text">Monitorea el ingreso de visitantes.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>