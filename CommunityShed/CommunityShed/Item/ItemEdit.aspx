<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="ItemEdit.aspx.cs" Inherits="CommunityShed.Item.ItemEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
    <h2>
        <asp:Label runat="server">Edit Item</asp:Label>
    </h2>
    <div class="form-row align-items-left">
        <div class="form-group col-auto">
            <asp:TextBox class="form-control" ID="ItemName" runat="server" placeholder="Item Name" />
        </div>

        <div class="form-group col-auto">

            <asp:TextBox class="form-control" ID="Usage" runat="server" placeholder="Usage" />
        </div>

        <div class="form-group col-auto">

            <asp:TextBox class="form-control" ID="Warning" runat="server" placeholder="Warning" />
        </div>

        <div class="form-group col-auto">

            <asp:TextBox class="form-control" ID="Age" runat="server" placeholder="Age" />
        </div>

        <div class="form-group col-auto">
            <asp:Button ID="Save" class="btn btn-primary" runat="server" Text="Save" OnClick="Save_Click" />
            <asp:Button ID="Cancel" class="btn btn-primary" runat="server" Text="Cancel" OnClick="Cancel_Click" />
        </div>
    </div>



</fieldset>
</asp:Content>
