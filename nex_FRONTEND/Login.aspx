<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CampusBookMarket.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-container">
    <div class="form-header">
        <h2>Login</h2>
    </div>
    <div class="form-body" runat="server">
        
        <div class="form-group">
            <label for="reg-email">Email</label>
            <input type="email" id="reg_email" placeholder="Enter your email" runat="server"/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" placeholder="Enter your password" runat="server"/>
        </div>
        <asp:Button ID="btnLogin" runat="server" class="btn-primary" Text="Login" OnClick="btnLogin_Click" />
        <br />
        <asp:Label ID="lblResponse" runat="server" Text="" Visible="false"></asp:Label>

        
        <div class="form-group">
            
            <br />
          

        </div>
    </div>
</div>

       
</asp:Content>
