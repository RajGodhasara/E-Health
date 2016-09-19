<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-HTML-DOM.aspx.cs" Inherits="Magily_Project1.AngularJS_HTML_DOM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
</head>
<body>
    <form id="form1" runat="server">
   <div ng-app = "">
         
         <table border = "0">
            <tr>
               <td><input type = "checkbox" ng-model = "enableDisableButton">Disable Button</td>
               <td><button ng-disabled = "enableDisableButton">Click Me!</button></td>
            </tr>
            
            <tr>
               <td><input type = "checkbox" ng-model = "showHide1">Show Button</td>
               <td><button ng-show = "showHide1">Click Me!</button></td>
            </tr>
            
            <tr>
               <td><input type = "checkbox" ng-model = "showHide2">Hide Button</td>
               <td><button ng-hide = "showHide2">Click Me!</button></td>
            </tr>
            
            <tr>
               <td><p>Total click: {{ clickCounter }}</p></td>
               <td><button ng-click = "clickCounter = clickCounter + 1">Click Me!</button></td>
            </tr>
         </table>
         
      </div>
    </form>
</body>
</html>
