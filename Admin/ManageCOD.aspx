﻿<%@ Page  Title="Best Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageCOD.aspx.cs" Inherits="Admin_ManageCOD" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $("#form1").validate();
    </script>
    <div class="widget">
        <div class="head">
            <h5 class="iList">Manage COD
            </h5>
        </div>
        <div class="rowElem noborder">
            <label>
                MAX COD Amount:<span class="req">*</span></label>
            <div class="formRight">
                <asp:TextBox ID="txtAmount" runat="server" CssClass="required" placeholder="Maximum Amount Till the Cash On Delivery Is Valid"></asp:TextBox>
                <asp:FilteredTextBoxExtender runat="server" ID="ftbe" TargetControlID="txtAmount" ValidChars=".0123456789" FilterMode="ValidChars"></asp:FilteredTextBoxExtender>
                <div class="fix">
                </div>
            </div>
        </div>   
    <div class="submitForm" style="width: 100%">
        <div style="float: right">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="redBtn"
                OnClick="btnSubmit_Click" />
        </div>
        <div style="float: right; padding-top: 5px; padding-right: 10px;">
            <asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblMsg" runat="server" Text="" CssClass="txtError"></asp:Label>
        </div>
    </div>
    <div class="fix">
    </div>
    <div style="width: 100%; text-align: center; padding-top: 10px;">
        <asp:Label ID="lblDeleteMsg" runat="server" Text="" CssClass="txtError"></asp:Label>
    </div>
     </div>
    <div class="table">
        <div class="head">
            <h5 class="iFrames">All Record
            </h5>
        </div>
        <asp:Repeater ID="rptr" runat="server" OnItemCommand="rptr_ItemCommand">
            <HeaderTemplate>
                <table cellpadding="0" cellspacing="0" border="0" id="Column1" class="display">
                    <thead>
                        <tr>
                            <th align="left">COD Limit
                            </th>

                            <th>Action
                            </th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="gradeA">
                    <td>
                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("CODLimit")%>'></asp:Label>
                    </td>
                    <td class="center">
                        <asp:LinkButton ID="lnkbtnEdit" runat="server" CausesValidation="false" CommandArgument='<%# Bind("Id") %>'
                            CommandName="EditGroup" Text="Edit" OnClientClick="javascript:window.scrollTo(150,0);"></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody> </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

