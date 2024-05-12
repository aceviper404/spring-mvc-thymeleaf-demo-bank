<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
  
  <!-- Container: No Accounts -->
  <div class="container">
    <!-- Card: No Accounts -->
    <div class="card no-account-card">
      <!-- Card Body -->
      <div class="card-body">
        <!-- Card Title -->
        <h1 class="card-title">
          <i class="fas fa-ban text-danger"></i> NO Registered Accounts
        </h1>
        <!-- End of Card Title -->

        <!-- Card Text -->
        <div class="card-text">
          You currently do not have any registered accounts. <br>
          Please click below to register / add a new account.
        </div>
        <!-- End of Card Text -->

        <br>
        <button class="btn btn-primary shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
          aria-controls="offcanvasRight">
          <i class="fa fa-credit-card me-2"></i>Add New Account
        </button>

      </div>
      <!-- End of Card Body -->

    </div>
    <!-- End of Card: No Accounts -->
  </div>
  <!-- End of Container: No Accounts -->