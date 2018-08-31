
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <c:if test="${sessionScope.roleName=='Manager'}">
        <a class="navbar-brand mr-1" href="AdminHomeController">Leave System</a>
    </c:if>
    <c:if test="${sessionScope.roleName=='Employee'}">
        <a class="navbar-brand mr-1" href="EmployeeHomeController">Leave System</a>
    </c:if>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

    </div>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">

        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span style="color:white; padding-right: 15px;">Hi ${username}</span>
                <i class="fas fa-user-circle fa-fw" style="font-size: 20px;padding-right: 55px;"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="LogoutController">Logout</a>
            </div>
        </li>
    </ul>

</nav>
