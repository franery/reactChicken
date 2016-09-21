<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="depositoNuevo"/></title>
</head>
<body>

<h1 class="page-header"><spring:message code="depositoNuevo"/></h1>

<form:form class="form-horizontal maxwid" method="post" commandName="deposito">
	<div class="form-group">
		<form:label class="control-label col-sm-2" path="nombre"><spring:message code="nombre" text="Nombre"/>:</form:label>
	    <div class="col-sm-10">
			<form:input class="form-control" id="nombre" path="nombre" value="${deposito.getNombre()}" required="required"/>
		</div>
	</div>
	<div class="form-group">
		<form:label class="control-label col-sm-2" path="stockMaximo"><spring:message code="stockMaximo" text="Stock Maximo"/>:</form:label>
	    <div class="col-sm-10">
			<form:input class="form-control" id="stockMaximo" path="stockMaximo" value="${deposito.getStockMaximo()}" required="required"/>
		</div>
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
			<input id="botonNuevo" class="btn btn-default" type="button" value=<spring:message code="guardar"/> />
		</div>
	</div>
</form:form>

<c:set var="mensajeErrorNombreVacio">
	<spring:message code="mensajeErrorNombreVacio" />
</c:set>

<c:set var="mensajeErrorNombreUnico">
	<spring:message code="mensajeErrorNombreUnico" />
</c:set>

<c:set var="mensajeErrorStockMinimo">
	<spring:message code="mensajeErrorStockMinimo" />
</c:set>

<c:set var="mensajeErrorStockMaximoMenorActual">
	<spring:message code="mensajeErrorStockMaximoMenorActual" />
</c:set>

<p id="errores"></p>

<script>

var mensajesError = {
	mensajeErrorNombreVacio: "${mensajeErrorNombreVacio}",
	mensajeErrorNombreUnico: "${mensajeErrorNombreUnico}",
	mensajeErrorStockMinimo: "${mensajeErrorStockMinimo}",
	mensajeErrorStockMaximoMenorActual: "${mensajeErrorStockMaximoMenorActual}",
};

$('#botonNuevo').on('click', function (e) {
	e.preventDefault();
	var json = {
			"nombre" : document.getElementById("nombre").value,
			"stockMaximo" : document.getElementById("stockMaximo").value
		};
	$.ajax({
		url : "depositosNuevoJson",
		type : "POST",
		data : JSON.stringify(json),
		dataType : "json",
		contentType : "application/json",
		processData : false,
		success: function(errores){
			var mensaje = "";
			for(var i = 0; i < errores.length; i++) {
				mensaje += mensajesError[errores[i].code] + "<br>";
			}
			document.getElementById("errores").innerHTML = mensaje;
		},
		error: function(){
			window.location = "depositos";
		}
	});
});

</script>

</body>
</html>