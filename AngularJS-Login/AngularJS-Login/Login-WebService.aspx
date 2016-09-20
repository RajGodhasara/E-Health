<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Login-WebService.aspx.cs" Inherits="AngularJS_Login.Scripts.Login_WebService1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        td
        {
           margin:10px;
            background-color:antiquewhite;
            border-color:brown;
           
        } 
        .margin
        {
            margin:20px;
        }
        </style>
    <script src="Scripts/angular.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.1.0.js"></script>
    <script src="Scripts/angular.min.js"></script>
    <script src="Scripts/jquery-3.1.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="CSS/bootstrap.min.css" rel="stylesheet"/>
    <script>
       

        var mymodal = angular.module("mymodal", []);
        
        var email;
        var pass;
        $(document).ready(function(){
          
            
        });
       

        mymodal.controller('MainCtrl', function ($scope,$http) {

            $scope.showModal = false;
            $scope.toggleModal = function () {
                $scope.showModal = !$scope.showModal;
            };

            
            $scope.auth = function () {
                alert("in auth");
               
                $http({ method: "GET", url: "LoginService.asmx/Authentication", params: { email: $("#email").val(), pass: $("#pass").val() } })
                        .error(function (status) { alert(status) })
                        .then(function (response) { $scope.ans = response.data; alert(response.data.toString()); $("#email").val(" "); $("#pass").val(""); });

            };

            $scope.list = function () {
                alert("in list");

                $http.get('LoginService.asmx/list')
                    .error(function (status) { alert(status)})
                    .then(function (response) { $scope.login = response.data; });

            };

            $scope.insert = function () {
                alert("in insert");
                $http({ method: "GET", url: "LoginService.asmx/Insert", params: { Email:$("#email").val() , Pass:$("#pass").val()  } })
                    .error(function (status) { alert(status) })
                    .then(function (response) { $scope.ans = response.data; alert("Register Successful."); $("#email").val(" "); $("#pass").val(""); });
            };
        });

        

        mymodal.directive('modal', function () {
            return {
                template: '<div class="modal fade">' +
                    '<div class="modal-dialog">' +
                      '<div class="modal-content">' +
                        '<div class="modal-header">' +
                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
                          '<h4 class="modal-title">{{ title }}</h4>' +
                        '</div>' +
                        '<div class="modal-body" ng-transclude></div>' +
                      '</div>' +
                    '</div>' +
                  '</div>',
                restrict: 'E',
                transclude: true,
                replace: true,
                scope: true,
                link: function postLink(scope, element, attrs) {
                    scope.title = attrs.title;

                    scope.$watch(attrs.visible, function (value) {
                        if (value == true)
                            $(element).modal('show');
                        else
                            $(element).modal('hide');
                    });

                    $(element).on('shown.bs.modal', function () {
                        scope.$apply(function () {
                            scope.$parent[attrs.visible] = true;
                        });
                    });

                    $(element).on('hidden.bs.modal', function () {
                        scope.$apply(function () {
                            scope.$parent[attrs.visible] = false;
                        });
                    });
                }
            };
        });
</script>
</head>
<body ng-app="mymodal">
   
        <div ng-controller="MainCtrl" class="container">
            <h1>Login Example</h1>
            <button ng-click="toggleModal()" class="btn btn-default">Open Login</button>    
                
            <modal title="Login form" visible="showModal">
            <form role="form" ng-submit="insert()">
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" data-ng-model="email" id="email" placeholder="Enter email" />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" data-ng-model="pass" id="pass" placeholder="Password" />
                </div>
                <input type="submit" class="btn btn-default" value="Register"/>
                <input type="button" class="btn btn-default" value="Login" ng-click="auth()"/>
            </form>
            </modal>
        
       
            </div>

    <form id="form1" runat="server">
        <br />
        <br />
        <br />
       <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Show Registred data." OnClick="list_using_grid"></asp:Button>
        <br />
        <br />
       <table style="margin-top:20px;">
           
            <tr>
                <td>
        <asp:GridView ID="gv1" runat="server" DataKeyNames="id" OnRowEditing="gv1_RowEditing" OnRowUpdating="gv1_RowUpdating" OnRowDeleting="gv1_RowDeleting" AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" AutoGenerateColumns="false" >
            <Columns>
                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="form-control" ID="t1" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label CssClass="label-control" ID="l1"  runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Password">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="form-control" ID="t2"  runat="server" Text='<%# Eval("password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label CssClass="label-control" ID="l2"  runat="server" Text='<%# Eval("password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
             <Columns>
                <asp:TemplateField HeaderText="Id">
                   
                    <ItemTemplate>
                        <asp:Label CssClass="label-control" ID="l3"  runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                    </td>
                </tr>
            </table>
</form>
</body>
</html>
