<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CampusBookMarket.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campus Essentials Market</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
</head>
    
        <div class="form-container">
    <div class="form-header">
        <h2>Create Account</h2>
    </div>
    <div class="form-body" runat="server">
        <div class="form-group">
            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" placeholder="Enter your full name" runat="server" />
        </div>
        <div class="form-group">
            <label for="reg-email">Email</label>
            <input type="email" id="reg_email" placeholder="Enter your email" runat="server"/>
        </div>
        <div class="form-group">
            <label for="reg_password">Password</label>
            <input type="password" id="reg_password" placeholder="Create a password" runat="server"/>
        </div>
        <div class="form-group">
            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm_password" placeholder="Confirm your password" runat="server"/>
        </div>
        <div class="form-group">
            <asp:Button ID="btnRegister"  class="btn-primary" runat="server" Text="Register" OnClick="btnRegister_Click"  />
            <br />
            <asp:Label ID="lblResponse" runat="server" Text="" Visible="false"></asp:Label>
          

        </div>
    </div>
</div>

       

    
   
           </html>
</asp:Content>
