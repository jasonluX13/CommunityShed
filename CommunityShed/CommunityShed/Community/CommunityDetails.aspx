<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="CommunityDetails.aspx.cs" Inherits="CommunityShed.Community.CommunityDetails" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Community: </h1>

    <div>
        <asp:Label ID="OwnerLabel" text="Owner: " runat="server" />
    </div>

    <div>
        <asp:Label ID="OpenLabel" Text="Privacy: " runat="server" />
    </div>

    <div>
        <asp:Repeater ID="Items" runat="server" ItemType="DataRow">

        </asp:Repeater>
    </div>
</asp:Content>
