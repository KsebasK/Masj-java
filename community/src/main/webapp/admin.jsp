<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administrador - MASJ</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            color: #333;
            padding: 0;
            margin: 0;
        }
        header {
            background-color: #222831;
            color: #fff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }
        header h2 {
            font-weight: 700;
        }
        nav a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #00adb5;
        }
        .content {
            padding: 50px 40px;
        }
        h1, h2 {
            color: #222;
        }
        .card {
            background-color: #ffffffcc;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 40px;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.01);
        }
        .card h2 {
            margin-bottom: 15px;
            font-size: 22px;
            border-bottom: 2px solid #00adb5;
            padding-bottom: 5px;
        }
        .card ul {
            list-style: none;
            padding-left: 0;
        }
        .card ul li {
            margin-bottom: 12px;
        }
        .card ul li a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
            transition: color 0.2s;
        }
        .card ul li a:hover {
            color: #0056b3;
        }
        @media screen and (max-width: 768px) {
            .content {
                padding: 20px;
            }
            header {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <header>
        <h2>Panel Administrador - MASJ</h2>
        <nav>
            <a href="login.jsp">Cerrar Sesión</a>
        </nav>
    </header>
    <div class="content">
        <div class="card">
            <h2>Gestión de Usuarios</h2>
            <ul>
                <li><a href="registro.jsp">Registrar Usuario</a></li>
                <li><a href="mostrarUsuarios.jsp">Ver Usuarios</a></li>
            </ul>
        </div>

        <div class="card">
            <h2>Gestión de Apartamentos</h2>
            <ul>
                <li><a href="registroApartamento.jsp">Registrar Apartamento</a></li>
                <li><a href="mostrarApartamentos.jsp">Ver Apartamentos</a></li>
            </ul>
        </div>

        <div class="card">
            <h2>Gestión de Vehículos</h2>
            <ul>
                <li><a href="registroVehiculo.jsp">Registrar Vehículo</a></li>
                <li><a href="mostrarVehiculos.jsp">Ver Vehículos</a></li>
            </ul>
        </div>

        <div class="card">
            <h2>Gestión de Visitantes</h2>
            <ul>
                <li><a href="registroVisitante.jsp">Registrar Visitante</a></li>
                <li><a href="mostrarVisitantes.jsp">Ver Visitantes</a></li>
            </ul>
        </div>

        <div class="card">
            <h2>Zonas Comunes</h2>
            <ul>
                <li><a href="zonasComunes.jsp">Ver Zonas Disponibles</a></li>
                <li><a href="reservas.jsp">Reservas de Zonas</a></li>
            </ul>
        </div>

        <div class="card">
            <h2>Paquetería y Quejas</h2>
            <ul>
                <li><a href="registroPaqueteria.jsp">Registrar Paquete</a></li>
                <li><a href="mostrarPaqueterias.jsp">Ver Paquetería</a></li>
                <li><a href="mostrarQuejas.jsp">Ver Quejas</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
