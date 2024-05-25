<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>

<div class="container">
	<div>
		<a type="button" class="btn btn-primary btn-md" href="/add-todo">Adicionar Usuario</a>
	</div>
	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3>Lista de Usuarios</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th width="20%">Usuario</th>
	                    <th width="20%">Fecha y Hora</th>
	                    <th width="20%">Cantidad de Vehículos</th>
	                    <th width="20%">Descripción</th>
                    	<th width="20%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${todos}" var="todo">
						<tr>
							<td>${todo.userName}</td>
							<td><fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td>${todo.cantidadVehiculos}</td>
							<td>${todo.description}</td>
							<td><a type="button" class="btn btn-success"
								href="/update-todo?id=${todo.id}">Actualizar</a>
							<a type="button" class="btn btn-warning"
								href="/delete-todo?id=${todo.id}">Eliminar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>

<%@ include file="common/footer.jsp"%>