<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<a type="button" class="btn btn-primary btn-md" href="/add-todo">Adicionar
				Usuario</a>
		</div>
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
						<th width="15%">Nombre</th>
						<th width="15%">Placa</th>

						<th width="20%">Fecha y Hora</th>
						<th width="15%">Tipo de Veh�culo</th>
						<!-- Nueva columna -->
						<th width="15%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${todos}" var="todo">
						<tr>
							<td>${todo.nombre}</td>
							<td>${todo.placa}</td>

							<td><fmt:formatDate value="${todo.targetDate}"
									pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td><c:choose>
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
								</c:choose></td>
								
							<td><a type="button" class="btn btn-success"
								href="/update-todo?id=${todo.id}">Cobrar</a></td>
								
								
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>
	</div>
</div>


<script src="js/list-todo.js" charset="UTF-8"></script>

<%@ include file="common/footer.jsp"%>