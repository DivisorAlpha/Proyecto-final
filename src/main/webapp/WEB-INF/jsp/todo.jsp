<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading fs-1">Agregar Vehiculo</div>
				<div class="panel-body">
					<form:form method="post" modelAttribute="todo">
						<form:hidden path="id" />
						<fieldset class="form-group">
							<form:label path="usuario" class="fs-3">Usuario</form:label>
							<form:input path="usuario" type="text" class="form-control"
								required="required" />
							<form:errors path="usuario" cssClass="text-warning" />
						</fieldset>
						<label>
					        <input type="checkbox" id="toggleCheckbox"> Activar inputs
					    </label>
					    <div id="inputs">
					        <label for="input1">Input 1:</label>
					        <input type="text" id="input1"><br><br>
					        <label for="input2">Input 2:</label>
					        <input type="text" id="input2">
					    </div>
						<button type="submit" class="btn btn-success">Guardar</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
        document.getElementById('toggleCheckbox').addEventListener('change', function() {
            const inputsDiv = document.getElementById('inputs');
            if (this.checked) {
                inputsDiv.style.display = 'block';
            } else {
                inputsDiv.style.display = 'none';
            }
        });
    </script>
<%@ include file="common/footer.jsp"%>