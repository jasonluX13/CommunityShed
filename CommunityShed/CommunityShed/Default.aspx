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
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.Field<string>("CommunityName") %></td>
                    <td><asp:hyperlink runat="server" class="btn btn-sl btn-outline-info" navigateurl='<%# $"~/Community/CommunityDetails.aspx?ID={Item.Field<int>("CommunityId")}" %>' text="Details" /></td>
                    <td><asp:hyperlink runat="server" class="btn btn-sl btn-outline-info" navigateurl='<%# $"~/Community/CommunityMembers.aspx?ID={Item.Field<int>("CommunityId")}" %>' text="Members" /></td>
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

    <h2 class="display-3 text-center">Posted Items</h2>
        <div>
            <asp:Repeater ID="ItemsPosted" runat="server" ItemType="DataRow">
                <HeaderTemplate>
                    <table class="table table-striped tabled-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Item Name</th>
                                <th>Usage</th>
                                <th>Warning</th>
                                <th>Age</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.Field<string>("ItemName") %></td>
                        <td><%# Item.Field<string>("Usage") %></td>
                        <td><%# Item.Field<string>("Warning") %></td>
                        <td><%# Item.Field<string>("Age") %></td>
                        <td></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    <h2>Requests</h2>
    <div>
            <asp:Repeater ID="Requests" runat="server" ItemType="DataRow">
                <HeaderTemplate>
                    <table class="table table-striped tabled-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Item Name</th>
                                <th>Requested User</th>
                                <th>Community</th>
                                <th>Date Requested</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.Field<string>("ItemName") %></td>
                        <td><%# Item.Field<string>("BorrowerName") %></td>
                        <td><%# Item.Field<string>("CommunityName") %></td>
                        <td><%# Item.Field<DateTimeOffset>("DateRequested") %></td>
                        <td></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

</asp:Content>
