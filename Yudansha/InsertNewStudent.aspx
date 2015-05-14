<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertNewStudent.aspx.cs" Inherits="Yudansha.InsertNewStudent" %>

<%@ Register Src="~/usercontrols/yudansha/Addstudent.ascx" TagPrefix="uc1" TagName="Addstudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:Addstudent runat="server" id="Addstudent" />
</asp:Content>
