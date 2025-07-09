<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Registro</title>
  <link rel="stylesheet" href="Styles/index.css" />
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
      <p class="error" style="color: red; justify-content: center; text-align: center">
        <%= request.getAttribute("error") %>
      </p>
    <% } %>

    <form action="SvUsuario" method="POST" id="registroForm">
      <input type="text" name="primerNombre" placeholder="Primer Nombre" required minlength="3" maxlength="20"
        pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" title="Solo letras y espacios" />

      <input type="text" name="segundoNombre" placeholder="Segundo Nombre" minlength="3" maxlength="20"
        pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" title="Solo letras y espacios" />

      <input type="text" name="primerApellido" placeholder="Primer Apellido" required minlength="3" maxlength="20"
        pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" title="Solo letras y espacios" />

      <input type="text" name="segundoApellido" placeholder="Segundo Apellido" minlength="3" maxlength="20"
        pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" title="Solo letras y espacios" />

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

      <input type="text" name="numDocumento" placeholder="Número de Documento" required minlength="6" maxlength="10"
        pattern="[0-9]+" title="Solo números (6 a 10 dígitos)" />

      <input type="text" name="numeroCelular" placeholder="Número de Celular" required minlength="10" maxlength="10"
        pattern="3[0-9]{9}" title="Debe tener 10 dígitos y comenzar con 3" />

      <input type="email" name="correoElectronico" placeholder="Correo Electrónico" required />

      <input type="text" name="torre" placeholder="Torre Ej: 1, 2, 3" maxlength="2"
        pattern="[0-9]{1,2}" title="Solo números (1-2 dígitos)" />

      <input type="text" name="apartamento" placeholder="Apartamento Ej: 101, 2045" maxlength="4"
        pattern="[0-9]{3,4}" title="Solo números (3-4 dígitos)" />

      <input type="hidden" name="idApartamento" value="1" />

      <input type="password" name="contrasena" id="Contraseña" placeholder="Contraseña" required minlength="8"
        maxlength="10" title="Debe tener entre 8 y 10 caracteres" />

      <input type="password" id="confirmPassword" required minlength="8" maxlength="10"
        placeholder="Confirmar contraseña" title="Debe coincidir con la anterior" />

      <ul class="password-requirements" style="display: none;">
        <li id="length" class="invalid">Al menos 8 caracteres</li>
      </ul>

      <div id="passwordMatch" class="password-match"></div>

      <button type="submit" class="enviar">Registrarse</button>
    </form>

    <div class="login">
      <h2 class="cuenta">¿Ya tienes una cuenta?</h2>
      <a href="login.jsp" class="inicia">Inicia sesión aquí</a>
    </div>
  </div>

  <!-- Script de validación -->
  <script>
    const passwordInput = document.getElementById("Contraseña");
    const confirmPasswordInput = document.getElementById("confirmPassword");
    const passwordMatchMessage = document.getElementById("passwordMatch");
    const submitButton = document.querySelector(".enviar");
    const requirements = document.querySelector(".password-requirements");

    function checkPasswordMatch() {
      const password = passwordInput.value;
      const confirmPassword = confirmPasswordInput.value;

      if (confirmPassword === "") {
        passwordMatchMessage.textContent = "";
        submitButton.disabled = false;
        return;
      }

      if (password === confirmPassword) {
        passwordMatchMessage.style.color = "green";
        passwordMatchMessage.textContent = "✔ Las contraseñas coinciden";
        submitButton.disabled = false;
      } else {
        passwordMatchMessage.style.color = "red";
        passwordMatchMessage.textContent = "✖ Las contraseñas no coinciden";
        submitButton.disabled = true;
      }
    }

    passwordInput.addEventListener("input", () => {
      requirements.style.display = "block";
      checkPasswordMatch();
    });

    confirmPasswordInput.addEventListener("input", checkPasswordMatch);
  </script>
</body>
</html>
