<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentsWithMissingRanks.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.StudentsWithMissingRanks" %>
<script src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    //http://www.datatables.net/examples/basic_init/
    $(document).ready(function () {
        $('#GridView1').DataTable({
            "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],
            "pageLength": -1,
            "order": [[4, "desc"], [0, "asc"]]
        });
    });
</script>

<div class="mainDiv">
    <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDataBound="GridView1_RowDataBound" CssClass="display" OnDataBound="GridView1_DataBound" DataSourceID="ObjectDataSource1" Width="60%">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Full Name" SortExpression="Last">
                <ItemTemplate>
                    <asp:HyperLink ID="DetailLink" runat="server" Enabled="False"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="# Missing Ranks">
                <ItemTemplate>
                    <asp:Label runat="server" ID="LabelMissingRanks" Text='<%# Eval("RankInt") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="All Ranks">
                <ItemTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="300px">
                        <Columns>
                            <asp:BoundField DataField="RankName" HeaderText="Rank" >
                            <ItemStyle Width="40%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RankNumber" HeaderText="#" >
                            <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RankDate" HeaderText="Date" DataFormatString="{0:d}" >

                            <ItemStyle Width="40%" />
                            </asp:BoundField>

                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" Text="Forget this, it's complete" OnClick="Button1_Click" /><br />
                    <br />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Ah! Go and Edit" OnClick="Button2_Click" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            no results
        </EmptyDataTemplate>
    </asp:GridView>
</div>

<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetStudentsWithMissingRanks" TypeName="Yudansha.Models.DAL"></asp:ObjectDataSource>


