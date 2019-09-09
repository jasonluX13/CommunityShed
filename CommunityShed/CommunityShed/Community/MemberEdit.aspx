<%@ Page Title="" Language="C#" MasterPageFile="~/CommunityShed.Master" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" Inherits="CommunityShed.Community.MemberEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-row align-items-left">
        <div class="form-group col-auto">
            <asp:CheckBox ID="Enforcer" Text="Enforcer" runat="server" />
        </div>

        <div class="form-group col-auto">
            <asp:CheckBox ID="Reviewer" Text="Reviewer" runat="server" />
        </div>

        <div class="form-group col-auto">
            <asp:CheckBox ID="Approver" Text="Approver" runat="server" />
        </div>

        

        <div class="form-group col-auto">
            <asp:Button ID="Save" class="btn btn-primary" runat="server" Text="Save" OnClick="Save_Click" />
            <asp:Button ID="Cancel" class="btn btn-primary" runat="server" Text="Cancel" OnClick="Cancel_Click" />
        </div>
    </div>
</asp:Content>
