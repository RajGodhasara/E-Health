<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Directives.aspx.cs" Inherits="Magily_Project1.AngularJS3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- NG-INIT initialize the variable here it initialize the array of contry.  -->
    <div ng-app = "" ng-init = "countries = [{locale:'en-US',name:'United States'}, {locale:'en-GB',name:'United Kingdom'}, {locale:'en-FR',name:'France'}]"> 
         <p>Enter your Name: <input type = "text" ng-model = "name"></p>
         <p>Hello <span ng-bind = "name"></span>!</p>
         <p>List of Countries with locale:</p>
      
         <ol>
             <!-- NG-REPEAT it repeats all the elements prensent in COLLECTION(ARRAY).  -->
            <li ng-repeat = "country in countries">
               {{ 'Country: ' + country.name + ', Locale: ' + country.locale }}
            </li>
         </ol>
      </div>
    </form>
</body>
</html>
