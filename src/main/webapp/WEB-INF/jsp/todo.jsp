<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading mb-2 fs-2">Adicionar Usuario</div>
                <div class="panel-body">
                    <form:form id="vehicleForm" method="post" modelAttribute="todo" onsubmit="return validateForm()">
                        <form:hidden path="id" />

                        <fieldset class="form-group">
                            <form:label path="nombre">Nombre</form:label>
                            <form:input path="nombre" type="text" class="form-control" required="required" />
                            <form:errors path="nombre" cssClass="text-warning" />
                        </fieldset>

                        <fieldset class="form-group">
                            <form:label path="placa">Placa</form:label>
                            <form:input path="placa" type="text" id="placa" name="placa" class="form-control" required="true" />
                            <form:errors path="placa" cssClass="text-warning" />
                        </fieldset>
                        <fieldset class="form-group">
                            <form:label path="telefono">Numero de Celular</form:label>
                            <form:input path="telefono" max="9999999999" type="number" id="telefono" name="telefono" class="form-control" required="true" />
                            <form:errors path="telefono" cssClass="text-warning" />
                        </fieldset>

                        <fieldset class="form-group">
                            <form:label path="description">Descripción</form:label>
                            <form:input path="description" type="text" class="form-control" />
                            <form:errors path="description" cssClass="text-warning" />
                        </fieldset>

                        <div class="row mt-4 mb-3">
                            <div class="col-sm-4">
                                <fieldset class="form-group">
                                    <form:label path="motocicleta">Motocicleta</form:label>
                                    <form:checkbox path="motocicleta" class="vehicle-checkbox" />
                                    <form:errors path="motocicleta" cssClass="text-warning" />
                                </fieldset>
                            </div>
                            <div class="col-sm-4">
                                <fieldset class="form-group">
                                    <form:label path="carro">Carro</form:label>
                                    <form:checkbox path="carro" class="vehicle-checkbox" />
                                    <form:errors path="carro" cssClass="text-warning" />
                                </fieldset>
                            </div>
                            <div class="col-sm-4">
                                <fieldset class="form-group">
                                    <form:label path="carroPesado">Carro Pesado</form:label>
                                    <form:checkbox path="carroPesado" class="vehicle-checkbox" />
                                    <form:errors path="carroPesado" cssClass="text-warning" />
                                </fieldset>
                            </div>
                        </div>

                        <div class="text-danger" id="formError"></div>

                        <button type="submit" class="btn btn-success mt-3">Guardar</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/todo.js" charset="UTF-8"></script>

<%@ include file="common/footer.jsp"%>