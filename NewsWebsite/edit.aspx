<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="edit" Codebehind="edit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <article class="edit">
        <div id="delUser" class="admin-del-user">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [useid] = @original_useid AND [username] = @original_username AND [password] = @original_password AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL))" InsertCommand="INSERT INTO [users] ([username], [password], [sex], [email], [phone]) VALUES (@username, @password, @sex, @email, @phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [username] = @username, [password] = @password, [sex] = @sex, [email] = @email, [phone] = @phone WHERE [useid] = @original_useid AND [username] = @original_username AND [password] = @original_password AND (([sex] = @original_sex) OR ([sex] IS NULL AND @original_sex IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_useid" Type="Int32" />
                    <asp:Parameter Name="original_username" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_sex" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_phone" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="original_useid" Type="Int32" />
                    <asp:Parameter Name="original_username" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_sex" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_phone" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <h2>用户管理</h2>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataKeyNames="useid" DataSourceID="SqlDataSource2" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" Width="100%">
                <Columns>
                    <asp:BoundField DataField="useid" HeaderText="useid" InsertVisible="False" ReadOnly="True" SortExpression="useid" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="#delUser" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="#delUser" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="#delUser"  CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="#delUser" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle ForeColor="#FFFFCC" HorizontalAlign="Center" />
            </asp:GridView>
            <div>
                <asp:GridView ID="GridView3" runat="server"></asp:GridView>
<ul class="sidebar-admin-ul"><li class="sidebar-admin-li"><a href="#">关闭</a></li></ul>
            </div>
           
        </div>
     
        <div class="wrapper">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT * FROM [files]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [files] WHERE [fileid] = @original_fileid AND (([filename] = @original_filename) OR ([filename] IS NULL AND @original_filename IS NULL)) AND (([type] = @original_type) OR ([type] IS NULL AND @original_type IS NULL)) AND (([filecontent] = @original_filecontent) OR ([filecontent] IS NULL AND @original_filecontent IS NULL)) AND (([publisher] = @original_publisher) OR ([publisher] IS NULL AND @original_publisher IS NULL)) AND (([publishdate] = @original_publishdate) OR ([publishdate] IS NULL AND @original_publishdate IS NULL)) AND (([visitnum] = @original_visitnum) OR ([visitnum] IS NULL AND @original_visitnum IS NULL))" InsertCommand="INSERT INTO [files] ([filename], [type], [filecontent], [publisher], [publishdate], [visitnum]) VALUES (@filename, @type, @filecontent, @publisher, @publishdate, @visitnum)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [files] SET [filename] = @filename, [type] = @type, [filecontent] = @filecontent, [publisher] = @publisher, [publishdate] = @publishdate, [visitnum] = @visitnum WHERE [fileid] = @original_fileid "></asp:SqlDataSource>

            <asp:HyperLink ID="HyperLink3" runat="server" Height="24px" NavigateUrl="~/insert.aspx" Width="140px">新建文章</asp:HyperLink>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="filename" HeaderText="文章标题" SortExpression="filename">
                        <HeaderStyle BackColor="White" ForeColor="White" />
                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="type" HeaderText="文章类别" SortExpression="type">
                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="publisher" HeaderText="小编" SortExpression="publisher">
                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="publishdate" DataFormatString="{0:D}" HeaderText="发表日期" SortExpression="publishdate">
                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>

                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/updata.aspx?id="+Eval("fileid") %>' Text='<%# "编辑" %>'></asp:HyperLink>

                        </ItemTemplate>
                        <ItemStyle BackColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('你确定删除？');" Text='<%# "删除" %>' CommandArgument='<%# Eval("fileid") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle BackColor="Black" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle BorderStyle="Solid" BorderWidth="1px" />
                <SelectedRowStyle BorderStyle="Solid" BorderWidth="1px" />
                <SortedAscendingCellStyle BorderWidth="1px" />
            </asp:GridView>
        </div>
    </article>
</asp:Content>

