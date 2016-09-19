<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AngularJS-Filters.aspx.cs" Inherits="Magily_Project1.AngularJS_Filters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src = "Scripts\angular.js"></script>
    <script>
         var div1 = angular.module("div1", []);
         //var div2 = angular.module("div2", []);
         div1.controller('studentController', function($scope) {
            $scope.student = {
               firstName: "Raj",
               lastName: "Godhasara",
               fees:500,
               
                  fullName: function() {
                  var studentObject;
                  studentObject = $scope.student;
                  return studentObject.firstName + " " + studentObject.lastName;
               }
            };
         });

         div1.controller('marksController', function ($scope) {
             $scope.marks = {
                 subjects: [
                        { name: 'Physics', marks: 70 },
                        { name: 'Chemistry', marks: 80 },
                        { name: 'Math', marks: 65 }
                 ]
             };
         });

        //CONCLUSION:
        // 1. we cant create more than one ng-app in the single page.
        //2. we can create more than one controller in single ng-app
        //3. we cant call more than one ng-controller in a signle TAG.
        //4. we can call same ng-controller in more than one TAG.
      </script>
</head>

    

<body>
    
    <form id="form1" runat="server">
    <div ng-app = "div1">
         <table border = "1" ng-controller = "studentController">
            <tr>
               <td>Enter first name:</td>
               <td><input type = "text" ng-model = "student.firstName" /></td>
            </tr>
            
            <tr>
               <td>Enter last name: </td>
               <td><input type = "text" ng-model = "student.lastName" /></td>
            </tr>
            
            <tr>
               <td>Enter fees: </td>
               <td><input type = "text" ng-model = "student.fees" /></td>
            </tr>
            
            
         </table>
         <br/>
         
         <table border = "1" ng-controller = "studentController">
            <tr>
               <td>Name in Upper Case: </td><td>{{student.fullName() | uppercase}}</td>
            </tr>
         
            <tr>
               <td>Name in Lower Case: </td><td>{{student.fullName() | lowercase}}</td>
            </tr>
         
            <tr>
               <td>fees: </td><td>{{student.fees | currency}}
               </td>
            </tr>
				
            
         </table>
         <table border = "1"   ng-controller = "marksController">
            
            
            <tr>
               <td>Enter subject: </td>
               <td><input type = "text" ng-model = "subjectName" /></td>
            </tr>
         </table>
         <br/>
         
         <table border = "1"   ng-controller = "marksController">
            	
            <tr>
               <td>Subject:</td>

               <td>
                  <ul>
                     <li ng-repeat = "subject in marks.subjects | filter: subjectName |orderBy:'marks'">
                        {{ subject.name + ', marks:' + subject.marks }}
                     </li>
                  </ul>
               </td>
            </tr>
         </table>
      </div>

       </form>
</body>
</html>
