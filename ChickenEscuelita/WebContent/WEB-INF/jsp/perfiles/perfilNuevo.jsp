<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title><spring:message code="perfilNuevo" /></title>
<style>
.error {
	color: #ff0000;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>
		<spring:message code="perfilNuevo" />
	</h1>

	<form:form id="formCrear" method="POST" action="perfilesProcesarNuevo">
	<spring:message code="nombre" /> <input name="nombre" type="text"/>
	<table>
		<thead>
			<tr>
				<th></th>
				<c:forEach items="${listaOperaciones}" var="operacion">
					<th>${operacion.getNombre()}</th>
				</c:forEach>
			</tr>
		</thead>
	
		<c:forEach items="${listaModulos}" var="modulo">
			<tr>
				<td>${modulo.getNombre()}</td>
				<c:forEach items="${listaOperaciones}" var="operacion">
					<c:forEach items="${tablaPermisos}" var="permiso">
						<c:if test="${permiso.getNombreModulo().equalsIgnoreCase(modulo.getNombre()) 
										&& permiso.getNombreOperacion().equalsIgnoreCase(operacion.getNombre())}">
							<c:set var="idPermiso" value="${permiso.getId()}"/>
						</c:if>					
					</c:forEach>				
					<c:choose>
						<c:when test="${((modulo.nombre == 'ventas' || modulo.nombre == 'movimientos') &&
								(operacion.nombre != 'Crear' && operacion.nombre != 'Listar')) || 
								(modulo.nombre == 'produccion' && operacion.nombre != 'Listar')}">
							<td><input id="${idPermiso}" name="${idPermiso}" type="checkbox"  disabled/></td>		
						</c:when>
						<c:otherwise>
							<td><input id="${idPermiso}" name="${idPermiso}" type="checkbox"/></td>					
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
		</c:forEach>

	</table>
	<input id="botonGuardar" type="button" value="Crear"/>
	</form:form>
	
	<script>
	$('#botonGuardar').on('click', function (e) {
		e.preventDefault();
	    $('#formCrear').submit();
	});
	</script>
	
</body>
</html>