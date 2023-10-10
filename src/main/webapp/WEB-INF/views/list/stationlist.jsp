<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>터미널조회</title>

<!-- 부트스트랩 링크 -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

<style>
	th, td {
		text-align: center;
	}
</style>
<script>
	function first() {
		window.open("/first", "_self");
	}
	function standard() {
		window.open("/standard", "_self");
	}
</script>

</head>
<body>
    <nav class="navbar navbar-expand  navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="./stationlist">Home</a>
            </div>
        </div>
    </nav> 
    
    <div class="jumbotron">  
        <div class="container">
            <h1 class="display-1"><spring:message code="stationlist.subtitle" /></h1>
        </div>
        
			<div class="float-right" style="padding-right: 30px">
				<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			</div>
    </div>
    
    <div class="container">
    <table class="table table-bordered">
    	<thead>
    		<tr>
    			<th scope="col"><spring:message code="stationlist.division" /></th>
	    		<th scope="col"><spring:message code="stationlist.tnubmer" /></th>
	    		<th scope="col"><spring:message code="stationlist.start" /></th>
	    		<th scope="col"><spring:message code="stationlist.arrvie" /></th>
	    		<th scope="col"><spring:message code="stationlist.fare" /></th>
	    		<th scope="col"><spring:message code="stationlist.time" /></th>
	    		<th scope="col"><spring:message code="stationlist.reservation" /></th>
    		</tr>
    	</thead>
    	<c:forEach items="${stationList}" var="station">
	    	<tobody>
	    		<tr>
	    			<th scope="row">${station.division}</th>
	    			<td >${station.tnumber}</td>
	    			<td >${station.start}</td>
	    			<td >${station.arrive}</td>
	    			<td>
	    				<p><a href="<c:url value="/charge?id=${station.tnumber}"/>" role="button" onclick="window.open(this.href, '/_blank', 'width=1200, height=200'); return false;">조회 &raquo;</a>
	    			</td>
	    			<td>${station.operatingtime}</td>
	    			<td>
	    				<p><a href="<c:url value="/reservation"/>" role="button" onclick="window.open(this.href); return false;">예약 &raquo;</a>
	    			</td>
	    		</tr>
	    	</tobody>
	    </c:forEach>
    </table>
</body>
</html>