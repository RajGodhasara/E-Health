<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Ajax.aspx.cs" Inherits="Magily_Project1.AngularJS_Ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <script>
        //its not working.
         function studentController($scope,$http) {
             var url = "AngularJS-Ajax.txt";
         
            $http.get(url).success( function(response) {
               $scope.students = response;
            });
         }
      </script>
</head>
<body>
    <form id="form1" runat="server">
   <div ng-app = "" ng-controller = "studentController">
      
         <table>
            <tr>
               <th>Name</th>
               <th>Roll No</th>
               <th>Percentage</th>
            </tr>
         
            <tr ng-repeat = "student in students">
               <td>{{ student.Name }}</td>
               <td>{{ student.RollNo }}</td>
               <td>{{ student.Percentage }}</td>
            </tr>
         </table>
      </div>
    </form>
</body>
</html>
