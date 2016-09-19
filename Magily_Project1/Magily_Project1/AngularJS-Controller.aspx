<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Controller.aspx.cs" Inherits="Magily_Project1.AngularJS_Controller" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <script>
         var div1 = angular.module("div1", []);
         
         div1.controller('studentController', function($scope) {
            $scope.student = {
               //firstName: "Raj",
                //lastName: "Godhasara",

               // if we initialize FN and LN than it will return that value otherwise it will return dynamically setted value.
               fullName: function() {
                 // var studentObject;
                 // studentObject = $scope.student;
                   // return studentObject.firstName + " " + studentObject.lastName;

                   //here scope of student first setted into variable than it will used. 
                   //we can also used direct scope for the student property described below statement.
                  return $scope.student.firstName + " " + $scope.student.lastName;
               }
            };
         });
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div ng-app = "div1" ng-controller = "studentController">
         Enter first name: <input type = "text" ng-model = "student.firstName"/><br><br>
         Enter last name: <input type = "text" ng-model = "student.lastName"/><br>
         <br>
         
         You are entering: {{student.fullName()}}
      </div>
    </form>
</body>
</html>
