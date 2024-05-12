<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

  <!-- right-side offcanvas: account form container -->
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
      <h5 id="offcanvasRightLabel" class="text-white">Create / Add an Account</h5>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <!-- canvas body: account form container -->
    <div class="offcanvas-body">
      <!-- Card: Accounts Form Card -->
      <div class="card">
        <!-- Card Body -->
        <div class="card-body">
          <!-- Add Account Form -->
          <form action="/account/create_account" method="POST" class="add-account-form">
            <!-- Form Group -->
            <div class="form-group mb-3">
              <label for="">Enter Account Name</label>
              <input type="text" name="account_name" id="account_name" class="form-control" placeholder="Enter Account Name">
            </div>
            <!-- End of Form Group -->

             <!-- Form Group -->
             <div class="form-group mb-3">
              <label for="">Select Account Type</label>
              <select name="account_type" id="account_type" class="form-control">
                <option value="">-- Select Account Type --</option>
                <option value="Checking">Checking</option>
                <option value="Savings">Savings</option>
                <option value="Business">Business</option>
              </select>
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group mb-3">
              <button id="add-account-btn" class="btn btn-md my-3">Add Account</button>
            </div>
            <!-- End of Form Group -->
          </form>
          <!-- End of Add Account Form -->
          
        </div>
        <!-- End of Card Body -->

      </div>
      <!-- End of Card: Accounts Form Card -->
    </div>
    <!-- end of canvas body: account form container -->

  </div>
  <!-- end of right-side offcanvas: account form container -->