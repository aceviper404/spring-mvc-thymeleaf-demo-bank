<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>  
  
  <!-- Main Page Header -->
  <header class="main-page-header mb-3 bg-primary">
    <!-- Container -->
    <div class="container d-flex align-items-center">
      <!-- Company name -->
      <div class="company-name">
        Banking Demo App
      </div>
      <!-- End ofCompany name -->

      <!-- Navigation -->
      <div class="navigation">
        <li><a href="/app/dashboard">Dashboard</a></li>
        <li><a href="/app/payment_history">Payment History</a></li>
        <li><a href="/app/transaction_history">Transaction History</a></li>
      </div>
      <!-- EEnd if Navigation -->

      <!-- Display name -->
      <div class="display-name ms-auto text-white">
        <i class="fa fa-circle text-success me-2"></i> Welcome: <span>${user.first_name }</span>
      </div>
      <!-- End of Display name -->

      <!-- log out button -->
      <a href="/logout" class="btn btn-sm text-white ms-2">
        <i class="fa fa-sign-out"></i> Sign Out
      </a>
      <!-- End of log out button -->

    </div>
    <!-- End of Container -->

  </header>
  <!-- End of Main Page Header -->