<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Addstudent.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.Addstudent" %>
<div class="mainDiv">
    <h2>Insert a new student</h2>
    <span class="note">* required field</span>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource3" DefaultMode="Insert" CellPadding="10" ForeColor="#333333" ValidateRequestMode="Enabled" EnableViewState="True" OnDataBound="DetailsView1_DataBound">
        <CommandRowStyle BackColor="#FFFFFF" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFFFF" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="First*" SortExpression="First">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxFirst" runat="server" Text='<%# Bind("First") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBoxFirst" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ControlStyle Width="300px" />
                <ItemStyle Width="320px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last*" SortExpression="Last">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxLast" runat="server" Text='<%# Bind("Last") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBoxLast" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ControlStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Middle" SortExpression="Middle">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxMiddle" runat="server" Text='<%# Bind("Middle") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ControlStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ControlStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:Button ID="ButtonInsert" runat="server" CausesValidation="True" CommandName="Insert" Text="Creat New Student" ClientIDMode="Static" />
                    &nbsp;<asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:Panel ID="PanelExistingStudents" Visible="False" runat="server" ClientIDMode="Static">
        <div>
            <table>
                <tr>
                    <td style="width: 80px;">
                        <img src="/images/warning-icon-hi.png" />
                    </td>
                    <td>
                        <h1>This name is already in the database.</h1>
                        Either edit one of the existing records below by clicking on the name, <strong>OR</strong> continue creating the new student
                        <asp:Button ID="CreateNewButton" runat="server" Text="Create New Student" OnClick="CreateNewButton_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridViewExistingStudents" runat="server" OnRowDataBound="GridViewExistingStudents_RowDataBound" AutoGenerateColumns="false" ClientIDMode="Static">
            <Columns>
                <asp:TemplateField HeaderText="Full Name">
                    <ItemTemplate>
                        <asp:HyperLink ID="DetailLink" runat="server"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RankNumber" HeaderText="Cert #" />
                <asp:BoundField DataField="RankName" HeaderText="Current Rank" />
                <asp:BoundField DataField="RankDojo" HeaderText="Dojo" />
                <asp:BoundField DataField="RankSensei" HeaderText="Sensei" />
            </Columns>
        </asp:GridView>
        <style>
            #PanelExistingStudents {
                margin-top: 20px;
            }

            #GridViewExistingStudents {
                margin-top: 20px;
            }

            #GridViewExistingStudents td, th {
                padding: 15px;
            }

        </style>
    </asp:Panel>
</div>
<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" InsertMethod="InsertStudent" SelectMethod="GetStudent" TypeName="Yudansha.Models.DAL" OnInserting="ObjectDataSource3_Inserting" OnInserted="ObjectDataSource3_Inserted" OldValuesParameterFormatString="original_{0}" OnDataBinding="ObjectDataSource3_DataBinding" OnSelected="ObjectDataSource3_Selected" OnSelecting="ObjectDataSource3_Selecting">
    <InsertParameters>
        <asp:Parameter Name="first" Type="String" />
        <asp:Parameter Name="last" Type="String" />
        <asp:Parameter Name="middle" Type="String" />
        <asp:Parameter Name="pictureUrl" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter Name="studentId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
