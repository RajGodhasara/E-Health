<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Angulat-JS-LoginUsingWebService.aspx.cs" Inherits="Magily_Project1.Angulat_JS_LoginUsingWebService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts/angular.js"></script>
     <script src = "Scripts/angular.min.js"></script>
     <link rel="stylesheet" href="Scripts/bootstrap.min.css" />
     <script src="Scripts/jquery.3.1.0.js"></script>
    <script src="Scripts/jquery.min.js"></script>
     <script src="Scripts\bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script>

        var email;
        var pass;
        $(document).ready(function(){
            alert("welcome");
            email = $("email").val();
            pass = $("pass").val();
            $("#submit").click(function ()
            {
                email = $("#email").val();
                pass = $("#pass").val();
                alert(email);
                alert(pass);
               
            });
            
        });


var mymodal = angular.module('mymodal', []);
mymodal.controller("submit", function ($scope) {
    $scope.myTxt = "You have not yet clicked submit";
    $scope.submit = function () {
        $scope.myTxt = "You clicked submit!";
        
    }
});
mymodal.controller("auth", function ($scope) {
    $scope.myTxt2 = "You have not yet clicked submit2";
    $scope.save = function () {
        $scope.myTxt2 = "You clicked submit2!";
        var type = "POST";
        var url = "LoginWebService.asmx/Authentication";
        var data = "{'" + email + "','" + pass + "'}";
        var config = { headers: { "Content-Type": "application/json" } };
        $http.post(type, url, data, config).
            success(function (data, status, headers, config) { alert(data); })
            .error(function (data, status, headers, config) { alert(status); });

    };
   
});

mymodal.controller('MainCtrl', function ($scope) {
    $scope.showModal = false;
    $scope.toggleModal = function(){
        $scope.showModal = !$scope.showModal;
       
        


    };
});
/*
mymodal.controller('SelectCtrl', function ($scope,$http) {
    $http.post('LoginWebService.asmx/Authentication').then(function (response) { $scope.login = response.data });
});
*/

mymodal.controller('SelectCtrl', function ($scope, $http) {
    $http.post('LoginWebService.asmx/Authentication').then(function (response) { $scope.login = response.data });
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
      replace:true,
      scope:true,
      link: function postLink(scope, element, attrs) {
        scope.title = attrs.title;

        scope.$watch(attrs.visible, function(value){
          if(value == true)
            $(element).modal('show');
          else
            $(element).modal('hide');
        });

        $(element).on('shown.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = true;
          });
        });

        $(element).on('hidden.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = false;
          });
        });
      }
    };
  });
</script>
</head>
<body ng-app="mymodal">
     <form id="form1" runat="server">
        <div ng-controller="MainCtrl" class="container">
            <h1>Modal example</h1>
            <input type="text" class="btn btn-default" value="Open" ng-click="toggleModal()"/>
            <modal title="Login form" visible="showModal">
                 <form role="form" ng-submit="save()" ng-controller="auth">
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <asp:TextBox runat="server" ID="email" ng-model="email" placeholder="Enter email" CssClass="form-control"></asp:TextBox>
        
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox runat="server" ID="pass" ng-model="pass" placeholder="Enter email" CssClass="form-control"></asp:TextBox>
        {{myTxt1}}
                    </div>
                    <!-- USE HERE ANGULAR ROUGHTING CONCEPT -->
                    <asp:Button runat="server" CssClass="btn btn-default" Text="Submit" ng-submit="save()" ID="submit"></asp:Button>









                                     </form>

            </modal>
            

            


            <form ng-submit="submit()" ng-controller="submit">
 
  <input type="text" ng-model="text" name="text" />
  <input type="submit" id="submit" value="Submit" />
 {{myTxt}}
</form>
        </div>
     <!--    <div  ng-controller="SelectCtrl">
        <table>
            <thead>
                <tr>
                    <th>EMAIL</th>
                    <th>PASS</th>
                </tr>
                </thead>
            <tbody>
                <tr ng-repeat="LoginModel in login">
                    <td>{{LoginModel.email}}</td>
                    <td>{{LoginModel.pass}}</td>
                    
                </tr>
                </tbody>
            </table>
    </div>-->
          <div  ng-controller="SelectCtrl">
       
            {{login}}
            
    </div>

    
    </form>
</body>

</html>
