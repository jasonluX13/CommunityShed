<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="CommunityMembers.aspx.cs" Inherits="CommunityShed.Community.CommunityMembers" %>

<%@ import namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center display-6">
        <asp:Label ID="CommunityLabel" Text="Community: " runat="server" />
    </h1>

    <div>
            <asp:Repeater ID="Members" runat="server" ItemType="DataRow">
                <HeaderTemplate>
                    <table class="table table-striped tabled-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Member Name</th>
                                <th>Role</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.Field<string>("MemberName") %></td>
                        <td><%# Item.Field<string>("RoleName") %></td>

                        <td><asp:hyperlink Text="Edit" CssClass="btn btn-dark" NavigateUrl='<%# $"~/Community/MemberEdit.aspx?ID={Item.Field<int>("Id")}&CID={Item.Field<int>("CommunityId")}" %>' runat="server" /></td>

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
</asp:Content>
