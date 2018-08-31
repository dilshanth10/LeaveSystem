<ul class="sidebar navbar-nav">
    <li class="nav-item active">
    <c:if test="${sessionScope.roleName=='Manager'}">
        <a class="nav-link" href="AdminHomeController">
            <i class="fas fa-fw fa-tachometer-alt" style="padding-right: 30px;"></i>
            <span>Dashboard</span>
        </a>
    </c:if>
    <c:if test="${sessionScope.roleName=='Employee'}">
        <a class="nav-link" href="EmployeeHomeController">
            <i class="fas fa-fw fa-tachometer-alt" style="padding-right: 30px;"></i>
            <span>Dashboard</span>
        </a>
    </c:if>
</li>
</ul>