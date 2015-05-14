<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AllStudents.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.AllStudents" %>
<script src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    //http://www.datatables.net/examples/basic_init/
    $(document).ready(function () {
        $('#GridView1').DataTable({
            "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],
            "pageLength": -1
        });
    });
</script>

<div class="mainDiv">
    <div style="width:100%; margin: auto; text-align: center;">
        <asp:Button ID="ButtonDownload" runat="server" Text="Download as Excel file" OnClick="ButtonDownload_Click" ToolTip="Excel will complain about the file format, just click Yes"/>
    </div>
    <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1" OnRowDataBound="GridView1_RowDataBound" CssClass="display">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Full Name" SortExpression="Last">
                <ItemTemplate>
                    <asp:HyperLink ID="DetailLink" runat="server"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RankName" HeaderText="Current Rank" />
            <asp:BoundField DataField="RankNumber" HeaderText="Cert #" />
            <asp:BoundField DataField="RankDate" HeaderText="Rank Date" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Dojo">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# string.Format("{1}?dojo={0}", Eval("RankDojo"), Request.Url.AbsolutePath) %>'>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RankDojo") %>'></asp:Label>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sensei">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# string.Format("{1}?sensei={0}", Eval("RankSensei"), Request.Url.AbsolutePath) %>'>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RankSensei") %>'></asp:Label>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# string.Format("{1}?country={0}", Eval("Country"), Request.Url.AbsolutePath) %>'>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# string.Format("{1}?city={0}", Eval("City"), Request.Url.AbsolutePath) %>'>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="StudentsId" HeaderText="StudentsId" Visible="False" />
        </Columns>
        <EmptyDataTemplate>
            no data
        </EmptyDataTemplate>
    </asp:GridView>
</div>

<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteStudent" InsertMethod="InsertStudent" SelectMethod="GetAllStudents" TypeName="Yudansha.Models.DAL" UpdateMethod="UpdateStudent" OnDeleting="ObjectDataSource1_Deleting" OnSelecting="ObjectDataSource1_Selecting" OnSelected="ObjectDataSource1_Selected">
    <SelectParameters>
        <asp:Parameter Name="dojo" Type="String" />
        <asp:Parameter Name="sensei" Type="String" />
        <asp:Parameter Name="country" Type="String" />
        <asp:Parameter Name="city" Type="String" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="studentId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="studentId" Type="Int32" />
        <asp:Parameter Name="first" Type="String" />
        <asp:Parameter Name="last" Type="String" />
        <asp:Parameter Name="middle" Type="String" />
        <asp:Parameter Name="pictureUrl" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
