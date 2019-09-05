<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommunityShed.Default" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Welcome to your Community Sheds</h1>
    <div>
        <asp:Repeater ID="Communities" runat="server" ItemType="DataRow">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th>Community Name</th>
                        <th>Community Status</th>
                        <th>&nbsp;</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.Field<string>("CommunityName") %></td>
                    <td><%# Item.Field<bool>("Open") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
