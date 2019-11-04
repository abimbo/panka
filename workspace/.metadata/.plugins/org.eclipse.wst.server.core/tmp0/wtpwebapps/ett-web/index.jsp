<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"  
    xmlns:f="http://java.sun.com/jsf/core"  
    xmlns:p="http://primefaces.org/ui"
    xmlns:ui="http://java.sun.com/jsf/facelets">
    
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<ui:insert name="title">
		<title>ETTERMI-TANULO-PROJEKT</title>
	</ui:insert>
	

	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />
	
	<title>Panka tanul� projektje, amely �ttermi folyamatokat t�mogat</title>
</head>
	<h:body>
			<h1>Hello Panka ...!!!</h1>
			
			<div id="center" style="height: 300px; width: 50%; margin: auto;">
			<h:form id="form" name="form">
			    <p:dataTable id="prTable" 
			    	var="pr"
			    	value="#{prBean.prList}" 
			    	selectionMode="single" 
			    	rowKey="#{pr.id}"
	    			emptyMessage="Nincs adat">

			        <f:facet name="header">
			            Pr�ba lista
			        </f:facet>

			        <p:column headerText="Azonos�t�">
			        	<h:outputText value="#{pr.id}" />
			        </p:column>
			        <p:column headerText="Adat">
			        	<h:outputText value="#{pr.adat}" />
			        </p:column>
	    		</p:dataTable>
	    	</h:form>
	    	</div>
	</h:body>

</html>