<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentDetail.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.StudentDetail" %>

<script src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var cities = [
            <%= GetCities() %>
        ];
        var countries = [
            <%= GetCountries() %>
        ];
        $("#TextBoxInsertCountry").autocomplete({
            source: countries
        });
        $("#TextBoxInsertCity").autocomplete({
            source: cities
        });
        $("#TextBoxEditCountry").autocomplete({
            source: countries
        });
        $("#TextBoxEditCity").autocomplete({
            source: cities
        });
    });
</script>
<div class="mainDiv">
    <asp:GridView ID="GridView1" CssClass="display" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="Id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="10" ForeColor="Black" GridLines="Both">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:Button>
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Last" HeaderText="Last" SortExpression="Last" />
            <asp:BoundField DataField="First" HeaderText="First" SortExpression="First" />
            <asp:BoundField DataField="Middle" HeaderText="Middle" SortExpression="Middle" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        <EmptyDataTemplate>
            No data
        </EmptyDataTemplate>
        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
    </asp:GridView>
    <br />
    <h2>All ranks for this student</h2>
    <asp:GridView ID="GridView2" CssClass="display" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" DataKeyNames="Id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="10" ForeColor="Black" Width="100%">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="editRank"></asp:Button>
                    &nbsp;<asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:Button>
                    &nbsp;<asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');"></asp:Button>
                </ItemTemplate>
                <HeaderStyle Width="150px" />
                <ItemStyle Width="150px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Rank" SortExpression="RankName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" OnLoad="DropDownList2_Load" SelectedValue=<%# Bind("RankName") %>></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("RankName") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="RankDate">
                <EditItemTemplate>
                    <asp:TextBox ClientIDMode="Static" ID="TextBoxEditRankDate" runat="server" Text='<%# Bind("RankDate", "{0:d}") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="TextBoxEditRankDate" Display="Dynamic" SetFocusOnError="true" ValidationGroup="editRank"></asp:RequiredFieldValidator>
                    <script type="text/javascript">
                        // http://jqueryui.com/datepicker/
                        $("#TextBoxEditRankDate").datepicker({
                            changeMonth: true,
                            changeYear: true,
                            minDate: '-50Y'
                        });

                    </script>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RankDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RankSensei" HeaderText="Sensei" SortExpression="RankSensei" />
            <asp:BoundField DataField="RankDojo" HeaderText="Dojo" SortExpression="RankDojo" />
            <asp:BoundField DataField="RankNumber" HeaderText="Cert #" SortExpression="RankNumber">
            <ControlStyle Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Country" SortExpression="Country">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEditCountry" ClientIDMode="Static" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ValidationGroup="editRank" ControlToValidate="TextBoxEditCountry"></asp:RequiredFieldValidator> 
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEditCity" ClientIDMode="Static" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ValidationGroup="editRank" ControlToValidate="TextBoxEditCity"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="StudentsId" HeaderText="StudentsId" SortExpression="StudentsId" Visible="False" />
        </Columns>
        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
        <EmptyDataTemplate>
            There are no ranks for this student, please add a rank below
        </EmptyDataTemplate>
    </asp:GridView>
    <div>
        <br />
        <h2>Insert a new Rank for this student</h2>
        <span class="note">* required field</span>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource2" DefaultMode="Insert" CellPadding="10" ForeColor="#333333" OnItemInserted="DetailsView1_ItemInserted" ValidateRequestMode="Enabled" OnItemInserting="DetailsView1_ItemInserting">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFFF" Font-Bold="True" />
            <EditRowStyle BackColor="#FFFFFF" />
            <FieldHeaderStyle BackColor="#FFFFFF" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="Rank*" SortExpression="RankName">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" OnLoad="DropDownList1_Load"></asp:DropDownList>
                    </InsertItemTemplate>
                    <ControlStyle Width="300px"></ControlStyle>
                    <ItemStyle Width="320px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date*" SortExpression="RankDate">
                    <InsertItemTemplate>
                        <asp:TextBox ClientIDMode="Static" ID="TextBoxInsertRankDate" runat="server" Text='<%# Bind("RankDate") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBoxInsertRankDate" Display="Dynamic" ValidationGroup="insertRank" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <!-- https://www.safaribooksonline.com/library/view/regular-expressions-cookbook/9781449327453/ch04s04.html -->
                        <script type="text/javascript">
                            // http://jqueryui.com/datepicker/
                            $("#TextBoxInsertRankDate").datepicker({
                                changeMonth: true,
                                changeYear: true,
                                minDate: '-50Y'
                            });

                        </script>
                    </InsertItemTemplate>
                    <ControlStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sensei" SortExpression="RankSensei">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RankSensei") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ControlStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dojo" SortExpression="RankDojo">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RankDojo") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ControlStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:TemplateField>
                <asp:BoundField DataField="RankNumber" HeaderText="Cert #" SortExpression="RankNumber">
                    <ControlStyle Width="300px" />
                    <ItemStyle Width="300px"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Country*" SortExpression="Country">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBoxInsertCountry" ClientIDMode="Static" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ControlToValidate="TextBoxInsertCountry" runat="server" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="insertRank"></asp:RequiredFieldValidator> 
                    </InsertItemTemplate>
                    <ControlStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City*" SortExpression="City">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBoxInsertCity" ClientIDMode="Static" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="TextBoxInsertCity" runat="server" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="insertRank"></asp:RequiredFieldValidator> 
                    </InsertItemTemplate>
                    <ControlStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidationGroup="insertRank" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Width="2000px" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
    </div>
</div>
<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="DeleteRank" InsertMethod="InsertRankForStudent" SelectMethod="GetRanksForStudent" TypeName="Yudansha.Models.DAL" UpdateMethod="UpdateRankForStudent" OldValuesParameterFormatString="original_{0}" OnUpdating="ObjectDataSource2_Updating" OnInserting="ObjectDataSource2_Inserting" OnDeleting="ObjectDataSource2_Deleting">
    <DeleteParameters>
        <asp:Parameter Name="rankId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="studentId" Type="Int32" />
        <asp:Parameter Name="rankName" Type="String" />
        <asp:Parameter Name="rankSensei" Type="String" />
        <asp:Parameter Name="rankDojo" Type="String" />
        <asp:Parameter Name="rankDate" Type="DateTime" />
        <asp:Parameter Name="rankNumber" Type="String" />
        <asp:Parameter Name="country" Type="String" />
        <asp:Parameter Name="city" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="studentId" QueryStringField="studentId" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="rankId" Type="Int32" />
        <asp:Parameter Name="rankName" Type="String" />
        <asp:Parameter Name="rankSensei" Type="String" />
        <asp:Parameter Name="rankDojo" Type="String" />
        <asp:Parameter Name="rankDate" Type="DateTime" />
        <asp:Parameter Name="rankNumber" Type="String" />
        <asp:Parameter Name="country" Type="String" />
        <asp:Parameter Name="city" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetStudent" TypeName="Yudansha.Models.DAL" UpdateMethod="UpdateStudent" OldValuesParameterFormatString="original_{0}" OnUpdating="ObjectDataSource1_Updating" DeleteMethod="DeleteStudent" OnDeleted="ObjectDataSource1_Deleted" OnDeleting="ObjectDataSource1_Deleting">
    <DeleteParameters>
        <asp:Parameter Name="studentId" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="studentId" QueryStringField="studentId" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="studentId" Type="Int32" />
        <asp:Parameter Name="first" Type="String" />
        <asp:Parameter Name="last" Type="String" />
        <asp:Parameter Name="middle" Type="String" />
        <asp:Parameter Name="pictureUrl" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
