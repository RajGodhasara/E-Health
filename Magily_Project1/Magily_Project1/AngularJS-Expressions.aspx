<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Expressions.aspx.cs" Inherits="Magily_Project1.AngularJS_Expressions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!--  initialize the variable 1. quantity 2. cost 3. array of student obj with name and value 4. array of marks obj only with value -->
    <div ng-app = "" ng-init = "quantity = 1;cost = 300; student = {firstname:'Raj',lastname:'Godhasara',rollno:140053131008};marks = [80,90,75,73,60]">
         <p>Hello {{student.firstname + " " + student.lastname}}!</p>
         <p>Expense on Books : {{cost * quantity}}/- Rs</p>
         <p>Roll No: {{student.rollno}}</p>
         <p>Marks of third subject: {{marks[3]}}</p>
      </div>
    </form>
</body>
</html>
