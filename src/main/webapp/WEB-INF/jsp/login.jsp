<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card login-card">
            <div class="card-header text-center">
                <h3>Iniciar Sesión</h3>
            </div>
            <div class="card-body">
                <form method="post" action="/login">
                    <div class="form-group">
                        <label for="username">Usuario</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Ingresa tu usuario">
                    </div>
                    <div class="form-group">
                        <label for="password">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Ingresar</button>
                </form>
                <!-- Mostrar mensaje de error si existe -->
                <div th:if="${error}" class="alert alert-danger mt-3" role="alert">
                    <p th:text="${error}"></p>
                </div>
            </div>
            <div class="card-footer text-center">
                <small>¿No tienes una cuenta? <a href="#">Regístrate</a></small>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
