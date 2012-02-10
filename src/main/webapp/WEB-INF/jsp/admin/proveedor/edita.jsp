<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="proveedor.nuevo.label" /></title>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top" role="navigation">
            <ul class="nav">
                <li><a href="<c:url value='/inicio' />"><s:message code="inicio.label" /></a></li>
                <li><a href="<c:url value='/contabilidad' />"><s:message code="contabilidad.label" /></a></li>
                <li><a href="<c:url value='/inventario' />"><s:message code="inventario.label" /></a></li>
                <li class="active"><a href="<c:url value='/admin' />"><s:message code="admin.label" /></a></li>
            </ul>
        </nav>

        <header class="subhead" id="admin">
            <ul class="nav nav-pills">
                <li><a href="<s:url value='/admin/cliente'/>" ><s:message code="cliente.label" /></a></li>
                <li><a href="<s:url value='/admin/tipoCliente'/>" ><s:message code="tipoCliente.label" /></a></li>
                <li class="active"><a href="<s:url value='/admin/proveedor'/>" ><s:message code="proveedor.label" /></a></li>
                <li><a href="<s:url value='/admin/empresa'/>" ><s:message code="empresa.label" /></a></li>
                <li><a href="<s:url value='/admin/organizacion'/>" ><s:message code="organizacion.label" /></a></li>
                <li><a href="<s:url value='/admin/usuario'/>" ><s:message code="usuario.label" /></a></li>
            </ul>
        </header>

        <div id="nuevo-proveedor" class="content scaffold-list" role="main">
            <h1><s:message code="proveedor.nuevo.label" /></h1>
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/admin/proveedor'/>"><i class="icon-list icon-white"></i> <s:message code='proveedor.lista.label' /></a>
            </p>
            <form:form commandName="proveedor" action="crea" method="post">
                <form:hidden path="id" />
                <form:hidden path="version" />
                <form:errors path="*">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${messages}" var="message">
                            <p>${message}</p>
                        </c:forEach>
                    </div>
                </form:errors>

                <fieldset>
                    <div class="row-fluid">
                        <div class="span4">
                            <s:bind path="proveedor.nombre">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="nombre">
                                        <s:message code="nombre.label" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <form:input path="nombre" maxlength="128" required="true" cssClass="span10" />
                                    <form:errors path="nombre" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                        <div class="span4">
                            <s:bind path="proveedor.nombreCompleto">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="nombreCompleto">
                                        <s:message code="nombreCompleto.label" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <form:input path="nombreCompleto" maxlength="128" required="true" cssClass="span10" />
                                    <form:errors path="nombreCompleto" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span4">
                            <s:bind path="proveedor.rfc">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="rfc">
                                        <s:message code="rfc.label" />
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <form:input path="rfc" maxlength="13" required="true" cssClass="span10" />
                                    <form:errors path="rfc" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                        <div class="span4">
                            <s:bind path="proveedor.curp">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="curp">
                                        <s:message code="curp.label" />
                                    </label>
                                    <form:input path="curp" maxlength="18" cssClass="span10" />
                                    <form:errors path="curp" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span8">
                            <s:bind path="proveedor.direccion">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="direccion">
                                        <s:message code="direccion.label" />
                                    </label>
                                    <form:textarea path="direccion" required="true" cssClass="span11" cssStyle="height: 90px;" />
                                    <form:errors path="direccion" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span4">
                            <s:bind path="proveedor.telefono">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="telefono">
                                        <s:message code="telefono.label" />
                                    </label>
                                    <form:input path="telefono" maxlength="25" cssClass="span10" />
                                    <form:errors path="telefono" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                        <div class="span4">
                            <s:bind path="proveedor.fax">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="fax">
                                        <s:message code="fax.label" />
                                    </label>
                                    <form:input path="fax" maxlength="25" cssClass="span10" />
                                    <form:errors path="fax" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span4">
                            <s:bind path="proveedor.contacto">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="contacto">
                                        <s:message code="contacto.label" />
                                    </label>
                                    <form:input path="contacto" maxlength="64" cssClass="span10" />
                                    <form:errors path="contacto" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                        <div class="span4">
                            <s:bind path="proveedor.correo">
                                <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                                    <label for="correo">
                                        <s:message code="correo.label" />
                                    </label>
                                    <form:input path="correo" maxlength="128" cssClass="span10" />
                                    <form:errors path="correo" cssClass="alert alert-error" />
                                </div>
                            </s:bind>
                        </div>
                    </div>
                </fieldset>

                <p class="well" style="margin-top: 10px;">
                    <input type="submit" name="actualiza" class="btn btn-primary btn-large span2" value="<s:message code='actualizar.button'/>" id="crea" />
                </p>
            </form:form>
        </div>
        <content>
            <script>
                $(document).ready(function() {
                    $('input#nombre').focus();
                });
            </script>                    
        </content>
    </body>
</html>
