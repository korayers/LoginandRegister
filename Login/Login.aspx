<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #aeeeff;
        }

        #formContainer {
            background-color: #f5f5f5;
            padding: 40px;
            border-radius: 5px;
            width: 469px;
            text-align: center;
            height: 393px;
        }

        h2 {
            font-size: 32px; 
            margin-bottom: 20px;
        }

        .inputField {
            margin-bottom: 15px;
        }

        .inputField label {
            display: block;
            margin-bottom: 5px;
            font-size: 18px; 
        }

        .inputField input {
            width: 100%;
            padding: 12px; 
            box-sizing: border-box;
            font-size: 18px; 
        }

        #BtnLogin {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        #BtnLogin:hover {
            background-color: #0056b3;
        }

        #BtnRegister {
            background-color: #4CAF50; 
            color: #fff; 
            padding: 15px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px; 
        }

        #BtnRegister:hover {
            background-color: #45a049; 
        }

        #ErrorMsg {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="formContainer">
            <h2>Welcome</h2>
            <div class="inputField">
                <label for="TxtUsername">Username</label>
                <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
            </div>
            <div class="inputField">
                <label for="TxtPassword">Password</label>
                <asp:TextBox ID="TxtPassword" runat="server" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
            </div>
            <div class="inputField">
                <asp:Button ID="BtnLogin" runat="server" OnClick="BtnLogin_Click" Text="Login" />
                <asp:Button ID="BtnRegister" runat="server" OnClick="BtnRegister_Click" Text="Register" />
            </div>
            <div id="ErrorMsg" runat="server"></div>
        </div>
    </form>
</body>
</html>