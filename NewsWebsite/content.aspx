<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="True" Inherits="content" Codebehind="content.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <article class="content" runat="server">
            <div class="wrapper" Runat="Server">
                <asp:GridView CssClass="gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# "<h1>"+Eval("filename")+"</h1>" %>'></asp:Label>
                                <br />
                                <asp:Label  ID="Label2" runat="server" Text='<%# "<h5>发表于："+Eval("publishdate", "{0:D}") +"</h5>" %>'></asp:Label>
                                <br />
                                <asp:Label CssClass="content" ID="Label3" runat="server" Text='<%# "<div  id=\"article_content2\">"+Eval("filecontent")+"</div><div class=\"docstyle\" id=\"article_content\"></div>" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT [filename], [filecontent], [publishdate] FROM [files] WHERE ([fileid] = @fileid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fileid" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT * FROM [pinglun] WHERE ([fileid] = @fileid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fileid" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" DeleteCommand="DELETE FROM [pinglun] WHERE [id] = @original_id" InsertCommand="INSERT INTO [pinglun] ([fileid], [comment], [publishdate], [username]) VALUES (@fileid, @comment, @publishdate, @username)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [pinglun] WHERE ([fileid] = @fileid)" UpdateCommand="UPDATE [pinglun] SET [fileid] = @fileid, [comment] = @comment, [publishdate] = @publishdate, [username] = @username WHERE [id] = @original_id AND [fileid] = @original_fileid AND (([comment] = @original_comment) OR ([comment] IS NULL AND @original_comment IS NULL)) AND (([publishdate] = @original_publishdate) OR ([publishdate] IS NULL AND @original_publishdate IS NULL)) AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_fileid" Type="Int32" />
                            <asp:Parameter Name="original_comment" Type="String" />
                            <asp:Parameter Name="original_publishdate" Type="DateTime" />
                            <asp:Parameter Name="original_username" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="fileid" Type="Int32" />
                            <asp:Parameter Name="comment" Type="String" />
                            <asp:Parameter Name="publishdate" Type="DateTime" />
                            <asp:Parameter Name="username" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="fileid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="fileid" Type="Int32" />
                            <asp:Parameter Name="comment" Type="String" />
                            <asp:Parameter Name="publishdate" Type="DateTime" />
                            <asp:Parameter Name="username" Type="String" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_fileid" Type="Int32" />
                            <asp:Parameter Name="original_comment" Type="String" />
                            <asp:Parameter Name="original_publishdate" Type="DateTime" />
                            <asp:Parameter Name="original_username" Type="String" />
                        </UpdateParameters>
                </asp:SqlDataSource>
                    <asp:GridView ID="DiscussGridView" CssClass="discuss" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" GridLines="None" ShowHeader="False" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username">
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment">
                            <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="publishdate" HeaderText="publishdate" SortExpression="publishdate" />                            
                        </Columns>
                    </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource3" GridLines="None" HorizontalAlign="Center" ShowHeader="False" Visible="False" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
                        <asp:BoundField DataField="publishdate" HeaderText="publishdate" SortExpression="publishdate" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                    <div class="input-wrapper">
                        <asp:TextBox ID="TxtSpeak" CssClass="content-speak" Runat="Server" Rows="2" Columns="2"  ></asp:TextBox>
                        <div class="discuss-lock" Runat="Server" id="discuss"><p>未登陆无法发表评论，或者<a class="discuss-unlock">以游客的身份</a>发表评论</p></div>
                        <asp:Button  ID="submit" CssClass="button content-speak-submit"  runat="server" Text="提交" OnClick="submit_Click" />
                    </div>
                </div>
         
       </article>
     <script>
        var text = document.getElementById('article_content2').innerText;
        document.getElementById('article_content').innerHTML =
      marked(text);
  </script>
</asp:Content>

