<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="CommunityAdd.aspx.cs" Inherits="CommunityShed.Community.CommunityAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <div>
            <asp:label ID="CommunityNameLabel" runat="server" Text="Community Name: " />
            <asp:textbox ID="CommunityName" runat="server" />
        </div>

        <div>
            <asp:Label ID="OpenLabel" runat="server" Text="Community Privacy: " />
            <asp:DropDownList ID="OpenList"
                AutoPostBack="true"
                runat="server" >
                <asp:ListItem Selected="True" Value="Open">Open</asp:ListItem>
                <asp:ListItem Value="Closed">Closed</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div>
            <asp:Button ID="Submit" text="Submit" OnClick="Submit_Click" runat="server" />
        </div>
    </fieldset>
</asp:Content>
