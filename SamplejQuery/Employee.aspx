<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SamplejQuery.Employee1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery Table</title>
    <script src="scripts/jquery-1.11.2.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: 'EmployeeService.asmx/GetEmployees',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $('#datatable').dataTable({
                        "pagingType": "full_numbers",
                        paging: true,
                        sort: true,
                        searching: true,
                        scrollY: 300,
                        data: data,
                        columns: [
                            { 'data': 'Id' },
                            { 'data': 'FirstName' },
                            { 'data': 'LastName' },
                            { 'data': 'Gender' },
                            { 'data': 'JobTitle' },
                            {
                                'data': 'WebSite',
                                'sortable': false,
                                'searchable': false,
                                'render': function (webSite) {
                                    if (!webSite) {
                                        return 'N/A';
                                    }
                                    else {
                                        return '<a href=' + webSite + '>'
                                            + webSite.substr(0, 10) + '...' + '</a>';
                                    }
                                }
                            },
                            {
                                'data': 'Salary',
                                'render': function (salary) {
                                    return "$" + salary;
                                }
                            },
                            {
                                'data': 'HireDate',
                                'render': function (jsonDate) {
                                    var date = new Date(parseInt(jsonDate.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return month + "/" + date.getDate() + "/" + date.getFullYear();
                                }
                            }
                        ]
                    });
                }
            });
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
     <div class="container-fluid">
            <br />
            <table id="datatable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr class="info">
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                        <th>Web Site</th>
                        <th>Salary</th>
                        <th>Hire Date</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                        <th>Web Site</th>
                        <th>Salary</th>
                        <th>Hire Date</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>
