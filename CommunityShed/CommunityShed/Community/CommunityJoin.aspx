<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="CommunityJoin.aspx.cs" Inherits="CommunityShed.Community.CommunityJoin" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-3">
        <asp:textbox id="SearchText" runat="server" CssClass="form-control mr-sm-2" placeholder="Search" aria-label="Search" />
        <asp:button id="Search" runat="server" cssclass="btn btn-outline-success my-2 my-sm-0" text="Search" OnClick="Search_Click"></asp:button>
    </div>

    <asp:Repeater ID="Communities" runat="server" ItemType="DataRow">
            <HeaderTemplate>
                <table class="table table-striped tabled-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Community Name</th>
                            <th>Owner</th>
                            <th>Open</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.Field<string>("CommunityName") %></td>
                    <td><%# Item.Field<string>("OwnerName") %></td>
                    <td><%# Item.Field<bool>("Open") %></td>
                    <td><asp:hyperlink runat="server" class="btn btn-sl btn-outline-info" navigateurl='<%# $"~/Community/CommunityDetails.aspx?ID={Item.Field<int>("Id")}" %>' text="Details" /></td>
                    <td><asp:hyperlink runat="server" class="btn btn-sl btn-outline-info" navigateurl='<%# $"~/Community/Join.aspx?ID={Item.Field<int>("Id")}" %>' text="Join" /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

</asp:Content>
