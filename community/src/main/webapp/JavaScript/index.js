// JavaScript completo para validación de formulario (Torre, Apartamento, Contraseña, Edad, Documento, Celular)

document.addEventListener("DOMContentLoaded", function () {
  const passwordInput = document.getElementById("Contraseña");
  const confirmPasswordInput = document.getElementById("confirmPassword");
  const fechaNacimientoInput = document.getElementById("fechaNacimiento");
  const numDocumentoInput = document.querySelector('input[name="numDocumento"]');
  const numeroCelularInput = document.querySelector('input[name="numeroCelular"]');
  const torreInput = document.querySelector('input[name="torre"]');
  const apartamentoInput = document.querySelector('input[name="apartamento"]');
  const togglePasswordBtn = document.getElementById("togglePassword");
  const toggleConfirmPasswordBtn = document.getElementById("toggleConfirmPassword");

  // Mostrar/ocultar contraseña
  if (togglePasswordBtn) {
    togglePasswordBtn.addEventListener("click", function () {
      togglePasswordVisibility(passwordInput, togglePasswordBtn);
    });
  }
  if (toggleConfirmPasswordBtn) {
    toggleConfirmPasswordBtn.addEventListener("click", function () {
      togglePasswordVisibility(confirmPasswordInput, toggleConfirmPasswordBtn);
    });
  }
  function togglePasswordVisibility(input, button) {
    if (input.type === "password") {
      input.type = "text";
      button.textContent = "🙈";
    } else {
      input.type = "password";
      button.textContent = "👁️";
    }
  }

  // Validación de edad
  if (fechaNacimientoInput) {
    const today = new Date();
    const maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
    const minDate = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());
    fechaNacimientoInput.max = maxDate.toISOString().split("T")[0];
    fechaNacimientoInput.min = minDate.toISOString().split("T")[0];

    fechaNacimientoInput.addEventListener("change", function () {
      validateAge(this);
    });
  }
  function validateAge(input) {
    const birthDate = new Date(input.value);
    const today = new Date();
    let age = today.getFullYear() - birthDate.getFullYear();
    const m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) age--;

    if (age < 18 || age > 100) {
      input.setCustomValidity("Debes tener entre 18 y 100 años.");
    } else {
      input.setCustomValidity("");
    }
  }

  // Validación Documento
  if (numDocumentoInput) {
    numDocumentoInput.addEventListener("input", function () {
      this.value = this.value.replace(/[^0-9]/g, "").substring(0, 10);
    });
  }

  // Validación Celular colombiano
  if (numeroCelularInput) {
    numeroCelularInput.addEventListener("input", function () {
      this.value = this.value.replace(/[^0-9]/g, "").substring(0, 10);
    });
    numeroCelularInput.addEventListener("blur", function () {
      if (!this.value.match(/^3\d{9}$/)) {
        this.setCustomValidity("El número debe tener 10 dígitos y comenzar con 3.");
      } else {
        this.setCustomValidity("");
      }
    });
  }

  // Validación Torre
  if (torreInput) {
    torreInput.addEventListener("input", function () {
      let value = this.value.toUpperCase().replace(/[^T0-9]/g, "");
      if (value && !value.startsWith("T")) {
        value = "T" + value.replace(/T/g, "");
      }
      this.value = value;
    });
    torreInput.addEventListener("blur", function () {
      if (!/^T\d+$/.test(this.value)) {
        this.setCustomValidity("Formato de torre inválido. Usa T seguido de números (ej: T1).");
      } else {
        this.setCustomValidity("");
      }
    });
  }

  // Validación Apartamento
  if (apartamentoInput) {
    apartamentoInput.addEventListener("input", function () {
      let value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, "");
      if (value && !value.startsWith("AP")) {
        value = "AP" + value.replace(/AP/g, "");
      }
      this.value = value;
    });
    apartamentoInput.addEventListener("blur", function () {
      if (!/^APT\d+[A-Z]?$/.test(this.value)) {
        this.setCustomValidity("Formato inválido. Usa APT seguido de números, y una letra opcional (ej: APT204A).");
      } else {
        this.setCustomValidity("");
      }
    });
  }
});
