<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!-- Card: Deposit Card -->
      <div class="card deposit-card">
        <!-- Card Body -->
        <div class="card-body">
          <!-- Deposit Form -->
          <form action="/transact/deposit" method="POST" class="deposit-form">
            <!-- Form Group -->
            <div class="form-group mb-2">
              <label for="">Enter Deposit Amount</label>
              <input type="text" class="form-control" name="deposit_amount" placeholder="Enter Deposit Amount">
            </div>
            <!-- End of Form Group -->

            <!-- Form Group -->
            <div class="form-group">
              <label for="">Select Account</label>
              <!-- Select Account Option -->
              <select name="account_id" class="form-control" id="deposit-type">
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
              <button id="add-account-btn" class="btn btn-md my-3">Deposit</button>
            </div>
            <!-- End of Form Group -->
          </form>
          <!-- End of Deposit Form -->

        </div>
        <!-- End of Card Body -->

      </div>
      <!-- End of Card: Deposit Card -->