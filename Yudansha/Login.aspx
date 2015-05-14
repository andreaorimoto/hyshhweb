<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Yudansha.Login" %>

<%@ Register Src="~/usercontrols/yudansha/YudanshaLogin.ascx" TagPrefix="uc1" TagName="YudanshaLogin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:YudanshaLogin runat="server" ID="YudanshaLogin" />
</asp:Content>
