<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Usuario</title>
   <link rel="stylesheet" href="Styles/index.css"/>
</head>
<body>

<h1>Registro de Usuario</h1>

<form action="SvUsuario" method="post">
    <label>Primer Nombre:</label>
    <input type="text" name="primerNombre" required>

    <label>Segundo Nombre:</label>
    <input type="text" name="segundoNombre">

    <label>Primer Apellido:</label>
    <input type="text" name="primerApellido" required>

    <label>Segundo Apellido:</label>
    <input type="text" name="segundoApellido">

    <label>Número de Celular:</label>
    <input type="text" name="numeroCelular" required>

    <label>Correo Electrónico:</label>
    <input type="email" name="correoElectronico" required>

    <label>Contraseña:</label>
    <input type="password" name="contrasena" required>

    <select name="conjuntoNombre">
    <option value="Conjunto Unico">Conjunto Unico</option>
</select>

    <label>Fecha de Nacimiento:</label>
    <input type="date" name="fechaNacimiento" required>

    <label>Estado:</label>
    <select name="estado" required>
        <option value="Activo">Activo</option>
        <option value="Inactivo">Inactivo</option>
    </select>

    <label>Rol:</label>
    <select name="rol" required>
        <option value="propietario">Residente</option>
        <option value="administrador">Administrador</option>
        <option value="guardia">Guardia</option>
        <option value="arrendatario">Arrendatario</option>
    </select>

    <label>Tipo de Documento:</label>
    <select name="tipoDocumento" required>
        <option value="CC">Cédula de Ciudadanía</option>
        <option value="TI">Tarjeta de Identidad</option>
        <option value="CE">Cédula de Extranjería</option>
    </select>

    <label>Número de Documento:</label>
    <input type="number" name="numDocumento" required>

    <input type="submit" value="Registrar">
</form>

 <h1>Ver lista de usuarios</h1>
    <p>Para ver los datos de los usuarios cargados haga click</p>
    <form action="SvUsuario" method="GET">
        <button type="submit"> mostrar Usuarios </button> 
    </form>
    
<h1>Eliminar Usuario</h1>
    <p>Ingresa el Id para eliminar usuario</p>
    <form action="SvEliminar" method="POST">
  <input type="text" name="idUsuario" placeholder="Escribe el ID">
  <input type="submit" value="Eliminar">
    </form>

    <h1>Editar Usu</h1>
    <p>Ingresa el Id para editar Usuario</p>
    <form action="SvEditar" method="GET">
  <input type="text" name="idUsuarioEdit" placeholder="Escribe el ID">
  <input type="submit" value="Editar">
    </form>
    
    


</form>

</form>

    </form>
</body>
</html>
