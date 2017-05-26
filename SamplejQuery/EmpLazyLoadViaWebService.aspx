<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpLazyLoadViaWebService.aspx.cs" Inherits="SamplejQuery.EmpLazyLoadViaWebService" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-1.11.2.js"></script>
    <script src="https://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.css" />
  
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
                sAjaxSource: 'EmployeeService2.asmx/GetEmployees',
                sServerMethod: 'post'
            });
        });
    </script>
     <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#datatable').dataTable();
            var tableTools = new $.fn.dataTable.TableTools(table, {
                'aButtons': [
                    {
                        'sExtends': 'xls',
                        'sButtonText': 'Save to Excel',
                        'sFileName': 'Data.xls'
                    },
                    {
                        'sExtends': 'print',
                        'bShowAll': true,
                    },
                    {
                        'sExtends': 'pdf',
                        'bFooter': false
                    },
                    'copy',
                    'csv'
                ],
                'sSwfPath': '//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
            });
            $(tableTools.fnContainer()).insertBefore('#datatable_wrapper');
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
            <div style="width: 800px; border: 1px solid black; padding: 3px">
            <table id="datatable" class="display">
                <thead>
                    <tr>
                        <th style="text-align:left">Id</th>
                        <th style="text-align:left">First Name</th>
                        <th style="text-align:left">Last Name</th>
                        <th style="text-align:left">Gender</th>
                        <th style="text-align:left">Job Title</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th style="text-align:left">Id</th>
                        <th style="text-align:left">First Name</th>
                        <th style="text-align:left">Last Name</th>
                        <th style="text-align:left">Gender</th>
                        <th style="text-align:left">Job Title</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>
