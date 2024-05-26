<%@ include file="common/header.jsp"%>

<div class="container mt-5">
    <h1>Información del Usuario</h1>
    <div class="card">
        <div class="card-body">
            <p><strong>Nombre:</strong> ${todo.nombre}</p>
            <p><strong>Numero de Telefono:</strong> ${todo.telefono}</p>
            <p><strong>Fecha de Entrada:</strong> <fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy HH:mm:ss" /></p>
            <p><strong>Fecha de Salida:</strong> <fmt:formatDate value="${todo.salidaVehiculo}" pattern="dd/MM/yyyy HH:mm:ss" /></p>
            <p><strong>Precio:</strong> $${todo.precio}</p>
            <p><strong>Descripción:</strong> ${todo.description}</p>
            <p><strong>Tipo de vehiculo:</strong> 
                <c:choose>
                    <c:when test="${todo.motocicleta}">
                        Motocicleta
                    </c:when>
                    <c:when test="${todo.carro}">
                        Carro
                    </c:when>
                    <c:when test="${todo.carroPesado}">
                        Carro Pesado
                    </c:when>
                    <c:otherwise>
                        No especificado
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>

    <!-- Botón para seleccionar tipo de vehículo -->
    <c:choose>
        <c:when test="${empty todo.motocicleta && empty todo.carro && empty todo.carroPesado}">
            <button type="button" class="btn btn-secondary mt-3" data-toggle="modal" data-target="#tipoVehiculoModal">
                Seleccionar Tipo de Vehículo
            </button>

            <!-- Modal para seleccionar tipo de vehículo -->
            <div class="modal fade" id="tipoVehiculoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Seleccionar Tipo de Vehículo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/set-vehicle-type" method="post">
                                <input type="hidden" name="todoId" value="${todo.id}" />
                                <div class="form-group">
                                    <label for="tipoVehiculoSelect">Tipo de Vehículo:</label>
                                    <select class="form-control" id="tipoVehiculoSelect" name="tipoVehiculo">
                                        <option value="motocicleta">Motocicleta</option>
                                        <option value="carro">Carro</option>
                                        <option value="carroPesado">Carro Pesado</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Si ya se ha seleccionado el tipo de vehículo, no mostrar el botón -->
        </c:otherwise>
    </c:choose>

    <!-- Botones para eliminar y volver -->
    <a type="button" class="btn btn-danger mt-3" href="javascript:confirmDelete(${todo.id})">Eliminar</a>
    <a href="/list-todos" class="btn btn-primary mt-3">Volver a la Lista</a>
</div>



<%@ include file="common/footer.jsp"%>