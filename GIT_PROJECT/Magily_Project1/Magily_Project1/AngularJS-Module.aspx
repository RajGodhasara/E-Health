<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Module.aspx.cs" Inherits="Magily_Project1.AngularJS_Module" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src = "Scripts\angular.js"></script>
     <script src = "AngularJS-ModuleMain.js"></script>
     <script src = "AngularJS-ModuleController.js"></script>
    <!--  CONCLUSION:
        we can create ng-app and ng-controller in different JS file and used it in different file by importing them. -->
</head>
<body>
   
    <form id="form1" runat="server">
    <div ng-app = "mainapp" ng-controller = "studentController">
         
         <table border = "1">
            <tr>
               <td>Enter first name:</td>
               <td><input type = "text" ng-model = "student.firstName"></td>
            </tr>
         
            <tr>
               <td>Enter last name: </td>
               <td><input type = "text" ng-model = "student.lastName"></td>
            </tr>
         
            <tr>
               <td>Name: </td>
               <td>{{student.fullName()}}</td>
            </tr>
         
            <tr>
               <td>Subject:</td>
               <td>
               
                  <table border="1 ">
                     <tr>
                        <th>Name</th>
                        <th>Marks</th>
                     </tr>
                  
                     <tr ng-repeat = "subject in student.subjects">
                        <td>{{ subject.name }}</td>
                        <td>{{ subject.marks }}</td>
                     </tr>
                  </table>
                  
               </td>
            </tr>
         </table>
         
      </div>
    </form>
</body>
</html>
