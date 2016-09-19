<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Services.aspx.cs" Inherits="Magily_Project1.AngularJS_Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <script>
         var mainApp = angular.module("mainApp", []);
         
         mainApp.factory('MathService', function() {
            var factory = {};
            
            factory.multiply = function(a, b) {
               return a * b
            }
            return factory;
         });
         
         mainApp.service('CalcService', function(MathService){
            this.square = function(a) {
               return MathService.multiply(a,a);
            }
         });
         
         mainApp.controller('CalcController', function($scope, CalcService) {
            $scope.square = function() {
               $scope.result = CalcService.square($scope.number);
            }
         });
      </script>
</head>
<body>
    <form id="form1" runat="server">
   <div ng-app = "mainApp" ng-controller = "CalcController">
         <p>Enter a number: <input type = "number" ng-model = "number" /></p>
         <button ng-click = "square()">X<sup>2</sup></button>
         <p>Result: {{result}}</p>
      </div>
    </form>
</body>
</html>
