using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class updata : System.Web.UI.Page

{
    SqlConnection conn;
    static String fileid;
    static String filename;
    static String type;
    static String filecontent;
    static String publisher;
    static String publishdate;

    protected void Page_Load(object sender, EventArgs e)
    {
         
        

    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        fileid = Request.QueryString["id"];
        foreach (GridViewRow row in GridView1.Rows)
        {
            TextBox tb = row.FindControl("txtfilename") as TextBox;
            filename = tb.Text.ToString().Trim();
            TextBox tb1 = row.FindControl("txttype") as TextBox;
            type = tb1.Text.ToString().Trim();
            TextBox tb2 = row.FindControl("txtpublisher") as TextBox;
            publisher = tb2.Text.ToString().Trim();
            Label tb3 = row.FindControl("txtfilecontent") as Label;
            filecontent = contenttemp.InnerText.ToString();
            
            //filecontent=filecontent.Remove(0, 27);
           // filecontent=filecontent.Remove(filecontent.Length - 6, 6);

        }
        publishdate = DateTime.Now.ToString();
        
        conn = new SqlConnection("Data Source=.;Initial Catalog=news;Integrated Security=True");
        conn.Open();

        int typeid = 0;
        string str = "select typeid from type where typename='" + type + "'";
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            typeid = dr.GetInt32(0);
            dr.Close();

        }

        string sqlstr = "update files set filename='" + filename + "',type='" + type + "',typeid=" + typeid + ",publisher='" + publisher + "',publishdate='" + publishdate + "',filecontent='" + filecontent + "' where fileid='" + fileid + "'";
        SqlCommand cmd1 = new SqlCommand(sqlstr, conn);
        cmd1.ExecuteNonQuery();
        Response.Redirect("edit.aspx");
     
    }
}