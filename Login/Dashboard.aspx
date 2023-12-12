<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Login.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grade Average Calculator</title>
    <style>
        body {
            background-color: #aeeeff; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        #formContainer {
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }

        h2 {
            border: 2px solid #007bff;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        .gradeInput {
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #007bff;
            border-radius: 5px;
        }

        button {
            background: linear-gradient(to bottom, #0056b3 0%, #003366 100%);
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(to bottom, #003366 0%, #001a33 100%);
        }

        #result {
            margin-top: 20px;
        }

        #message {
            font-weight: bold;
            margin-top: 10px;
        }

        .failed {
            color: red;
        }

        .achieved {
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="formContainer">
            <h2>Welcome to the Grade Average Page</h2>

            <label for="grade1">Grade 1:</label>
            <input type="number" id="grade1" class="gradeInput" placeholder="Grade 1" required max="100">

            <label for="grade2">Grade 2:</label>
            <input type="number" id="grade2" class="gradeInput" placeholder="Grade 2" required max="100">

            <label for="grade3">Grade 3:</label>
            <input type="number" id="grade3" class="gradeInput" placeholder="Grade 3" required max="100">

            <label for="grade4">Grade 4:</label>
            <input type="number" id="grade4" class="gradeInput" placeholder="Grade 4" required max="100">

            <label for="grade5">Grade 5:</label>
            <input type="number" id="grade5" class="gradeInput" placeholder="Grade 5" required max="100">

            <label for="grade6">Grade 6:</label>
            <input type="number" id="grade6" class="gradeInput" placeholder="Grade 6" required max="100">

            <button type="button" onclick="calculateAverage()">Calculate Average</button>

            <p id="result"></p>
            <p id="message" class=""></p>
        </div>
    </form>

   <script>
       function calculateAverage() {
           var grade1 = parseFloat(document.getElementById("grade1").value);
           var grade2 = parseFloat(document.getElementById("grade2").value);
           var grade3 = parseFloat(document.getElementById("grade3").value);
           var grade4 = parseFloat(document.getElementById("grade4").value);
           var grade5 = parseFloat(document.getElementById("grade5").value);
           var grade6 = parseFloat(document.getElementById("grade6").value);

           // Minimum ve maksimum değerleri kontrol et
           if (!isValidGrade(grade1) || !isValidGrade(grade2) || !isValidGrade(grade3) || !isValidGrade(grade4) || !isValidGrade(grade5) || !isValidGrade(grade6)) {
               document.getElementById("result").innerHTML = "";
               document.getElementById("message").textContent = "Please enter valid grades between 0 and 100 with at most 3 digits";
               document.getElementById("message").className = "failed";
               return;
           }

           var average = (grade1 + grade2 + grade3 + grade4 + grade5 + grade6) / 6;

           document.getElementById("result").innerHTML = "Grade Average: " + average.toFixed(2);

           var messageElement = document.getElementById("message");

           if (average < 50) {
               messageElement.textContent = "You Failed";
               messageElement.className = "failed";
           } else {
               messageElement.textContent = "You Achieved";
               messageElement.className = "achieved";
           }
       }

       // Notun geçerli olup olmadığını kontrol et
       function isValidGrade(grade) {
           return !isNaN(grade) && grade >= 0 && grade <= 100 && (grade.toString().length <= 3) && (grade % 1 === 0);
       }
   </script>

</body>
</html>
