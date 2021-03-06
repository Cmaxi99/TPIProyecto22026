<%@page import="Clases.SociosDAO"  %>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"%>  


<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="ISO-8859-1">
<title>Modificar Socio</title>
<link rel = "icon" href="./img/logo.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web&display=swap" rel="stylesheet">
<link rel = "stylesheet" href="./css/modificarEstilos.css">
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
		<h1 class="text-center">Modificar Socio</h1>

		<div class="row" >
				<%
				String id=request.getParameter("id");
				int mid;
				mid=Integer.parseInt(id);				
				Socios resultado=null;
				SociosDAO  socio=new SociosDAO();
				resultado=socio.mostrarSocio(mid);				
				%>
		
		<form name = "actualizar" class="p-5" action="SociosController?accion=actualizar" method="post">
			
			<div class="mb-3">				
				<input type="hidden"  class="form-control" id="id" name="id"  value=<%=resultado.getId_socio() %> >
			</div>
			
			
			<div class="mb-3">
				<label for="nombre" class="form-label" >Nombre:</label>
				<input type="text" class="form-control" id="nombre" name="nombre"  value=<%=resultado.getNombre() %> required>
			</div>
			
			<div class="mb-3">
				<label for="apellido" class="form-label" >Apellido:</label>
				<input type="text" class="form-control" id="apellido" name="apellido" value=<%=resultado.getApellido() %> required>
			</div>
			
			<div class="mb-3">
				<label for="dni" class="form-label" >DNI:</label>
				<input type="number" class="form-control" id="dni" name="dni" value=<%=resultado.getDni() %> required>
			</div>
			
			<div class="mb-3">
				<label for="mail" class="form-label" >Mail:</label>
				<input type="email" class="form-control" id="mail" name="mail" value=<%=resultado.getMail() %> required>
			</div>
			
			<div class="form-check form-switch mt-3 d-flex">
				<div>
					<label for="estado" class="form-check-label" >Estado:</label>
					<input class="form-check-input" type="checkbox" role="switch" id="estado" value="0" name="estado"  onclick="valor()" <%=resultado.getEstado() == 1?"checked":" " %>>
				</div>
				<p class="mx-2 text-white" id="ValorSegunCheck"></p>
				<script>
					var checkbox = document.getElementById("estado");
					
					function checkboxValor(){
						checkbox.checked ? checkbox.value="1":"";
					}
					
					if(document.getElementById("estado").checked){
						document.getElementById("ValorSegunCheck").innerHTML = 'Activo';
					}
					else{
						document.getElementById("ValorSegunCheck").innerHTML = 'Inactivo';
					}
					function valor(){
						if(document.getElementById("estado").checked){
							document.getElementById("ValorSegunCheck").innerHTML = 'Activo';
						}
						else{
							document.getElementById("ValorSegunCheck").innerHTML = 'Inactivo';
						}
					}
			
				</script>
			</div>
			
			<button type="submit" class="btn btn-primary mt-2" onclick="checkboxValor()">Modificar</button>
			
			
			
			</form>
		
		
		
		
		</div>	
	
	
	</div>

</body>
</html>