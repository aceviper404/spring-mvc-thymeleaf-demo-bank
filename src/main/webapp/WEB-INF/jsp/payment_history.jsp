<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment History</title>
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
					<tr class="table-active">
						<th>Account ID</th>
						<th>User ID</th>
						<th>Beneficiary</th>
						<th>Beneficiary Account Number</th>
						<th>Amount</th>
						<th>Status</th>
						<th>Reference</th>
						<th>Reason Code</th>
						<th>Created At</th>
					</tr>

					<c:if test="${requestScope.paymentHistorylist!=null}">
						<c:forEach items="${requestScope.paymentHistorylist}"
							var="paymentHistory">
							<tr>
								<td>${paymentHistory.account_id }</td>
								<td>${paymentHistory.user_id }</td>
								<td>${paymentHistory.beneficiary }</td>
								<td>${paymentHistory.beneficiary_acc_number }</td>
								<td>${paymentHistory.amount }</td>
								<td>${paymentHistory.status }</td>
								<td>${paymentHistory.reference_no }</td>
								<td>${paymentHistory.reason_code }</td>
								<td>${paymentHistory.created_at }</td>
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