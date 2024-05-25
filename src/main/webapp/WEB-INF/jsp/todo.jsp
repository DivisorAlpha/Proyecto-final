<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading">Adicionar Usuario</div>
				<div class="panel-body">
					<form:form method="post" modelAttribute="todo">
						<form:hidden path="id" />
						
						<fieldset class="form-group">
			                <form:label path="userName">Usuario</form:label>
			                <form:input path="userName" type="text" class="form-control" required="required" />
			                <form:errors path="userName" cssClass="text-warning" />
			            </fieldset>
			
						
						<fieldset class="form-group">
						<form:label path="cantidadVehiculos">Cantidad de vehiculos</form:label>
						<form:input path="cantidadVehiculos" type="number" id="cantidadVehiculos" name="cantidadVehiculos" class="form-control"  Required="true" />
						<form:errors path="cantidadVehiculos" cssClass="text-warning" />
						</fieldset>
						
						<fieldset class="form-group">
							<form:label path="description">Descripción</form:label>
							<form:input path="description" type="text" class="form-control"/>
							<form:errors path="description" cssClass="text-warning" />
						</fieldset>


						<button type="submit" class="btn btn-success">Guardar</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="common/footer.jsp"%>