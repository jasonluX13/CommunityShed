<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="ItemAdd.aspx.cs" Inherits="CommunityShed.Item.ItemAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>

        <div>
            <asp:TextBox ID="ItemName" placeholder="Item Name" runat="server"/>
        </div>
        
        <div>
            <asp:TextBox ID="Usage" placeholder="Usage" runat="server" />
        </div>

        <div>
            <asp:TextBox ID="Warning" placeholder="Warnings" runat="server" />
        </div>

        <div>
            <asp:textbox ID="Age" placeholder="Age" runat="server" />
        </div>

        <div>
            <asp:button id="Submit" text="Submit" OnClick="Submit_Click" runat="server"/> 
        </div>
    </fieldset>
</asp:Content>
