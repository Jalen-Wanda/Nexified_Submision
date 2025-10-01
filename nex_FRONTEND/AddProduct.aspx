<%@ Page Title="AddProduct" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="CampusBookMarket.AddProduct" %>
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
        <h2>Sell Products</h2>
    </div>
    <div class="form-body" runat="server">
        <div class="form-group">
            <label for="itemname">Item Name</label>
            <input type="text" id="itemname" placeholder="Enter item name" runat="server" />
        </div>
        <div class="form-group">
            <label for="tprice">price </label>
            <input type="text" id="tprice" placeholder="enter the price " runat="server"/>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" id="category" placeholder="enter the category" runat="server"/>
        </div>
        <div class="form-group">
            <label for="descprition">descpriction</label>
            <input type="text" id="descprition" placeholder="Enter the item descprition " runat="server"/>
        </div>

       
        <div>
            <h2>Upload an Image</h2>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br /><br />
            <asp:Image ID="UploadedImage" runat="server" Width="300px" Visible="false" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>


        <div class="form-group">
            <asp:Button ID="btnInsert" runat="server" Text="Submit Item " OnClick="btnInsert_Click" />
            <br />
            <asp:Label ID="lblResponse" runat="server" Text="" Visible="false"></asp:Label>
          

        </div>
    </div>
</div>

       

    
   
           </html>
</asp:Content>




