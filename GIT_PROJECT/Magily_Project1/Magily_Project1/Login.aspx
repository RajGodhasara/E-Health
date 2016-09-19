<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Magily_Project1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/angular.min.js"></script>
    <script src="Scripts/angular.js"></script>
    <script src="Scripts/angular-mocks.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular-route.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" style="margin-left:80px; margin-top:150px;" method="get">
        <div style="text-align:center; font-size:20px; margin-bottom:20px;">Login</div>
    <div style="text-align:center;">
    
     Email ID:   <asp:TextBox ID="email" runat="server"></asp:TextBox><br/><br/>
     Password:   <asp:TextBox ID="password" runat="server"></asp:TextBox><br/><br/>
        <asp:Button ID="loginsubmit" runat="server" OnClick="Login1" Text="Login"></asp:Button>
          <asp:Button ID="Registersubmit" runat="server" OnClick="Registration" Text="Register"></asp:Button>

    </div>
    </form>
</body>
</html>
