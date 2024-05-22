<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>

<div class="container">
	<div>
		<a type="button" class="btn btn-primary btn-md" href="/add-todo" id="agregarUser">Agregar vehiculo</a>
	</div>
	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 style="margin-bottom: 20px">Lista de Vehiculos</h3>
		</div>
		<div class="panel-body">
			<table class="table table-dark table-bordered table-striped">
				<thead>
					<tr>
						<th width="10%">Nombre de usuario</th>
						<th width="10%">Fecha Entrada</th>
						<th width="10%">Usuario encargado</th>
						<th width="10%">Placa de vehiculo</th>
						<th width="10%">Tipo de vehiculo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${todos}" var="todo">
						<tr>
							<td>${todo.description}</td>
							<td><fmt:formatDate value="${todo.targetDate}"
									pattern="dd/MM/yyyy" /></td>
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
<script src="common/list-todos.js" type="text/javascript"></script>
<%@ include file="common/footer.jsp"%>