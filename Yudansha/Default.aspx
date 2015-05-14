<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="Default.aspx.cs" Inherits="Yudansha.Default" %>

<%@ Register Src="~/usercontrols/yudansha/AllStudents.ascx" TagPrefix="uc1" TagName="AllStudents" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
        <uc1:AllStudents runat="server" id="AllStudents" />
</asp:Content>
