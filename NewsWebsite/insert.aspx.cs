using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class insert : System.Web.UI.Page
{
    static String filename;
    static String type;
    static String filecontent;
    static String publisher;
    static String publishdate;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        filename = txtfilename.Text.ToString().Trim();
        type = txttype.Text.ToString().Trim();
        filecontent = contenttemp.InnerText.ToString();
        publisher = txtpublisher.Text.ToString().Trim();
        publishdate = DateTime.Now.ToString();

        SqlConnection conn = new SqlConnection("Data Source=120.24.61.225;Initial Catalog=stuDB34;Persist Security Info=True;User ID=stuDB34;Password=stuDB34");
        conn.Open();

        int typeid=0;
        string str = "select typeid from type where typename='"+ type + "'";
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            typeid = dr.GetInt32(0);
            dr.Close();
            string sqlstr = "insert into files(filename,type,typeid,filecontent,publisher,publishdate) values('" + filename + "','" + type + "'," + typeid + ",'" + filecontent + "','" + publisher + "','" + publishdate + "') ";
            SqlCommand cmd1 = new SqlCommand(sqlstr, conn);
            cmd1.ExecuteNonQuery();
            Response.Redirect("edit.aspx");
        }
        else {
            Response.Write("<script>alert('数据库没有此项')</script>");
        }
        
        
    }
}