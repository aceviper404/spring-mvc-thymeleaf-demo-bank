<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!-- Card: Transfer Card -->
      <div class="card transfer-card">
        <!-- Card Body -->
        <div class="card-body">
          <form action="/transact/transfer" method="POST">
          	  <!-- Form Group -->
	          <div class="form-group">
	            <label for="">Transfer From Account:</label>
	            <!-- Select Account Option -->
	            <select name="transfer_from" class="form-control" id="">
	              <option value="">-- Select Account --</option>
	              <c:if test="${accounts!=null }">
	              	<c:forEach items="${accounts}" var="account">
	              		<option value="${account.account_id}">${account.account_name}</option>
	              	</c:forEach>
	              </c:if>
	            </select>
	            <!-- End of Select Account Option -->
	
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group">
	            <label for="">Transfer To Account:</label>
	            <!-- Select Account Option -->
	            <select name="transfer_to" class="form-control" id="">
	              <option value="">-- Select Account --</option>
	              <c:if test="${accounts!=null }">
	              	<c:forEach items="${accounts}" var="account">
	              		<option value="${account.account_id}">${account.account_name}</option>
	              	</c:forEach>
	              </c:if>
	            </select>
	            <!-- End of Select Account Option -->
	
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group mb-2">
	            <label for="">Enter Transfer Amount</label>
	            <input type="text" class="form-control" name="transfer_amount" placeholder="Enter Transfer Amount">
	          </div>
	          <!-- End of Form Group -->
	
	          <!-- Form Group -->
	          <div class="form-group mb-2">
	            <button id="add-account-btn" class="btn btn-md">Transfer</button>
	          </div>
	          <!-- End of Form Group -->
          </form>

        </div>
        <!-- End of Card Body -->

      </div>
      <!-- End of Card: Transfer Card -->