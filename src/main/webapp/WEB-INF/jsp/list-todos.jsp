<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container mt-2">
	<div class="row">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
            <div class="col-md-6">
                <a type="button" class="btn btn-primary btn-md" href="${pageContext.request.contextPath}/add-todo">Nuevo Cliente</a>
            </div>
        </sec:authorize>
	</div>
	<div class="row my-3 justify-content-center">
            <div class="col-md-6">
                <form id="searchForm" action="${pageContext.request.contextPath}/search" method="get">
                    <div class="form-group mb-2">
                        <input type="text" class="form-control" id="search" name="search" placeholder="Buscar..." value="${search}">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary mb-2">Buscar</button>
                    </div>
                </form>
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
						<th width="15%">Tipo de Vehículo</th>
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
							<td>${todo.tipoVehiculo}</td>
							<td><a type="button" class="btn btn-success"
								href="/cobro?id=${todo.id}">Cobrar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</div>


<script src="js/list-todo.js" charset="UTF-8"></script>

<%@ include file="common/footer.jsp"%>