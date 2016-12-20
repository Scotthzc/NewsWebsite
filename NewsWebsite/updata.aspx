<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="updata" Codebehind="updata.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    $(function() {
        var editor = editormd("editormd", {
            
            path: "../lib/" // Autoload modules mode, codemirror, marked... dependents libs path
        });
        /*
        // or
        var editor = editormd({
            id   : "editormd",
            path : "../lib/"
        });
        */
        //NO.1 Maroon 5 feat. Wiz khalifa -payphone NO.2 The Wanted - Glad you came. NO.3 Flo rida - whistle No.4 chorus:gym class herose feat .neon hitch - ass back home No.5 Usher - Scream No.6 Ellie goulding - lights No.7 Jennifer lopez feat. Pitbull - dance again
        //No.8. Chris brown - dont wake me up. No.9 LMFAO - sorry for party rocking No.10 Fun - some nights No.11 jessie j - domino No12 chris brown - turn up the music No13 calvin harris feat ne-yo - lets go No14 Maroon 5 - one more night No15 carly rae jepson - call 
        //No47 Enrique Iglesias feat. Sammy Adams - Finally found you No48 Zedd feat. Matthew koma - spectrum No49 Madonna feat. M. I. A. Nicky minai - Give me all you luvin No50 Owl City/Carly Rae jepsen - Good time
        //No15 p!nk - blow me. No16. Flo rida feat. Sia - wild ones. No17 Rita Ora - how we do. No18 adele - set fire to the rain No19 katy perry - part of me No20 Ne-Yo - let me love you No21 Demi Lovato - Give your heart a break No22 Fun - we are young No23 Katy perry - wild wake
        //No 24 Nelly Furtado - big hoops. No25 Justin Bieber - boyfriend. No26 Cher Lloyd - want u back No27 Tyga - Back City No28 Owl City - good time No29 Nichi Minaj - starships No30 PSY - Gangnanstyle No31 Alex clare - too close No32 Usher - Climax
        //No33 Justin Bieber - As long As you love me No34 ke$ha - die young No35 One Direction - what makes you beautiful No36 Rihanna - Damonds No37 Nicki minaj - pound the alarm No38 Rihanna - where have you been No39 Adele - skyfall No40 David Guetta feat sia - Titanium
        //No41 One Direction - live while we are young No42 will.i.am/Eva simons - this is love No43 Chris Brown/Pitnull - International love No44 David Guetta - i can only imagine No45 Swedish House Mafia - Dont you worry child No46 Gotye feat. Kimbra - somebody that i used to know
    });
   
</script>
    <article class="updata" style="margin:0;">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT * FROM [files] WHERE ([fileid] = @fileid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fileid" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:GridView CssClass="gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="SqlDataSource1"  GridLines="None" ShowHeader="False">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <p>文章标题：<asp:TextBox CssClass="textbox" ID="txtfilename" runat="server" Text='<%# Bind("filename") %>'></asp:TextBox></p>
                        <br />
                       <p>文章类型：<asp:TextBox CssClass="textbox" ID="txttype" runat="server" Text='<%# Bind("type") %>'></asp:TextBox></p> 
                        <br />
                     <p>  文章作者：<asp:TextBox CssClass="textbox" ID="txtpublisher" runat="server" Text='<%# Bind("publisher") %>'></asp:TextBox></p> 
                        <br />
                           
                        
            
                <asp:Label ID="txtfilecontent" runat="server" Text='<%# "<div id=\"editormd_content\">"+Eval("filecontent")+"</div>" %>'></asp:Label>

         
           
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                </asp:GridView>
        <asp:Button CssClass="editormd-btn" ID="btnUpdata" runat="server"  OnClientClick="return confirm('确认保存？')" Text="保存修改" OnClick="Button1_Click" />
        <div style="width:100%;height:100%;">
     <div id="editormd" class="docstyle" style="height:500px;">
                <textarea id="contenttemp" style="display:none;" runat="server">#qwe</textarea>
      </div>
            </div>
       
    </article>
    <script type="text/javascript">
        
        $(function () {
            $("textarea").html($("#editormd_content").html());
            $("footer").remove();
            $("canvas").remove();
            pJS.canvas.h = pJS.canvas.body_height * pJS.canvas.pxratio;
        });
    </script>
</asp:Content>

