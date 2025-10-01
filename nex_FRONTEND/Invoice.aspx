<%@ Page Title="invoice" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="CampusBookMarket.invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        /* Basic styling for invoice */
        .invoice-container {
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ddd;
            background: #f9faff;
            border-radius: 8px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .invoice-header {
            border-bottom: 2px solid #1a73e8;
            padding-bottom: 10px;
            margin-bottom: 20px;
            color: #1a73e8;
            font-weight: 700;
            font-size: 28px;
            text-align: center;
        }
        .invoice-info {
            margin-bottom: 20px;
            font-size: 14px;
            color: #333;
        }
        .invoice-info strong {
            width: 120px;
            display: inline-block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(26, 115, 232, 0.1);
        }
        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
            text-align: left;
        }
        th {
            background-color: #1a73e8;
            color: white;
            font-weight: 600;
        }
        tfoot td {
            font-weight: 700;
            font-size: 16px;
            border-top: 2px solid #1a73e8;
        }
        #btnDownload {
            margin-top: 25px;
            padding: 12px 30px;
            font-size: 16px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            width: 100%;
            max-width: 250px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 600;
        }
        #btnDownload:hover {
            background-color: #155ab6;
        }
    </style>



    <div class="invoice-container">
        <div class="invoice-header">
            Invoice
        </div>

        <div class="invoice-info">
            <p><strong>Invoice Number:</strong> <%= InvoiceNumber %></p>
            <p><strong>Date: </strong> <%= now %></p>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Qty</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Product A</td>
                    <td>2</td>
                    <td>R15.00</td>
                    <td>R30.00</td>
                </tr>
                <tr>
                    <td>Product B</td>
                    <td>1</td>
                    <td>R25.00</td>
                    <td>R25.00</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" style="text-align:right">Total:</td>
                    <td>R55.00</td>
                </tr>
            </tfoot>
        </table>



        <asp:Button ID="btnDownload" class="btn btn-login" runat="server" Text="Download PDF" />
 
    </div>
</asp:Content>


