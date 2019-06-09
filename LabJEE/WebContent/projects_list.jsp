<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista projektów</title>

    <!-- Atmosphere -->
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form action="ProjektList" method="POST">
					<center><h2>Wyszukaj</h2></center>
					<input name="project_id" type="number" placeholder="Id projektu"
						value="<%=request.getAttribute("pId")%>" /> <input
						name="project_name" type="text" placeholder="Nazwa projektu"
						value="<%=request.getAttribute("projectName") == null ? "" : request.getAttribute("projectName")%>" />
					Elementów na stronę: <select name="list_count">
						<option value="0"
							<c:if test="${requestScope.list_count eq 5}">selected</c:if>>5</option>
						<option value="1"
							<c:if test="${requestScope.list_count eq 10}">selected</c:if>>10</option>
						<option value="2"
							<c:if test="${requestScope.list_count eq 15}">selected</c:if>>15</option>
						<option value="3"
							<c:if test="${requestScope.list_count eq 20}">selected</c:if>>20</option>
					</select>
					<c:if test="${requestScope.page_number != 1}">
						<input name="prev" value="Back" type="submit">
					</c:if>
					<input name="page_number" type="hidden" value="<%=request.getAttribute("page_number")%>" /> 
					<input name="btn_list" value="Wyszukaj" type="submit" />
					<input name="next" value="Next" type="submit">
				</form>
			</div>
		</div>
		
 	<div class="row">
			<div class="col-md-12">
				<div id="header"><h3>Atmosphere Chat. Default transport is WebSocket, fallback is long-polling</h3></div>
				<div id="content"></div>
				<div >
				    <span id="status">Connecting...</span>
				    <input type="text" id="input" disabled="disabled"/>
				</div>
			</div>
		</div> 
		<hr/>
		 <div class="row">
			<div class="col-md-12">
				<center><h2>Lista projektów</h2></center>
				<a href="project_form.jsp" style="text-align: right;"><h4>Dodaj projekt</h4></a>
			</div> 
			<div class="col-md-12">
				<table width="100%" border="1px solid #000">
					<thead>
						<tr  style="text-align: center;">
							<th>Lp.</th>
							<th>Id</th>
							<th>Nazwa</th>
							<th>Opis</th>
							<th>Utworzony</th>
							<th>Data obrony</th>
							<th>Edycja</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="projekt" items="${requestScope.projects}"
							varStatus="info">
							<tr  style="text-align: center;">
								<td>${info.count}.</td>
								<td><c:out value="${projekt.projectId}" /></td>
								<td><c:out value="${projekt.name}" /></td>
								<td><c:out value="${projekt.description}" /></td>
								<javatime:format value="${projekt.creationDate}"
									var="fmtDataczasUtworzenia" pattern="yyyy-MM-dd hh:mm:ss" />
								<td><c:out value="${fmtDataczasUtworzenia}" /></td>
								<javatime:format value="${projekt.returnDate}" var="fmtDataOddania"
									pattern="yyyy-MM-dd" />
								<td><c:out value="${fmtDataOddania}" /></td>
								<td style="text-align: center;"><a href="TasksList?id=${projekt.projectId}">Zadania</a></br> 
									<!-- <a href="room/${projekt.projectId}">Czat</a></br> -->
									<a href="ProjectController?action=edit&id=${projekt.projectId}">Edycja</a></br>
									<a href="ProjectController?action=delete&id=${projekt.projectId}"
									onClick="return confirm('Na pewno chcesz usunąć projekt?')">Usuń</a></br>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>