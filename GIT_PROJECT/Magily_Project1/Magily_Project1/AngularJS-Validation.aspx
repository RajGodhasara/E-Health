﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Validation.aspx.cs" Inherits="Magily_Project1.AngularJS_Validation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src = "Scripts\angular.js"></script>
    <script> 

        //this function is used for resetting the data.
        //in short onclick event.


        //you can find more example on below link.
        //http://www.w3schools.com/angular/angular_validation.asp
         var mainApp = angular.module("mainApp", []);
         
         mainApp.controller('studentController', function($scope) {
            $scope.reset = function(){
               $scope.firstName = "";
               $scope.lastName = "";
               $scope.email = "";
            }
            
            $scope.reset();
         });
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div ng-app = "mainApp" ng-controller = "studentController">
         
         <form name = "studentForm" novalidate>
            <table border = "0">
               <tr>
                  <td>Enter first name:</td>
                  <td><input name = "firstname" type = "text" ng-model = "firstName" required>
                     <span style = "color:red" ng-show = "studentForm.firstname.$dirty && studentForm.firstname.$invalid">
                        <span ng-show = "studentForm.firstname.$error.required">First Name is required.</span>
                     </span>
                  </td>
               </tr>
               
               <tr>
                  <td>Enter last name: </td>
                  <td><input name = "lastname"  type = "text" ng-model = "lastName" required>
                     <span style = "color:red" ng-show = "studentForm.lastname.$dirty && studentForm.lastname.$invalid">
                        <span ng-show = "studentForm.lastname.$error.required">Last Name is required.</span>
                     </span>
                  </td>
               </tr>
               
               <tr>
                  <td>Email: </td><td><input name = "email" type = "email" ng-model = "email" length = "100" required>
                     <span style = "color:red" ng-show = "studentForm.email.$dirty && studentForm.email.$invalid">
                        <span ng-show = "studentForm.email.$error.required">Email is required.</span>
                        <span ng-show = "studentForm.email.$error.email">Invalid email address.</span>
                     </span>
                  </td>
               </tr>
               
               <tr>
                  <td>
                     <button ng-click = "reset()">Reset</button>
                  </td>
                  <td>
                     <button ng-disabled = "studentForm.firstname.$dirty &&
                        studentForm.firstname.$invalid || studentForm.lastname.$dirty &&
                        studentForm.lastname.$invalid || studentForm.email.$dirty &&
                        studentForm.email.$invalid" ng-click="submit()">Submit</button>
                  </td>
               </tr>
					
            </table>
         </form>
      </div>
    </form>
</body>
</html>
