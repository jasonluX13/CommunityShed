<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="CommunityDetails.aspx.cs" Inherits="CommunityShed.Community.CommunityDetails" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center display-2">
        <asp:Label ID="CommunityLabel" Text="Community: " runat="server" />
    </h1>

    <fieldset>
        <dl class="row">
            <dt class="col-sm-3">Owner</dt>
            <dd class="col-sm-9">
                <asp:Label ID="OwnerLabel" text="Owner: " runat="server" />
            </dd>
            <dt class="col-sm-3">Privacy</dt>
            <dd class="col-sm-9">
                <asp:Label ID="OpenLabel" Text="Privacy: " runat="server" />
            </dd>
        </dl>
        <%--<h2>
            <asp:Label ID="OwnerLabel" text="Owner: " runat="server" />
        </h2>--%>

      <%--  <h2>
            <asp:Label ID="OpenLabel" Text="Privacy: " runat="server" />
        </>--%>

        <h2 class="text-center display-2">Community Items</h2>
        <div class="col-3">
            <asp:textbox id="SearchText" runat="server" CssClass="form-control mr-sm-2" placeholder="Search Items" aria-label="Search" />
            <asp:button id="Search" runat="server" cssclass="btn btn-outline-success my-2 my-sm-0" text="Search" onclick="Search_Click"></asp:button>
        </div>

        <div>
            <asp:Repeater ID="Items" runat="server" ItemType="DataRow">
                <HeaderTemplate>
                    <table class="table table-striped tabled-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Item Name</th>
                                <th>Owner Name</th>
                                <th>Usage</th>
                                <th>Warning</th>
                                <th>Age</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.Field<string>("ItemName") %></td>
                        <td><%# Item.Field<string>("OwnerName") %></td>
                        <td><%# Item.Field<string>("Usage") %></td>
                        <td><%# Item.Field<string>("Warning") %></td>
                        <td><%# Item.Field<string>("Age") %></td>
                        <td><asp:Button ID="Borrow" Text="Request to Borrow" OnClick="Borrow_Click" runat="server" /></td>
                        <td><asp:hyperlink Text="Edit" CssClass="btn btn-dark" NavigateUrl='<%# $"~/Item/ItemEdit.aspx?ID={Item.Field<int>("Id")}" %>' runat="server" /></td>
                        <td></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </fieldset>
    
</asp:Content>
