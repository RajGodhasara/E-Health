<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Events.aspx.cs" Inherits="Magily_Project1.AngularJS_Events" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <!--  EVENT DIRECTIVES:
         ng-blur
ng-change
ng-click
ng-copy
ng-cut
ng-dblclick
ng-focus
ng-keydown
ng-keypress
ng-keyup
ng-mousedown
ng-mouseenter
ng-mouseleave
ng-mousemove
ng-mouseover
ng-mouseup
ng-paste 
        
        ng-mouseenter
ng-mouseover
ng-mousemove
ng-mouseleave
Or when a mouse button is clicked on an element, in this order:

ng-mousedown
ng-mouseup
ng-click
         -->
    <script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.count = 0;
});


app.controller('myCtrl1', function ($scope) {
    $scope.count = 0;
});


app.controller('myCtrl2', function ($scope) {
    $scope.count = 0;
    $scope.myFunction = function () {
        $scope.count++;
    }
});


app.controller('myCtrl3', function ($scope) {
    $scope.showMe = false;
    $scope.myFunc = function () {
        $scope.showMe = !$scope.showMe;
    }
});


app.controller('myCtrl4', function ($scope) {
    $scope.myFunc = function (myE) {
        $scope.x = myE.clientX;
        $scope.y = myE.clientY;
    }
});
</script>
</head>
<body ng-app="myApp">
    <form id="form1" runat="server">
    <div ng-controller="myCtrl">
        <h1 ng-mousemove="count = count + 1">Mouse over me!</h1>
        <h2>{{ count }}</h2>
    </div>
    <div ng-controller="myCtrl1">
        <button ng-click="count = count + 1">Click me!</button>
        <p>{{ count }}</p>
    </div>
    <div ng-controller="myCtrl2">
        <button ng-click="myFunction()">Click me!</button>
        <p>{{ count }}</p>
    </div>
    <div ng-controller="myCtrl3">
        <button ng-click="myFunc()">Click Me!</button>
        <div ng-show="showMe">
            <h1>Menu:</h1>
            <div>Pizza</div>
            <div>Pasta</div>
            <div>Pesce</div>
        </div>
    </div>
    <div ng-app="myApp" ng-controller="myCtrl4">
        <h1 ng-mousemove="myFunc($event)">Mouse Over Me!</h1>
        <p>Coordinates: {{x + ', ' + y}}</p>
    </div>
    </form>
</body>
</html>
