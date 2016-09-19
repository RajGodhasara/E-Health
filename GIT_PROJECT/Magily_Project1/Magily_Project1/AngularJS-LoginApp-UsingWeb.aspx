<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AngularJS-LoginApp-UsingWeb.aspx.cs" Inherits="Magily_Project1.AngularJS_LoginApp" %>

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
            $("#submitn").click(function ()
            {
                email = $("#email").val();
                pass = $("#pass").val();
                alert(email);
                alert(pass);
               
            });
            
        });
        

        var mymodal = angular.module("mymodal",[]);

mymodal.controller("submit", function ($scope) {
    $scope.myTxt = "You have not yet clicked submit";
    $scope.submit = function () {
        $scope.myTxt = "You clicked submit!";
        
    }
});
mymodal.controller("auth", function ($scope,$http) {
      $scope.myTxt2 = "You have not yet clicked submit2";
      $scope.save = function () {
        $scope.myTxt2 = "You clicked submit2!";
        $http({ method: "GET", url: "LoginWebService.asmx/Authentication", params: { email: $scope.email, pass: $scope.pass } })
            .error(function (status) { alert(status)})
            .then(function (response) { $scope.ans = response.data });
       
          
    };
   
});



mymodal.controller('SelectCtrl', function ($scope, $http) {
    alert("in select controller");
    $http.get('LoginWebService.asmx/List').then(function (response) { $scope.login = response.data });
});

</script>
</head>
<body ng-app="mymodal">
     
       <form ng-submit="save()"  ng-controller="auth">
 
  <input type="text" ng-model="email" name="text" id="email" />
                <input type="text" ng-model="pass" name="text" id="pass" />
  <input type="submit" id="submitn" value="Submit"  />
         {{myTxt2}}{{ans}}
 </form>


     
    

       <div ng-controller="SelectCtrl">
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
    </div>
    
     
       
</body>

</html>

