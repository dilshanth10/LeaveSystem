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

        <title>Employee | Dashboard</title>
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

        <style>

            input.error {
                border-color: red !important;
                border: 1px solid red;
            }

            label.error {
                font-weight: normal;
                color: red;
            }

            textarea.error {
                border-color: red !important;
                border: 1px solid red;
            }

            select.error {
                border-color: red !important;
                border: 1px solid red;
            }

            .errorId{
                color: red !important;
                font-size: 11px !important;
                font-style: normal !important;
            }

            .errorBorder{
                border: 1px solid red !important;
            }

            .btn.disabled, .btn[disabled], fieldset[disabled] .btn {
                cursor: default;
            }
            /*
            .white-background{
                background: -webkit-linear-gradient(top, #c7d3ff, #676cd7);
            }*/

            .disable-click{
                pointer-events: none;
            }
        </style>
    </head>

    <body id="page-top">

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);

            if ((session.getAttribute("username") == null)) {
                response.sendRedirect("index.jsp");
            }
        %>

        <c:if test="${sessionScope.roleName=='Manager'}">
            <% response.sendRedirect("AdminHomeController");%>
        </c:if>

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

                    <div class="col-md-12">
                        <form action="EmployeeLeaveRequestController" id="leaveRequestForm" method="post" class="form-horizontal"  role="form">

                            <div class="col-md-12 form-back">
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <label>Leave Type</label>
                                        <select class="form-control" id="leaveType" name="leaveType" style="cursor:pointer;">
                                            <option value="" selected disabled>Select Leave Type</option>
                                            <c:forEach items="${leaveTypeListAttribute}" var="leaveTypeList">
                                                <option value="${leaveTypeList.getLeaveTypeId()}">${leaveTypeList.getLeaveType()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Available Days</label>
                                        <input class="form-control" id="remainDays" name="remainDays" type="text" value="0" style="cursor:default;" readonly>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="start_date">Start Date</label>
                                        <div class="input-group date" id="startDate" data-date="" data-date-format="yyyy-mm-dd" data-link-field="startDateText" data-link-format="yyyy-mm-dd">
                                            <input class="form-control" id="startDateText" name="startDateText" size="16" type="text" value="" style="cursor: pointer;" readonly>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="end_date">End Date</label>
                                        <div class="input-group date" id="endDate" data-date="" data-date-format="yyyy-mm-dd" data-end-date="1d" data-link-field="endDateText" data-link-format="yyyy-mm-dd">
                                            <input class="form-control" id="endDateText" name="endDateText" size="16" type="text" value="" style="cursor: pointer;" readonly>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-md-10" style="padding-top:15px;">
                                        <label>Reason for Leave</label>
                                        <textarea class="form-control" rows="3" name="reason"></textarea>
                                    </div>
                                    <div align="right" class="col-md-2" style="padding-top:73px;">
                                        <input type="submit" class="btn btn-success" value="Request" style="width:80%;" /><br/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- DataTables Example -->
                    <div class="col-md-12">
                        <div class="card-header white-background">
                            <i class="fas fa-table"></i>
                            Employee Leave History</div>
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
                                            <!--<th class="no-sort"></th>-->
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
                                                <!--
                                                <td style="text-align:center;">
                                                    <a href="#" class="view" data-toggle="modal">
                                                        <i class="fa fa-eye"></i>
                                                    </a>
                                                </td>-->
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
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
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
                } else {
                    $('#endDate').removeClass("disable-click");
                }

                if (remainLeaveDays === 1) {
                    var selectedStartDate = $("#startDateText").val();
                    $("#endDateText").val(selectedStartDate);
                    $('#endDate').addClass("disable-click");
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
                    $('#endDateText').val('');
//                    $('#endDate').val('').datetimepicker('delete');
                    $('#endDate').addClass("disable-click");
                    var leaveTypeId = this.value;
                    $.ajax({
                        url: 'GetAvailableDaysByUserAndLeaveTypeController?leaveTypeId=' + leaveTypeId,

                        complete: function (response) {
                            var json = JSON.parse(response.responseText);
                            var remainDays = json.AvailableDay[0].AvailableDays;
                            $('#remainDays').val(remainDays);

                            if (remainDays == 0) {
                                $('#startDateText').val('');
                                $('#endDateText').val('');
                                $('#startDate').addClass("disable-click");
                                $('#endDate').addClass("disable-click");
                            } else {
                                $('#startDate').removeClass("disable-click");
                                $('#endDate').removeClass("disable-click");
                            }
                        },

                        error: function () {
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });

                $("#leaveRequestForm").validate({
                    rules: {
                        "leaveType": {
                            required: true
                        },
                        "remainDays": {
                            required: true
                        },
                        "startDateText": {
                            required: true
                        },
                        "endDateText": {
                            required: true
                        },
                        "reason": {
                            required: true
                        }
                    },
                    errorPlacement: function (error, element) { }
                });

            });

        </script>

    </body>

</html>
