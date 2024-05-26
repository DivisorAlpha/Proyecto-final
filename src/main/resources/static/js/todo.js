function validateForm() {
        var motocicleta = document.querySelector('input[name="motocicleta"]').checked;
        var carro = document.querySelector('input[name="carro"]').checked;
        var carroPesado = document.querySelector('input[name="carroPesado"]').checked;

        var formError = document.getElementById("formError");

        if (!motocicleta && !carro && !carroPesado) {
            formError.textContent = "Debe seleccionar al menos uno de los vehículos.";
            return false; // Previene el envío del formulario
        } else {
            formError.textContent = ""; // Limpia el mensaje de error si la validación es exitosa
            return true; // Permite el envío del formulario
        }
    }