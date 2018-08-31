<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Manager | Dashboard</title>
        <link rel="icon" href="Contents/images/icons/favicon.ico" />
        <!-- Bootstrap core CSS-->
        <link href="Contents/dashboard/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="Contents/dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="Contents/dashboard/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="Contents/dashboard/css/sb-admin.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="Contents/dashboard/date-picker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <link href="Contents/dashboard/css/dashboard.css" rel="stylesheet" media="screen">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    </head>

    <body id="page-top">

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);

            if ((session.getAttribute("username") == null)) {
                response.sendRedirect("index.jsp");
            }
            if ((session.getAttribute("username") == "admin")) {
                response.sendRedirect("employee.jsp");
            }
        %>

        <!--Header-->
        <%@ include file="Shared/header.jsp" %>
        <!--Header-->
        <div id="wrapper">
            <!-- Sidebar -->
            <%@ include file="Shared/sidebar.jsp" %>
            <!--Sidebar-->

            <div id="content-wrapper">
                <div class="container-fluid">

                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Overview</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="col-md-12">
                        <div class="card-header white-background">
                            <i class="fas fa-cogs" style="padding-right:15px;"></i>
                            Leave Approval
                        </div>
                        <div class="card-body white-background">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Leave Type</th>
                                            <th>Leave Days</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Reason</th>
                                            <th>Leave Status</th>
                                            <th class="no-sort"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${leaveListAttribute}" var="leaveList">
                                            <tr>
                                                <td>${leaveList.getLeaveType()}</td>
                                                <td>${leaveList.getLeaveDays()}</td>
                                                <td>${leaveList.getStartDate()}</td>
                                                <td>${leaveList.getEndDate()}</td>
                                                <td>${leaveList.getReason()}</td>
                                                <td>${leaveList.getLeaveStatus()}</td>

                                                <td style="text-align:center;">

                                                    <c:if test="${leaveList.getLeaveStatusId() == 1}">
                                                        <div id="approvalButtons">
                                                            <a href="AdminLeaveUpdateController?leaveStatusId=2&leaveId=${leaveList.getLeaveId()}" class="edit" style="padding-right:15px;">
                                                                <i class="fa fa-check" data-toggle="tooltip" id="acceptBtn" title="Accept"></i>
                                                            </a>
                                                            <a href="AdminLeaveUpdateController?leaveStatusId=3&leaveId=${leaveList.getLeaveId()}" class="delete">
                                                                <i class="fa fa-times" data-toggle="tooltip" id="deleteBtn" title="Reject"></i>
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

                <!--Footer-->
                <%@ include file="Shared/footer.jsp" %>
                <!--Footer-->

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="Contents/dashboard/vendor/jquery/jquery.min.js"></script>
        <script src="Contents/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Page level plugin JavaScript-->
        <script src="Contents/dashboard/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="Contents/dashboard/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="Contents/dashboard/js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="Contents/dashboard/js/demo/datatables-demo.js"></script>



        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="Contents/dashboard/date-picker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>

        <script type="text/javascript">

            var date = new Date();
            var current_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();

            $('#startDate').datetimepicker({
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                startDate: current_date,
                minView: 2,
                forceParse: 0
            });

            $('#endDate').datetimepicker({
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                startDate: current_date,
                minView: 2,
                forceParse: 0
            });

            $('#startDate').change(function () {
                var remainLeaveDays = parseInt($("#remainDays").val());
                var getStartDate = $('#startDate').datetimepicker('getDate', '');
                var pickEndDate = $('#startDate').datetimepicker('getDate', '');

                if (pickEndDate !== null) {
                    pickEndDate.setDate(pickEndDate.getDate() + remainLeaveDays);
                    setTimeout(function () {
                        $('#endDate').datetimepicker('setDate', getStartDate);
                    }, 100);
                    var endDateFilter = pickEndDate.getFullYear() + "-" + (pickEndDate.getMonth() + 1) + "-" + (pickEndDate.getDate() - 1);
                    $('#endDate').datetimepicker('setStartDate', getStartDate);
                    $('#endDate').datetimepicker('setEndDate', endDateFilter);
                }
            });

            $('#dataTable').dataTable({
                "order": [],
                "columnDefs": [{
                        "targets": 'no-sort',
                        "orderable": false,
                    }]
            });

//            $(function () {
//                $('#endDate').children().click(function () {
//                    alert('hello');
//                });
//                $('#endDate').children().off('click');
//            });

            $(document).ready(function () {

                $("#leaveType").change(function () {
                    var leaveTypeId = this.value;
                    $.ajax({
                        url: 'GetAvailableDaysByUserAndLeaveTypeController?leaveTypeId=' + leaveTypeId,

                        complete: function (response) {
                            var json = JSON.parse(response.responseText);

                            $('#remainDays').val(json.AvailableDay[0].AvailableDays);
                        },

                        error: function () {
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });
            });

        </script>

    </body>

</html>
