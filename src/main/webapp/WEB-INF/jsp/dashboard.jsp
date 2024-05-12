<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Comfortaa" rel="stylesheet">
  <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
  <link rel="stylesheet" href="../css/main.css">
  <script src="../js/bootstrap.bundle.js"></script>
</head>

<body>

	<c:import url="components/incl/header.jsp"/>
	
	<!-- Transact OffCanvas: Pulls from teh left -->
	<c:import url="components/transact_offcanvas.jsp"/>
	
	<!-- Add Account OffCanvas: Pulls from teh right -->
	<c:import url="components/add_account_offcanvas.jsp"/>

	<div class="container">
		<!-- Display Message -->
		<c:if test="${success != null }">
			<div class="alert alert-success text-center border border-success">
				<b>${success}</b>
			</div>
		</c:if>
		<!-- End of Display Message -->
		
			<!-- Display Message -->
		<c:if test="${error != null }">
			<div class="alert alert-danger text-center border border-danger">
				<b>${error}</b>
			</div>
		</c:if>
		<!-- End of Display Message -->
	</div>

	<c:choose>
		<c:when test="${fn:length(accounts) > 0 }">
			<c:import url="components/accounts_display.jsp"/>
		</c:when>
		<c:otherwise>
			<c:import url="components/no_accounts_display.jsp"/>
		</c:otherwise>
	</c:choose>

	<c:import url="components/incl/footer.jsp"/>
</body>
<script src="https://kit.fontawesome.com/ea433ece58.js" crossorigin="anonymous"></script>
<script src="../js/main.js"></script>

</html>