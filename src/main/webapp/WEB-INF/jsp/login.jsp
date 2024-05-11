<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa" rel="stylesheet">
    <title>Login</title>
</head>
<body class="d-flex align-items-center justify-content-center">

    <!-- Card: Login Form card -->
    <div class="card login-form-card col-4 bg-transparent border-0">
        <!-- Card body -->
        <div class="card-body">
            <!-- Form Header -->
            <h1 class="form-header card-title mb-3">
                <i class="fas fa-user-circle"></i> Login
            </h1>
            <!-- End of Form Header -->
            
            <!-- Display Message -->
            <c:if test="${requestScope.success != null }">
            	<div class="alert alert-success text-center border border-success">
            		<b>${requestScope.success}</b>
            	</div>
            </c:if>
            <!-- End of Display Message -->
            
            <!-- Display Message -->
            <c:if test="${requestScope.error != null }">
            	<div class="alert alert-danger text-center border border-danger">
            		<b>${requestScope.error}</b>
            	</div>
            </c:if>
            <!-- End of Display Message -->
            
            <!-- Display Message -->
            <c:if test="${requestScope.log_out != null }">
            	<div class="alert alert-success text-center border border-success">
            		<b>${requestScope.log_out}</b>
            	</div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Login Form -->
            <form action="/login" method="POST" class="login-form">

                 <!-- Form Group -->
                 <div class="form-group col">
                     <input type="email" name="email" id="email" class="form-control form-control-lg" placeholder="Enter Email">
                     </div>
                 <!-- End of Form Group -->
                 <!-- Form Group -->
                 <div class="form-group col">
                     <input type="password" name="password" id="password" class="form-control form-control-lg" placeholder="Enter Password">
                     </div>
                 <!-- End of Form Group -->
                 
				 <!-- Form Group -->
                 <div class="form-group col">
                     <input type="hidden" name="_token" value="${token }">
                     </div>
                 <!-- End of Form Group -->

                 <!-- Form Group -->
                 <div class="form-group col">
                    <button class="btn btn-lg">Login</button>
                    </div>
                <!-- End of Form Group -->

            </form>
            <!-- End of Login Form -->

            <!-- Card Text -->
            <p class="card-text text-white my-2">
                Don't have an account? <span class="ms-2"><a href="/register" class="btn btn-sm text-warning">Register</a></span>
            </p>
            <!-- End of Card Text -->

            <!-- Back Button to landing page -->
            <small class="text-warning">
                <i class="fa fa-arrow-circle-left me-2"></i> <a href="/" class="btn btn-sm text-warning">Back</a>
            </small>
            <!-- End of Back Button to landing page -->

        </div>
        <!-- End of Card body -->

    </div>
    <!-- End of Card: Login Form card -->
    
</body>
<script src="https://kit.fontawesome.com/ea433ece58.js" crossorigin="anonymous"></script>
</html>