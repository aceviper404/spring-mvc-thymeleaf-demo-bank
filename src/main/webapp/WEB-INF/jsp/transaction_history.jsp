<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transaction History</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa"
	rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../js/bootstrap.bundle.js"></script>
</head>

<body>

	<c:import url="components/incl/header.jsp" />

	<div class="container">
		<div class="card">
			<div class="card-body">
				<table class="table text-center table-striped">
					<tr>
						<th>Transaction ID</th>
						<th>Account ID</th>
						<th>User ID</th>
						<th>Transaction Type</th>
						<th>Amount</th>
						<th>Source</th>
						<th>Status</th>
						<th>Reason Code</th>
						<th>Created At</th>
					</tr>

					<c:if test="${requestScope.transactHistorylist!=null}">
						<c:forEach items="${requestScope.transactHistorylist}"
							var="transactHistory">
							<tr>
								<td>${transactHistory.transaction_id }</td>
								<td>${transactHistory.account_id }</td>
								<td>${transactHistory.user_id }</td>
								<td>${transactHistory.transaction_type }</td>
								<td>${transactHistory.amount }</td>
								<td>${transactHistory.source }</td>
								<td>${transactHistory.status }</td>
								<td>${transactHistory.reason_code }</td>
								<td>${transactHistory.created_at }</td>
							</tr>
						</c:forEach>
					</c:if>

				</table>
			</div>
		</div>
	</div>

	<c:import url="components/incl/footer.jsp" />

</body>
<script src="https://kit.fontawesome.com/ea433ece58.js"
	crossorigin="anonymous"></script>
<script src="../js/main.js"></script>

</html>