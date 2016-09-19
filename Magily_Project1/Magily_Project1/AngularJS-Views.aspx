<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Views.aspx.cs" Inherits="Magily_Project1.AngularJS_Views" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src = "Scripts\angular.js"></script>
    <script>
         var mainApp = angular.module("mainApp", ['ngRoute']);
         mainApp.config(['$routeProvider', function($routeProvider) {
            $routeProvider.
            
            when('/addStudent', {
               templateUrl: 'AngularJS-Views-AddStudent.aspx',
               controller: 'AddStudentController'
            }).
            
            when('/viewStudents', {
                templateUrl: 'AngularJS-Views-AddStudent.aspx',
               controller: 'ViewStudentsController'
            }).
            
            otherwise({
               redirectTo: '/addStudent'
            });
         }]);
         
         mainApp.controller('AddStudentController', function($scope) {
            $scope.message = "This page will be used to display add student form";
         });
         
         mainApp.controller('ViewStudentsController', function($scope) {
            $scope.message = "This page will be used to display all the students";
         });
			
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div ng-app = "mainApp">
         <p><a href = "AngularJS-Views-AddStudent.aspx">Add Student</a></p>
         <p><a href = "AngularJS-Views-AddStudent.aspx">View Students</a></p>
         <div ng-view></div>
         
         <script type = "text/ng-template" id = "AngularJS-Views-AddStudent.aspx">
            <h2> Add Student </h2>
            {{message}}
         </script>
         
         <script type = "text/ng-template" id = "viewStudents.htm">
            <h2> View Students </h2>
            {{message}}
         </script>
      </div>
    </form>
</body>
</html>
