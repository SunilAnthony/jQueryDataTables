<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLazyLoad.aspx.cs" Inherits="SamplejQuery.EmployeeLazyLoad" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-1.11.2.js"></script>
    <link rel="stylesheet" type="text/css"  href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <script src="https://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.10.10/js/dataTables.jqueryui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.10/css/dataTables.jqueryui.min.css" />

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
            <table id="datatable" class="display" cellspacing="0" width="100%">
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