<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PromotionEligibility.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.PromotionEligibility" %>

<script src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    //http://www.datatables.net/examples/basic_init/
    $(document).ready(function () {
        $('#GridView1').DataTable({
            "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],
            "pageLength": -1,
            "order": [[4, "desc"],[0, "asc"]]
        });
    });
</script>

<div class="mainDiv">
    <div style="width: 100%; margin: auto; text-align: center; margin-bottom: 20px;">
        Months: <asp:TextBox ID="TextBoxMonths" runat="server" Width="50"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Months is required" ControlToValidate="TextBoxMonths" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Months must be a positive number" ValidationExpression="^\d+$" ControlToValidate="TextBoxMonths" SetFocusOnError="True" >*</asp:RegularExpressionValidator>
        <asp:DropDownList ID="DropDownListRanks" runat="server"></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Search" CausesValidation="true" OnClick="Button1_Click" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  />
    </div>
    <div style="width: 100%; margin: auto; text-align: center;">
        <asp:Button ID="ButtonDownload" Visible="False" runat="server" Text="Download as Excel file" OnClick="ButtonDownload_Click" ToolTip="Excel will complain about the file format, just click Yes" />
    </div>
    <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDataBound="GridView1_RowDataBound" CssClass="display" OnDataBound="GridView1_DataBound">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Full Name" SortExpression="Last">
                <ItemTemplate>
                    <asp:HyperLink ID="DetailLink" runat="server" Enabled="False"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RankName" HeaderText="Current Rank" />
            <asp:BoundField DataField="RankNumber" HeaderText="Cert #" />
            <asp:BoundField DataField="RankDate" HeaderText="Rank Date" DataFormatString="{0:d}" />
            <asp:TemplateField ConvertEmptyStringToNull="True" HeaderText="Months">
                <ItemTemplate>
                    <asp:Label ID="LabelDate" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RankDojo" HeaderText="Dojo" />
            <asp:BoundField DataField="RankSensei" HeaderText="Sensei" />
            <asp:BoundField DataField="Country" HeaderText="Country" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="StudentsId" HeaderText="StudentsId" Visible="False" />
        </Columns>
        <EmptyDataTemplate>
            no results
        </EmptyDataTemplate>
    </asp:GridView>
</div>

