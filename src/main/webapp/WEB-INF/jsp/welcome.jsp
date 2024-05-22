<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="max-height: 300px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/img-01.jpg" class="d-block w-100" alt="Imagen de carros" style="object-fit: cover; height: 400px;">
    </div>
    <div class="carousel-item">
      <img src="images/img-02.jpg" class="d-block w-100" alt="logo del parqueadero" style="object-fit: cover; height: 400px;">
    </div>
    <div class="carousel-item">
      <img src="images/img-03.jpg" class="d-block w-100" alt="Imagen de superman en boxer" style="object-fit: cover; height: 400px;">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<div class="contenedor mt-5" style="padding-top: 100px;
">
  <div class="row mx-auto">
    <div class="col-md-4">
      <div class="card border-primary mb-3" style="max-width: 18rem;">
        <div class="card-header">Horario</div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">Lunes a Viernes: 6:00am - 12:00pm</li>
          <li class="list-group-item">Sabado: 6:00am - 6:00am</li>
          <li class="list-group-item">Domingo: Cerrado desde las 6:00a.m.</li>
        </ul>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card border-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header">Tarifas</div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">Primeras 2 horas: $2.000</li>
          <li class="list-group-item">Cada hora adicional: $1.000</li>
          <li class="list-group-item">Noches (6pm - 7am): $5.000</li>
        </ul>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card border-success mb-3" style="max-width: 18rem;">
        <div class="card-header">Servicios</div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">Valet parking</li>
          <li class="list-group-item">Carga y descarga de equipaje</li>
          <li class="list-group-item">Servicio de lavado de autos</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<%@ include file="common/footer.jsp"%>