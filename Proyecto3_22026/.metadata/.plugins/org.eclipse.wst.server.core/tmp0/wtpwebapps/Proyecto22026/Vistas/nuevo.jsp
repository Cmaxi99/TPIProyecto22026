<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="ISO-8859-1">
<title>Nuevo Socio</title>
<link rel = "icon" href="./img/logo.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel = "stylesheet" href="./css/nuevoEstilos.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web&display=swap" rel="stylesheet">
</head>
<body>
<header class="mb-3">
	<nav class="navbar">
  	<div class="container-fluid d-flex justify-content-center">
	    <a href="SociosController"><img src="https://fontmeme.com/permalink/220713/67431d712ee8634df6ca3644989f5dcd.png" alt="efecto-brillo" border="0"></a>
  	</div>
</nav>
</header>
	<div class="container">
		<h1 class="text-center" >A?adir Socio</h1>

		<div class="row" >
			<form class="p-5" action="SociosController?accion=insert" method="post">
			
			<div class="mb-3">
				<label for="nombre" class="form-label" >Nombre:</label>
				<input type="text" class="form-control" id="nombre" name="nombre" required>
			</div>
			
			<div class="mb-3">
				<label for="apellido" class="form-label" >Apellido:</label>
				<input type="text" class="form-control" id="apellido" name="apellido" required>
			</div>
			
			<div class="mb-3">
				<label for="dni" class="form-label" >DNI:</label>
				<input type="text" class="form-control" id="dni" name="dni" required>
			</div>
			
			<div class="mb-3">
				<label for="mail" class="form-label" >Mail:</label>
				<input type="email" class="form-control" id="mail" name="mail" required>
			</div>			
			
			
			<a href="SociosController?accion"><button type="submit" class="btn btn-primary">Insertar</button></a>
			
			
			
			</form>
		</div>	
	
	
	</div>

</body>
</html>