<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="True"  Inherits="_Default" Codebehind="index.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <article class="index">
            <div class="wrapper">
                
                <asp:GridView ID="GridView1" CssClass="gridview" runat="server" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="SqlDataSource1" GridLines="None" ShowHeader="False" AllowPaging="True" AllowSorting="True">
                    
                    <Columns>
                        <asp:BoundField DataField="publishdate" HeaderText="publishdate" ShowHeader="False" SortExpression="publishdate" Visible="False" />
                        <asp:TemplateField SortExpression="filename">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="item" ID="HyperLink" runat="server" Text='<%# "<h2>["+Eval("type", "{0}")+"]  "+Eval("filename", "{0}")+"</h2><br/><h5>发表于 "+Eval("publishdate", "{0:d}")+"</h5><br/><p>"+Eval("filecontent","{0}").ToString().Substring(0,50)+"...</p><br/><hr/>" %>' BorderStyle="None" NavigateUrl='<%# "content.aspx?id="+Eval("fileid") %>'></asp:HyperLink>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                    <HeaderStyle BorderStyle="None" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT * FROM [files]"></asp:SqlDataSource>
            </div>
        </article>
</asp:Content>

