<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Projekt</title>

    <script type="text/javascript" src="javascript/atmosphere.js"></script>
    <!-- Application -->
    <script type="text/javascript" src="javascript/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="javascript/application.js"></script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <style>
    #content {padding: 5px; background: #ddd; border-radius: 5px; border: 1px solid #CCC; margin-top: 10px;}
    #header {padding: 5px; background: #f5deb3; border-radius: 5px; margin-top: 10px;}
    #input {border-radius: 2px; margin-top: 10px; padding: 5px; width: 400px;}
    #status {width: 35%; display: block; float: left; margin-top: 15px;     text-align: right;}
    </style>
    
</head>
<body>
	<center>
		<h1>Edycja projektu</h1>
		<h2><a href="ProjektList">Wróć do listy</a></h2>
	</center>
	<div align="center">
	<form method="POST" action="ProjectController?action=processedit">
		<table border="1" cellpadding="5">
			
			<tr>
				<th>ID:</th>
				<td>${projekt.projectId }<input type="hidden" name="id" size="45" value="${projekt.projectId}"/>
				</td>
			</tr>
			<tr>
				<th>Nazwa projektu:</th>
				<td><input type="text" name="nazwa" size="45" value="${projekt.name}"/>
				</td>
			</tr>
			<tr>
				<th>Opis projektu:</th>
				<td><input type="text" name="opis" size="45" value="${projekt.description}"/></td>
			</tr>
			<tr>
				<th>Data utworzenia:</th>
				<td>${projekt.creationDate}<input type="hidden" type="text" name="data_utworzenia" size="45" value="${projekt.creationDate}" placeholder="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
				<th>Data oddania:</th>
				<td><input type="text" name="data_obrony" size="45" value="${projekt.returnDate}" placeholder="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="Dodaj" />
				</td>
			</tr>
		</table>
		</form>
	</div>
	
			<div class="col-md-12">
				<div id="header"><h3>Atmosphere Chat. Default transport is WebSocket, fallback is long-polling</h3></div>
				<div id="content"></div>
				<div >
				    <span id="status">Connecting...</span>
				    <input type="text" id="input" disabled="disabled"/>
				</div>
			</div>
</body>
</html>