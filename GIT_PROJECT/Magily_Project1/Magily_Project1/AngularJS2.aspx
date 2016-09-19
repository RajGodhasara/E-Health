<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS2.aspx.cs" Inherits="Magily_Project1.AngularJS2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <!-- this script portion identify the CONTROLLER and $SCOPE identify the MODEL  -->
    <script>
        angular.module("myapp", []).controller("angularController",
        function($scope)
        {
            $scope.world={};
            $scope.world.net = "to my world";
            $scope.world.net1 = "to my ASP.NET world";
        }
            );
</script>
</head>
    <!-- here closing </body> tag is identify the ending of your AngularJS appliacation -->
<body ng-app="myapp">
    <form id="form1" runat="server">
        <!-- this DIV portion identify the VIEW  -->
    <div ng-controller="angularController">
    <p>welcome {{world}}</p>
        <p>welcome {{world.net}}</p>
        <p>welcome {{world.net1}}</p>
    </div>
    </form>
</body>
</html>
