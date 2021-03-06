<%@page import="Clases.SociosDAO"  %>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"  %>

<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="ISO-8859-1">
<title>Socios del GYM</title>
<link rel = "icon" href="./img/logo.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel = "stylesheet" href="./css/sociosEstilos.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web&display=swap" rel="stylesheet">
</head>
<body class="container-fluid">
<header>
	<nav class="navbar">
	  	<div class="container-fluid d-flex justify-content-around">
		    <a class="navbar-brand d-flex align-items-center" href="SociosController">
		      <img src="./img/logo.png" alt="Logo" width="100" height="80" class="d-inline-block">
		    </a>
		    <a href="SociosController"><img src="https://fontmeme.com/permalink/220713/67431d712ee8634df6ca3644989f5dcd.png" alt="efecto-brillo" border="0"></a>
	  	</div>
	</nav>
</header>
<section class="main">
<header>
	<h2 class="text-center mb-5 mt-2">Listado de Socios del GYM</h2>
	<div class="container d-flex mt-2 mb-5">
		<div class="row d-flex justify-content-start">
			<form method="post" class="row" action="SociosController?accion" method="post">
				<fieldset class="d-flex justify-content-start p-0">
					<label class="me-2 fs-3" id="filtro" for="filtroEstados">Filtro:</label>
					<select class="border-0 ms-2 p-2" id="selectEstados" name="filtroEstado" id="filtroEstados">
						<option value="" disabled selected>Estados</option>
						<option value="-1">Todos</option>
						<option value="1">Activos</option>
						<option value="0">Inactivos</option>
					</select>
					<input type="submit" name="submit" id="enviarFiltroEstados" class="ms-2 border-0" value="Aplicar">
				</fieldset>
			</form>
		</div>		
	</div>
</header>
<section class="container-fluid h-100">
	<div  class="container h-100" >
			<div class="row h-100" >
					<table class="table table-primary h-100" >
					<thead>
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>DNI</th>			
							<th>Email</th>
							<th>Fecha y Hora</th>
							<th>Estado</th>						
							<th class="text-center">Modificar</th>
							<th class="text-center">Eliminar</th>
						<tr>				
					</thead>
					<%
						
						List<Socios> resultado=null;
						SociosDAO socio=new SociosDAO();
						resultado=socio.listarSocios();
						
							
							for(int i=0;i<resultado.size();i++)
							{
								
								
								if(request.getParameter("filtroEstado") == null || Integer.parseInt(request.getParameter("filtroEstado")) == -1 || resultado.get(i).getEstado() == Integer.parseInt(request.getParameter("filtroEstado")))
								{
									String ruta="SociosController?accion=modificar&id="+resultado.get(i).getId_socio();	
									String rutaE="SociosController?accion=eliminar&id="+resultado.get(i).getId_socio();
							
					%>			
					
									<tr>
									<td><%=resultado.get(i).getId_socio()%></td>				
									<td><%=resultado.get(i).getNombre() %></td>				
									<td><%=resultado.get(i).getApellido() %></td>
									<td><%=resultado.get(i).getDni()%></td>
									<td><%=resultado.get(i).getMail() %></td>
									<td><%=resultado.get(i).getFecha() %></td>
									<td><%=resultado.get(i).getEstadoNombre()%></td>	
									<td class="text-center"><a href=<%=ruta%>> <script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
									<lord-icon
									    src="https://cdn.lordicon.com/sihdhmit.json"
									    trigger="hover"
									    colors="primary:#121331"
									    style="width:25px;height:25px">
									</lord-icon>
									</a></td>
									<td class="text-center"><a onclick=cambia_enlace() id="eliminar" href=<%=rutaE%>> <script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
									<lord-icon
									    src="https://cdn.lordicon.com/dovoajyj.json"
									    trigger="hover"
									    style="width:25px;height:25px">
									</lord-icon> 
									</a></td>
									</tr>
					<% 				
								}
						}
					%>
				
					</table>
					<script>
										function cambia_enlace(){
											  var elemento = document.getElementById("eliminar");
											  if(confirm('Desea continuar?')){
												  
											  }
											  else{
												  elemento.href = "SociosController";
											  }
										}
					</script>
			</div>
	</div>
									
</section>
<footer>
	<div class="container mt-2 text-center">
		<a class="btn btn-primary col-4 m-4 border" href="SociosController?accion=nuevo">Agregar Socio</a>
	</div>	
</footer>
</section>

</body>
</html>