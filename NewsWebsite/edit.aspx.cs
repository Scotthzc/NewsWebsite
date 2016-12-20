using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit : System.Web.UI.Page
{
    static String id;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            LinkButton tb = row.FindControl("LinkButton1") as LinkButton;
            id = tb.CommandArgument.ToString();
        }
        SqlConnection conn = new SqlConnection("Data Source=120.24.61.225;Initial Catalog=stuDB34;Persist Security Info=True;User ID=stuDB34;Password=stuDB34");
        conn.Open();
        string sqlstr = "delete from pinglun where fileid='"+id+"'";
       SqlCommand cmd = new SqlCommand(sqlstr, conn);
        cmd.ExecuteNonQuery();
        string sqlstr1 = "delete from files where fileid='"+id+"'";
        SqlCommand cmd2 = new SqlCommand(sqlstr1, conn);
        cmd2.ExecuteNonQuery();
        Response.Redirect("edit.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}