<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="MyRoles.aspx.cs" Inherits="CommunityShed.Roles.MyRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="display-3 text-center">Your Roles</h1>
    <div>
        <asp:Repeater ID="Roles" runat="server" ItemType="DataRow">
            <HeaderTemplate>
                <table class="table table-striped tabled-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Community Name</th>
                            <th>RoleName</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.Field<string>("CommunityName") %></td>
                    <td><%# Item.Field<string>("RoleName") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
