<%@ include file="common/header.jsp"%>

<div class="container mt-5">
    <h1>Información del Usuario</h1>
    <div class="card">
        <div class="card-body">
            <p><strong>Nombre: </strong> ${todo.nombre}</p>
            <p><strong>Numero de Telefono: </strong> ${todo.telefono}</p>
            <p><strong>Fecha de Entrada: </strong> <fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy HH:mm:ss" /></p>
            <p><strong>Fecha de Salida: </strong> <fmt:formatDate value="${todo.salidaVehiculo}" pattern="dd/MM/yyyy HH:mm:ss" /></p>
            <p><strong>Precio: </strong> $${todo.precio}</p>
            <p><strong>Descripción: </strong> ${todo.description}</p>
            <p><strong>Tipo de vehiculo: </strong>${todo.tipoVehiculo}</p>
        </div>
    </div>
    <!-- Botones para eliminar y volver -->
    <a type="button" class="btn btn-danger mt-3" href="javascript:confirmDelete(${todo.id})">Eliminar</a>
    <a href="/list-todos" class="btn btn-primary mt-3">Volver a la Lista</a>
</div>

<script src="js/cobro.js" charset="UTF-8"></script>

<%@ include file="common/footer.jsp"%>