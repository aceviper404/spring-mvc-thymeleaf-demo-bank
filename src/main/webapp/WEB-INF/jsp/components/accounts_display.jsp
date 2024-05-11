<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Container -->
  <div class="container d-flex">
    <!-- Right Side Offcanvas: Transact Button -->
    <button id="add-account-btn" class="btn btn-lg shadow" type="button" data-bs-toggle="offcanvas"
      data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
      <i class="fa fa-credit-card me-2"></i>Add New Account
    </button>
    <!-- End of Right Side Offcanvas: Transact Button -->

    <!-- Left Side Offcanvas: Account Form Button -->
    <button id="transact-btn" class="btn btn-lg ms-auto shadow" type="button" data-bs-toggle="offcanvas"
      data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
      <i class="fa fa-wallet me-2"></i>Transact
    </button>
    <!-- End of Left Side Offcanvas: Account Form Button -->

  </div>
  <!-- End of Container -->

  <!-- Container: Total Accounts Balance Display -->
  <div class="container d-flex py-2">
    <h2 class="me-auto">Total Account Balance:</h2>
    <h2 class="ms-auto">
		<c:if test="${requestScope.balance != null}">
			<fmt:setLocale value = "en_US"/>
		    <fmt:formatNumber type="currency" value="${requestScope.balance}" var="formattedBalance"/>
		    <!-- Debugging statement -->
		    <c:out value="${formattedBalance}"/>
		</c:if>
	</h2>
  </div>
  <!-- End of Container: Total Accounts Balance Display -->

  <!-- Container: Accordion Menu / Drop Button -->
  <div class="container">
    <c:if test="${requestScope.accounts != null }">
    	<c:forEach items="${requestScope.accounts }" var="account">
    		<!-- Accordion Menu / Drop Button -->
		    <div class="accordion acc	ordion-flush" id="accordionFlushExample">
		      <div class="accordion-item">
		        <h2 class="accordion-header" id="flush-headingOne">
		          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
		            data-bs-target="#flush-${account.account_id}" aria-expanded="false" aria-controls="flush-collapseOne">
		            ${account.account_name }
		          </button>
		        </h2>
		        <div id="flush-${account.account_id}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
		          data-bs-parent="#accordionFlushExample">
		          <div class="accordion-body">
		          	<!-- Account Details List -->
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex">Account Name <span class="ms-auto"><b>${account.account_name}</b></span></li>
                        <li class="list-group-item d-flex">Account Number <span class="ms-auto"><b>${account.account_number}</b></span></li>
                        <li class="list-group-item d-flex">Account Type <span class="ms-auto"><b>${account.account_type}</b></span></li>
                        <li class="list-group-item d-flex">Account Balance <span class="ms-auto"><b>${account.balance}</b></span></li>
                        <li class="list-group-item d-flex">Created at <span class="ms-auto"><b>${account.created_at}</b></span></li>
                    </ul>
                    <!-- Account Details List -->
		          </div>
		        </div>
		      </div>		 
		    </div>
		    <!-- End of Accordion Menu / Drop Button -->
    	</c:forEach>
    </c:if>
  </div>
  <!-- End of Container:Accordion Menu / Drop Button -->