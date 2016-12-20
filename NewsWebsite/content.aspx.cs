using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class content : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=120.24.61.225;Initial Catalog = pinglun; Persist Security Info=True;User ID = stuDB34; Password=stuDB34");
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["username"] != null)
        {
                    
            if ((string)Session["username"] == "admin")
            {
                GridView2.Visible = true;
                DiscussGridView.Visible = false;  
            }
            else
            {
                GridView2.Visible = false;
                DiscussGridView.Visible = true;

            }
            this.discuss.Visible = false;
            this.submit.Style.Add("top", "0");
        }
        else
        {
            this.discuss.Visible = true;
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (TxtSpeak.Text == "")
        {
            Response.Write("<script>alert('内容不能为空，请重新填写')</script>");
        }
        else
        {
            string username = (string)Session["username"];
            if (username != null)
            {
                try
                {
                    conn.Open();
                    string sql1 = "insert into pinglun values('" + Request.QueryString["ID"] + "','" + TxtSpeak.Text + "','" + System.DateTime.Now + "','" + username + "')";
                    SqlCommand cmd1 = new SqlCommand(sql1, conn);
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('评论成功')</script>");
                    Response.Redirect("content.aspx?ID=" + Request.QueryString["ID"]);
                }
                catch
                {
                    Response.Write("<script>alert('评论失败，请重新填写')</script>");
                }
                finally
                {
                    conn.Close();
                }

            }
            else
            {
                try
                {
                    string str = "匿名用户";
                    conn.ConnectionString = "Data Source=120.24.61.225;Initial Catalog=stuDB34;Persist Security Info=True;User ID=stuDB34;Password=stuDB34";
                    conn.Open();
                    string sql1 = "insert into pinglun values('" + Request.QueryString["ID"] + "','" + TxtSpeak.Text + "','" + System.DateTime.Now + "','" + str + "')";
                    SqlCommand cmd1 = new SqlCommand(sql1, conn);
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('评论成功')</script>");
                    Response.Redirect("content.aspx?ID=" + Request.QueryString["ID"]);
                }
                catch
                {
                    Response.Write("<script>alert('评论失败，请重新填写')</script>");
                }
                finally
                {
                    conn.Close();
                }

            }
        }
    }
}