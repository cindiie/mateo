<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<nav class="navbar navbar-fixed-top" role="navigation">
    <ul class="nav">
        <li><a href="<c:url value='/inicio' />"><s:message code="inicio.label" /></a></li>
        <li<c:if test="${param.menu eq 'principal'}"> class="active"</c:if>><a href="<c:url value='/rh' />"><s:message code="rh.label" /></a></li>
        <li<c:if test="${param.menu eq 'empleado'}"> class="active"</c:if>><a href="<s:url value='/rh/empleado'/>" ><s:message code="empleado.label" /></a></li>
        <li<c:if test="${param.menu eq 'concepto'}"> class="active"</c:if>><a href="<s:url value='/rh/concepto'/>" ><s:message code="concepto.label" /></a></li>
    </ul>
</nav>
    
