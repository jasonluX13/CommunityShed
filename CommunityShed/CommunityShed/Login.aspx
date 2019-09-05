<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CommunityShed.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login</h1>
    <fieldset>
        <div>
           <asp:textbox ID="Email" runat="server" placeholder="Email"></asp:textbox> 
        </div>
        <div>
            <asp:TextBox ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="LoginButton" Text="Login" runat="server" OnClick="LoginButton_Click" />
        </div>
        <asp:Label ID="ErrorMessage" runat="server" Visible="false" ForeColor="Red">Error, either username or password is incorrect</asp:Label>
    </fieldset>
</asp:Content>
