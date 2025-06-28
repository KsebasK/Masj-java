<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Registro</title>
  <link rel="stylesheet" href="Styles/index.css" />
  <link rel="stylesheet" href="index.css" />
</head>

<body>
  <div class="container">
    <div class="background"></div>
    <div class="circles">
      <div class="circle"></div>
      <div class="circle"></div>
      <div class="circle"></div>
    </div>
    <div class="lines"></div>
    <div class="neon-ring"></div>
    <div class="glow"></div>
    <div class="MASJ">
      <div class="letter M">M</div>
      <div class="letter A">A</div>
      <div class="letter S">S</div>
      <div class="letter J">J</div>
    </div>
  </div>

  <div class="contenedor">
    <h1><span class="ci">Regístrate</span></h1>

    <% if (request.getAttribute("error") != null) { %>
      <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <form action="SvUsuario" method="POST" id="registroForm">
      <input type="text" name="primerNombre" placeholder="Primer Nombre" required minlength="3" maxlength="20" pattern="[A-Za-z\s]+" title="Solo letras y espacios" />
      <input type="text" name="segundoNombre" placeholder="Segundo Nombre" minlength="3" maxlength="20" pattern="[A-Za-z\s]+" title="Solo letras y espacios" />
      <input type="text" name="primerApellido" placeholder="Primer Apellido" required minlength="3" maxlength="20" pattern="[A-Za-z\s]+" title="Solo se permiten letras y espacios" />
      <input type="text" name="segundoApellido" placeholder="Segundo Apellido" minlength="3" maxlength="20" pattern="[A-Za-z\s]+" title="Solo se permiten letras y espacios" />

      <div class="contenedor2">
        <label class="docu">
          Tipo de Documento:
          <select name="tipoDocumento" required>
            <option value="">Selecciona</option>
            <option value="cedula">Cédula de Ciudadanía</option>
            <option value="pasaporte">Pasaporte</option>
            <option value="cedula_extranjeria">Cédula de Extranjería</option>
          </select>
        </label>

        <label class="fecha">
          Fecha de Nacimiento:
          <input type="date" name="fechaNacimiento" required />
        </label>
 
        <label class="roles">
          Rol:
          <select name="rol" required>
            <option value="">Selecciona</option>
            <option value="arrendatario">Arrendatario</option>
          </select>
        </label>

      </div>
      

      <input type="text" name="numDocumento" placeholder="Número de Documento" required minlength="6" maxlength="10" pattern="[0-9]+" title="Solo se permiten números" />
      <input type="text" name="numeroCelular" placeholder="Número de Celular" required minlength="10" maxlength="10" pattern="[0-9]+" title="Solo se permiten números" />
      <input type="email" name="correoElectronico" placeholder="Correo Electrónico" required />

      <!-- Torre y apartamento (solo visual, no se usan en el servlet directamente) -->
      <input type="text" name="torre" placeholder="Torre (ej: T1)" maxlength="10" title="Ingresa la torre del apartamento" />
      <input type="text" name="apartamento" placeholder="Apartamento (ej: APT204)" maxlength="15" title="Ingresa el número del apartamento" />

      <!-- Campo oculto para idApartamento (debes llenarlo con JS o desde el servidor) -->
      <input type="hidden" name="idApartamento" value="1" />

      <input type="password" name="contrasena" id="Contraseña" placeholder="Contraseña" required />
      <input type="password" id="confirmPassword" placeholder="Confirmar contraseña" required />

      <div id="passwordStrength" class="password-strength"></div>
      <ul class="password-requirements">
        <li id="length" class="invalid"><img src="imagenes/error_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg" alt="Alerta" class="alert" />Al menos 8 caracteres</li>
        <li id="uppercase" class="invalid"><img src="imagenes/error_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg" alt="Alerta" class="alert" />Una letra mayúscula</li>
        <li id="lowercase" class="invalid"><img src="imagenes/error_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg" alt="Alerta" class="alert" />Una letra minúscula</li>
        <li id="number" class="invalid"><img src="imagenes/error_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg" alt="Alerta" class="alert" />Un número</li>
        <li id="special" class="invalid"><img src="imagenes/error_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg" alt="Alerta" class="alert" />Un carácter especial</li>
      </ul>

      <div id="passwordMatch" class="password-match"></div>

      <button type="submit" class="enviar">Registrarse</button>
    </form>

    <div class="login">
      <h2 class="cuenta">¿Ya tienes una cuenta?</h2>
      <a href="login.jsp" class="inicia">Inicia sesión aquí</a>
    </div>
  </div>

  <script src="JavaScript/index.js" defer></script>
  
</body>
</html>
<!-- Eliminar usuario -->
<!-- <h3>Eliminar Usuario</h3>
    <form action="SvEliminar" method="POST" class="mb-3 row g-2">
        <div class="col-md-4">
            <input type="text" name="idUsuario" class="form-control" placeholder="ID del Usuario" required>
        </div>
        <div class="col-md-4">
            <button type="submit" class="btn btn-danger">Eliminar</button>
        </div>
    </form> -->

<!-- Editar usuario -->
<!-- <h3>Editar Usuario</h3>
    <form action="SvEditar" method="GET" class="mb-5 row g-2">
        <div class="col-md-4">
            <input type="text" name="idUsuarioEdit" class="form-control" placeholder="ID del Usuario" required>
        </div>
        <div class="col-md-4">
            <button type="submit" class="btn btn-warning">Editar</button>
        </div>
    </form>
</div> -->

<!-- Bootstrap JS -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> -->
