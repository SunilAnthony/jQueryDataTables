<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLazyLoad2.aspx.cs" Inherits="SamplejQuery.EmployeeLazyLoad2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-1.11.2.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#datatable').DataTable({
                columns: [
                    { 'data': 'Id' },
                    { 'data': 'FirstName' },
                    { 'data': 'LastName' },
                    { 'data': 'Gender' },
                    { 'data': 'JobTitle' }
                ],
                bServerSide: true,
                sAjaxSource: 'EmployeeDataHandler.ashx'
            });
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
        <div style="width: 100%; border: 1px solid black; padding: 3px">
            <table id="datatable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>