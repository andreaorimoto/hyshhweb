<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YudanshaNav.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.YudanshaNav" %>
<div class="yudanshaNav">
    <a href="/yudansha/">All students</a>
    <a href="/yudansha/insertnewstudent">Insert New</a>
    <a href="/yudansha/promotioneligibility">Promotion Eligibility</a>
    <a href="/yudansha/missingranks">Missing Ranks</a>
    <a href="/yudansha/statistics/">Statistics</a>
    <span style="float: right;">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton></span>
</div>
