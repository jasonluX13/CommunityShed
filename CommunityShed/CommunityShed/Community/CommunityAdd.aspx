<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="CommunityAdd.aspx.cs" Inherits="CommunityShed.Community.CommunityAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <div class="form-group">
            <asp:label ID="CommunityNameLabel" runat="server" Text="Community Name: " />
            <asp:textbox class="form-control" ID="CommunityName" runat="server" placeholder="Community Name" />
        </div>

        <div class="form-group">
            <asp:Label ID="OpenLabel" runat="server" Text="Community Privacy: " />
            <asp:DropDownList ID="OpenList"
                class="form-control"
                AutoPostBack="true"
                runat="server" >
                <asp:ListItem Selected="True" Value="Open">Open</asp:ListItem>
                <asp:ListItem Value="Closed">Closed</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div>
            <asp:Button ID="Submit" text="Submit" class="btn btn-outline-secondary" OnClick="Submit_Click" runat="server" />
        </div>
    </fieldset>
</asp:Content>
