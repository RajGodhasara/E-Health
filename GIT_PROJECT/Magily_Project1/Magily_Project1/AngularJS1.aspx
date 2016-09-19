<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS1.aspx.cs" Inherits="Magily_Project1.AngularJS1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <script>

        
    </script>
</head>
<body ng-app>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="name" runat="server" ng-model="yourname"></asp:TextBox><br/><br/>

        <h1>Hello {{yourname}}!</h1>

        <input type="text" ng-model="name"/>
        <h1>hii {{name}}!</h1>
    </div>
    </form>
</body>
</html>
