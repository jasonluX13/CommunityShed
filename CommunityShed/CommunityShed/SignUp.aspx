<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CommunityShed.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>SignUp</h1>
    <fieldset>
        <div>
           <asp:textbox ID="FirstName" runat="server" placeholder="First Name"></asp:textbox> 
        </div>
        <div>
            <asp:TextBox ID="LastName" runat="server" placeholder="Last Name"></asp:TextBox>
        </div>
        <div>
           <asp:textbox ID="Email" runat="server" placeholder="Email"></asp:textbox> 
        </div>
        <div>
            <asp:TextBox ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="SignUpButton" Text="SignUp" cssclass="btn btn-primary" runat="server" OnClick="SignUpButton_Click"/>
        </div>
        <asp:Label ID="ErrorMessage" runat="server" Visible="false" ForeColor="Red">Error, email already exists</asp:Label>
    </fieldset>

</asp:Content>
