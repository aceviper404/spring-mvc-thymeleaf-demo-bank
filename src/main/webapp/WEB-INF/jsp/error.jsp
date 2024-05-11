<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa" rel="stylesheet">
    <style>
        *{
            font-family: Comfortaa;
        }
        .card{
            box-shadow: 0px 3px 6px rgb(0, 1, 40);
        }
        body{
            height: 100vh;
            background-image: url('../images/main_bg.png');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }
        .card .card-text{
            font-size: 16px;
        }
    </style>
    <title>Error</title>
</head>
<body class="d-flex align-items-center justify-content-center">
    <!-- Card Error -->
    <div class="card col-4 alert alert-danger border border-danger text-danger">
        <!-- Card Title -->
        <h3 class="card-title">
            <i class="fa fa-window-close me-2"></i>Errors
            <hr>
        </h3>
        <!-- End of Card Title -->

        <!-- Card Body -->
        <div class="card-body">
            <!-- Card text -->
            <p class="card-text">
			            <!-- Display Message -->
            <c:if test="${requestScope.error != null }">
            	<div class="alert alert-danger text-center border border-danger">
            		<b>${requestScope.error}</b>
            	</div>
            </c:if>
            <!-- End of Display Message -->
            </p>
            <!-- End of Card text -->
            <hr>
            <!-- Back to login page -->
            <a href="/" class="btn btn-sm btn-outline-danger border-0">
                <i class="fa fa-arrow-circle-left me-2"></i> Back
            </a>
            <!-- End of Back to login page -->
            
        </div>
        <!-- End of Card Body -->

    </div>s
    <!-- End of Card Error -->
</body>
<script src="https://kit.fontawesome.com/ea433ece58.js" crossorigin="anonymous"></script>
</html>