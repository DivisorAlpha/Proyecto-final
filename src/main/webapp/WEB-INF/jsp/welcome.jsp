<%@ include file="common/header.jsp"%>
<%@ include file="common/navigation.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="carouselExampleIndicators" class="carousel slide mt-2" data-bs-ride="carousel" style="max-height: 500px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/img-01.jpg" class="d-block w-100" alt="Imagen de carros" style="object-fit: cover; height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="images/img-02.jpg" class="d-block w-100" alt="logo del parqueadero" style="object-fit: cover; height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="images/img-03.jpg" class="d-block w-100" alt="Imagen de superman en boxer" style="object-fit: cover; height: 500px;">
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

<div class="container mt-5">
  <div class="row text-center">
    <div class="col-md-4 mb-4">
      <div class="card border-primary h-100">
        <div class="card-header bg-primary text-white">Horario</div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">Lunes a Viernes: 6:00am - 12:00am</li>
          <li class="list-group-item">Sábado: 6:00am - 6:00am</li>
          <li class="list-group-item">Domingo: Cerrado desde las 6:00am</li>
        </ul>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card border-secondary h-100">
        <div class="card-header bg-secondary text-white">Tarifas</div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">Primeras 2 horas: $2.000</li>
          <li class="list-group-item">Cada hora adicional: $1.000</li>
          <li class="list-group-item">Noches (6pm - 7am): $5.000</li>
        </ul>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card border-success h-100">
        <div class="card-header bg-success text-white">Servicios</div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">Valet parking</li>
          <li class="list-group-item">Carga y descarga de equipaje</li>
          <li class="list-group-item">Servicio de lavado de autos</li>
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="container mt-5">
  <div class="card">
    <div class="card-body">
      <h4 class="card-title text-center fs-2">Nuestro Servicio cuenta con...</h4>
      <p class="card-text text-center">Nuestro parqueadero ofrece un servicio seguro y confiable para todos nuestros clientes. Contamos con vigilancia las 24 horas, cámaras de seguridad y un personal atento para asistirlo en todo momento. Además, estamos ubicados en una zona estratégica cerca de las principales vías de la ciudad, lo que facilita el acceso y reduce su tiempo de desplazamiento. Visítenos y disfrute de una experiencia de parqueo sin preocupaciones.</p>
    </div>
  </div>
</div>


<%@ include file="common/footer.jsp"%>