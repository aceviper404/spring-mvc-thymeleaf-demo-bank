<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!-- Card: Payment Card -->
      <div class="card payment-card">
        <!-- Card Body -->
        <div class="card-body">
          <form action="/transact/payment" method="POST">
          	  <!-- Form Group -->
	          <div class="form-group mb-2">
	            <label for="">Account Holder / Beneficiary</label>
	            <input type="text" class="form-control" name="beneficiary"
	              placeholder="Enter Account Holder / Beneficiary Name">
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group mb-2">
	            <label for="">Beneficiary Account Number</label>
	            <input type="text" class="form-control" name="beneficiary_acc_number"
	              placeholder="Enter Beneficiary Account Number">
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group">
	            <label for="">Select Account</label>
	            <!-- Select Account Option -->
	            <select name="account_id" class="form-control" id="">
	              <option value="">-- Select Account --</option>
	              <c:if test="${accounts != null}">
                	<c:forEach items="${accounts }" var="account">
                		<option value="${account.account_id }">${account.account_name}</option>
                	</c:forEach>
                  </c:if>
	            </select>
	            <!-- End of Select Account Option -->
	
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group mb-2">
	            <label for="">Reference</label>
	            <input type="text" class="form-control" name="reference" placeholder="Enter Reference">
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group mb-2">
	            <label for="">Enter Payment Amount</label>
	            <input type="text" class="form-control" name="payment_amount" placeholder="Enter Payment Amount">
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group mb-2">
	            <button id="add-account-btn" class="btn btn-md">Pay</button>
	          </div>
	          <!-- End of Form Group -->
          </form>

        </div>
        <!-- End of Card Body -->

      </div>
      <!-- End of Card: Payment Card -->