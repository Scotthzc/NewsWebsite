<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="type" Codebehind="type.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div class="type_top1">
             <span>分类类型：</span>
             <asp:Label ID="type1" runat="server" Text="Label"></asp:Label>
             <asp:LinkButton ID="type1_b" runat="server" CssClass="type_img" OnClick="type1_b_Click">×</asp:LinkButton>
             <asp:Label ID="type2" runat="server" Text="Label"></asp:Label>
             <asp:LinkButton ID="type2_b" runat="server" CssClass="type_img" OnClick="type2_b_Click">×</asp:LinkButton>
         </div>
        <div class="type_top2">
            <span>分类类别：</span>
            <asp:LinkButton ID="Android" runat="server" OnClick="Android_Click">Android</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Web" runat="server" OnClick="Web_Click">Web</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="IT" runat="server" OnClick="IT_Click">IT技术</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Markdown" runat="server" OnClick="Markdown_Click">Markdown</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="java" runat="server" OnClick="java_Click">java</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="quan" runat="server" OnClick="quan_Click">全部</asp:LinkButton>
           
        </div>
        <article class="index" style="margin-top:2px;">
            <div class="type_wrapper">
                
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT * FROM [files]"   ></asp:SqlDataSource>
            </div>
        </article>
   
</asp:Content>

