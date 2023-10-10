<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운임 요금 조회</title>

<!-- 커스텀 css -->
<link href="./resources/css/charge.css" rel="stylesheet">

</head>
<body>
	<div>
		<table>
				<td id="traininfo_td">열차 정보 : ${charge.tnumber} <strong>${charge.start}</strong> <strong>-></strong> <strong>${charge.arrive}</strong></td>
			</table>
		<table>
			<caption></caption>
			<thead>
				<tr>
					<th rowspan="2" colspan="2">구분</th>
					<th colspan="3">특실</th>
					<th colspan="3">일반실</th>
					<th colspan="3">입석</th>
					<th colspan="3">자유석</th>
				</tr>
				<tr>
					<th>어른</th>
					<th>어린이</th>
					<th>경로</th>
					<th>어른</th>
					<th>어린이</th>
					<th>경로</th>
					<th>어른</th>
					<th>어린이</th>
					<th>경로</th>
					<th>어른</th>
					<th>어린이</th>
					<th>경로</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">가격</td>
					<td>83,700</td>
					<td>53,800</td>
					<td>83,700</td>
					<td>59,800</td>
					<td>29,900</td>
					<td>59,800</td>
					<td>50,800</td>
					<td>25,400</td>
					<td>50,800</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>