<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommunityShed.Default" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="display-3 text-center">Your Community Sheds</h1>
    <div>
        <asp:Repeater ID="Communities" runat="server" ItemType="DataRow">
            <HeaderTemplate>
                <table class="table table-striped tabled-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Community Name</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.Field<string>("CommunityName") %></td>
                    <td><asp:hyperlink runat="server" class="btn btn-sl btn-outline-info" navigateurl='<%# $"~/Community/CommunityDetails.aspx?ID={Item.Field<int>("CommunityId")}" %>' text="Details" /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <div>
        <asp:hyperlink runat="server" class="btn btn-lg btn-info" navigateurl="~/Community/CommunityAdd.aspx">Create New Community</asp:hyperlink>
    </div>
    <br /><br />
    <div>
        <asp:hyperlink runat="server" class="btn btn-lg btn-info" navigateurl="~/Community/CommunityJoin.aspx">Join a New Community</asp:hyperlink>
    </div>

</asp:Content>
