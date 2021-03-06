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
<title><spring:message code="movimientosNuevo"/></title>
</head>
<body>
<h1  class="page-header"><spring:message code="movimientosNuevo"/></h1>

<form:form  class="form-horizontal maxwid" id="formNuevo" method="POST" commandName="movimiento">
	<div class="form-group">
		<form:label class="control-label col-sm-2" path="gallineroId"><spring:message code="gallinero"/>:</form:label>
		<div class="col-sm-10">		
			<form:select class="form-control" style="width:auto;" id="gallineroId" path="gallineroId" required="required">
				<form:option value=""><spring:message code="seleccioneGallinero"/></form:option>
				<c:forEach items="${listaGallineros}" var="gallineroVar">
					<form:option value="${gallineroVar.getId()}">
						<c:out value="${gallineroVar.getNombre()}"></c:out>
					</form:option>
				</c:forEach>
			</form:select>
		</div>
	</div>			
	<div class="form-group">
		<form:label class="control-label col-sm-2" path="depositoId"><spring:message code="deposito"/>:</form:label>
		<div class="col-sm-10">		
			<form:select class="form-control" style="width:auto;" id="depositoId" path="depositoId" required="required">
				<form:option value=""><spring:message code="seleccioneDeposito"/></form:option>
				<c:forEach items="${listaDepositos}" var="depositoVar">
					<form:option value="${depositoVar.getId()}">
						<c:out value="${depositoVar.getNombre()}"></c:out>
					</form:option>
				</c:forEach>
			</form:select>
		</div>
	</div>		
	<div class="form-group">
		<form:label class="control-label col-sm-2" path="cantidad"><spring:message code="cantidad"/>:</form:label>
		<div class="col-sm-10">
			<form:input class="form-control" id="cantidad" path="cantidad" required="required"/>
		</div>
	</div>		
	<div class="form-group">
		<form:label class="control-label col-sm-2" path="fecha"><spring:message code="fecha"/>:</form:label>
		<div class="col-sm-10">
			<form:input class="form-control" id="fecha" path="fecha" type="date" required="required"/>
		</div>
	</div>	 	
</form:form>

<c:set var="mensajeErrorMovimientoDeposito">
	<spring:message code="mensajeErrorMovimientoDeposito" />
</c:set>

<c:set var="mensajeErrorCantidadVacia">
	<spring:message code="mensajeErrorCantidadVacia" />
</c:set>

<c:set var="mensajeErrorCantidadNegativa">
	<spring:message code="mensajeErrorCantidadNegativa" />
</c:set>

<c:set var="mensajeErrorFechaVacia">
	<spring:message code="mensajeErrorFechaVacia" />
</c:set>

<c:set var="mensajeErrorGallineroId">
	<spring:message code="mensajeErrorGallineroId" />
</c:set>

<c:set var="mensajeErrorDepositoId">
	<spring:message code="mensajeErrorDepositoId" />
</c:set>

<div id="errores" class="alert alert-warning fade in" style="display:none;"></div>

<form:form id="formAtras" action="atras" method="post">
	<input id="url" type="hidden" name="url" />
</form:form>

<div class="form-group">
    <div >
		<input id="botonAtras" class="btn btn-default" type="button" value=<spring:message code="atras"/> />
		<input id="botonNuevo" class="btn btn-default" type="button" value=<spring:message code="guardar"/> />
	</div>
</div>

<div class="wait"></div>

<script>

$(document).on({
    ajaxStart: function() {$("body").addClass("loading");},
	ajaxStop: function() {$("body").removeClass("loading");},
	ready: function() {$("#errores").style.display("none");}
	});

var mensajesError = {
		mensajeErrorMovimientoDeposito: "${mensajeErrorMovimientoDeposito}",
		mensajeErrorCantidadVacia: "${mensajeErrorCantidadVacia}",
		mensajeErrorCantidadNegativa: "${mensajeErrorCantidadNegativa}",
		mensajeErrorFechaVacia: "${mensajeErrorFechaVacia}",
		mensajeErrorGallineroId: "${mensajeErrorGallineroId}",
		mensajeErrorDepositoId: "${mensajeErrorDepositoId}"
	};

	$('#botonNuevo').on('click', function (e) {
		e.preventDefault();
		var json = {
				"gallineroId" : document.getElementById("gallineroId").value,
				"depositoId" : document.getElementById("depositoId").value,
				"cantidad" : document.getElementById("cantidad").value,
				"fecha" : document.getElementById("fecha").value
			};
		$.ajax({
			url : "movimientosNuevoJson",
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
				document.getElementById("errores").style.display = "block";
			},
			error: function(){
				window.location = "movimientos";
			}
		});
	});

	$('#botonAtras').on('click', function(e) {
		e.preventDefault();
		var url = document.URL;
		document.getElementById("url").value = url;
		document.getElementById("formAtras").submit();
	});
	
</script>

</body>
</html>