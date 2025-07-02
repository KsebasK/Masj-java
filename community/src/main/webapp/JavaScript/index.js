document.addEventListener("DOMContentLoaded", function () {
  const passwordInput = document.getElementById("Contraseña");
  const confirmPasswordInput = document.getElementById("confirmPassword");
  const passwordStrength = document.getElementById("passwordStrength");
  const passwordMatch = document.getElementById("passwordMatch");

  const requirements = {
    length: document.getElementById("length"),
    uppercase: document.getElementById("uppercase"),
    lowercase: document.getElementById("lowercase"),
    number: document.getElementById("number"),
    special: document.getElementById("special"),
  };

  function validatePassword(password) {
    return {
      length: password.length >= 8,
      uppercase: /[A-Z]/.test(password),
      lowercase: /[a-z]/.test(password),
      number: /[0-9]/.test(password),
      special: /[^A-Za-z0-9]/.test(password),
    };
  }

  function updateFeedback(password) {
    const result = validatePassword(password);

    for (let key in requirements) {
      if (result[key]) {
        requirements[key].classList.remove("invalid");
        requirements[key].classList.add("valid");
      } else {
        requirements[key].classList.remove("valid");
        requirements[key].classList.add("invalid");
      }
    }
  }

  function checkMatch() {
    const pass1 = passwordInput.value;
    const pass2 = confirmPasswordInput.value;

    if (pass1 === "" || pass2 === "") {
      passwordMatch.textContent = "";
      return;
    }

    if (pass1 === pass2) {
      passwordMatch.textContent = "✔ Las contraseñas coinciden";
      passwordMatch.style.color = "green";
    } else {
      passwordMatch.textContent = "✖ Las contraseñas no coinciden";
      passwordMatch.style.color = "red";
    }
  }

  if (passwordInput) {
    passwordInput.addEventListener("input", () => {
      updateFeedback(passwordInput.value);
      checkMatch();
    });
  }

  if (confirmPasswordInput) {
    confirmPasswordInput.addEventListener("input", checkMatch);
  }
});