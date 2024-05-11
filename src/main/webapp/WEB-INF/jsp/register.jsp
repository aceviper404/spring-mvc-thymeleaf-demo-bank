<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/default.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa" rel="stylesheet">
    <title>Register</title>
</head>
<body class="d-flex align-items-center justify-content-center">

    <!-- Card: Registration Form card -->
    <div class="card registration-form-card col-6 bg-transparent border-0">
        <!-- Card body -->
        <div class="card-body">
            <!-- Form Header -->
            <h1 class="form-header card-title mb-3">
                <i class="fa fa-edit"></i> Register
            </h1>
            <!-- End of Form Header -->
            
            <!-- Display Message -->
            <c:if test="${requestScope.passwordMismatch != null }">
            	<div class="alert alert-danger text-center border border-danger">
            		<b>${requestScope.passwordMismatch}</b>
            	</div>
            </c:if>
            <c:if test="${requestScope.success != null }">
            	<div class="alert alert-success text-center border border-success">
            		<b>${requestScope.success}</b>
            	</div>
            </c:if>
            <!-- End of Display Message -->

            <!-- Registration Form -->
            <form:form action="/register" class="reg-form" modelAttribute="registerUser">
                <!-- Row -->
                <div class="row">
                    <!-- Form Group -->
                    <div class="form-group col">
                        <form:input type="text" path="first_name" id="first_name" class="form-control form-control-lg" placeholder="Enter First Name"/>
                        <form:errors path="first_name" class="text-white bg-danger"/>
                        </div>
                    <!-- End of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group col">
                        <form:input type="text" path="last_name" id="last_name" class="form-control form-control-lg" placeholder="Enter Last Name"/>
                        <form:errors path="last_name" class="text-white bg-danger"/>
                        </div>
                    <!-- End of Form Group -->
                </div>
                <!-- End of Row -->

                <!-- Form Group -->
                <div class="form-group col">
                    <form:input type="email" path="email" id="email" class="form-control form-control-lg" placeholder="Enter Email"/>
                    <form:errors path="email" class="text-white bg-danger"/>
                    </div>
                <!-- End of Form Group -->

                <!-- Row -->
                <div class="row">
                    <!-- Form Group -->
                    <div class="form-group col">
                        <form:input type="password" path="password" id="password" class="form-control form-control-lg" placeholder="Enter Password"/>
                        <form:errors path="password" class="text-white bg-danger"/>
                        </div>
                    <!-- End of Form Group -->

                    <!-- Form Group -->
                    <div class="form-group col">
                        <input type="password" name="confirm_password" id="confirm_password" class="form-control form-control-lg" placeholder="Confirm Password">
                        <small class="text-white bg-danger">${confirm_password}</small>
                        </div>
                    <!-- End of Form Group -->
                </div>
                <!-- End of Row -->

                 <!-- Form Group -->
                 <div class="form-group col">
                    <button class="btn btn-lg">Register</button>
                    </div>
                <!-- End of Form Group -->

            </form:form>
            <!-- End of Registration Form -->

            <!-- Card Text -->
            <p class="card-text text-white my-2">
                Already have an account? <span class="ms-2"><a href="/login" class="btn btn-sm text-warning">Sign In</a></span>
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
    <!-- End of Card: Registration Form card -->
    
</body>
</html>