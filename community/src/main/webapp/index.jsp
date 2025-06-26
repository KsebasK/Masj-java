<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center text-primary">Registro de Usuario</h1>

    <form action="SvUsuario" method="POST" class="row g-3 bg-white p-4 shadow rounded">

        <div class="col-md-6">
            <label class="form-label">Primer Nombre:</label>
            <input type="text" name="primerNombre" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Segundo Nombre:</label>
            <input type="text" name="segundoNombre" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Primer Apellido:</label>
            <input type="text" name="primerApellido" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Segundo Apellido:</label>
            <input type="text" name="segundoApellido" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Número de Celular:</label>
            <input type="text" name="numeroCelular" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Correo Electrónico:</label>
            <input type="email" name="correoElectronico" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Contraseña:</label>
            <input type="password" name="contrasena" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Fecha de Nacimiento:</label>
            <input type="date" name="fechaNacimiento" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Estado:</label>
            <select name="estado" class="form-select" required>
                <option value="activo">Activo</option>
                <option value="inactivo">Inactivo</option>
            </select>
        </div>

        <div class="col-md-6">
            <label class="form-label">Rol:</label>
            <select name="rol" class="form-select" required>
                <option value="propietario">Residente</option>
                <option value="administrador">Administrador</option>
                <option value="guardia">Guardia</option>
                <option value="arrendatario">Arrendatario</option>
            </select>
        </div>

        <div class="col-md-6">
            <label class="form-label">Tipo de Documento:</label>
            <select name="tipoDocumento" class="form-select" required>
                <option value="CC">Cédula de Ciudadanía</option>
                <option value="TI">Tarjeta de Identidad</option>
                <option value="CE">Cédula de Extranjería</option>
            </select>
        </div>

        <div class="col-md-6">
            <label class="form-label">Número de Documento:</label>
            <input type="number" name="numDocumento" class="form-control" required>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary w-100">Registrar Usuario</button>
        </div>
    </form>

    <hr class="my-5">

    <!-- Ver usuarios -->
    <h3>Ver lista de usuarios</h3>
    <form action="SvUsuario" method="GET" class="mb-3">
        <button type="submit" class="btn btn-info">Mostrar Usuarios</button>
    </form>

    <!-- Eliminar usuario -->
    <h3>Eliminar Usuario</h3>
    <form action="SvEliminar" method="POST" class="mb-3 row g-2">
        <div class="col-md-4">
            <input type="text" name="idUsuario" class="form-control" placeholder="ID del Usuario" required>
        </div>
        <div class="col-md-4">
            <button type="submit" class="btn btn-danger">Eliminar</button>
        </div>
    </form>

    <!-- Editar usuario -->
    <h3>Editar Usuario</h3>
    <form action="SvEditar" method="GET" class="mb-5 row g-2">
        <div class="col-md-4">
            <input type="text" name="idUsuarioEdit" class="form-control" placeholder="ID del Usuario" required>
        </div>
        <div class="col-md-4">
            <button type="submit" class="btn btn-warning">Editar</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
