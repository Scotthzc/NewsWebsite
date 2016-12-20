using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class type : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=stuDB34;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false) {
            type1.Text = "";
            type1.Visible = false;
            type1_b.Visible = false;
            type2.Visible = false;
            type2_b.Visible = false;
        }
        



    }

    protected void Page_PreRender(object sender, EventArgs e) {

        conn.Open();
        /*type1*/
        int typeid1=0;
        
        string str1 = "select typeid from type where typename='" + type1.Text + "'";
        SqlCommand cmd1 = new SqlCommand(str1, conn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read())
        {
            typeid1 = dr1.GetInt32(0); 
           

        }
        dr1.Close();
        /*type2*/
        int typeid2=0;
        string str2 = "select typeid from type where typename='" + type2.Text + "'";
        SqlCommand cmd2 = new SqlCommand(str2, conn);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.Read())
        {
            typeid2 = dr2.GetInt32(0);
            

        }
        dr2.Close();
       
        if (type1.Text == ""& type2.Text == "") {
            SqlDataSource1.SelectCommand = "select * from files";
        }
        else {
            SqlDataSource1.SelectCommand = "select * from files where typeid=" + typeid1 + " or typeid=" + typeid2 + " ";
        }
        
       
    }
    protected void type1_b_Click(object sender, EventArgs e)
    {
        type1.Text = "";
        type1.Visible = false;
        type1_b.Visible = false;
    }

    protected void type2_b_Click(object sender, EventArgs e)
    {
        type2.Text = "";
        type2.Visible = false;
        type2_b.Visible = false;
    }

    protected void Android_Click(object sender, EventArgs e)
    {
        if (type1.Text != Android.Text&& type2.Text != Android.Text) {
            if (type1.Text == "") {
                type1.Text = Android.Text;
                type1.Visible = true;
                type1_b.Visible = true;
            } else {
                type2.Text = Android.Text;
                type2.Visible = true;
                type2_b.Visible = true;
            }
        }
    }

    protected void Web_Click(object sender, EventArgs e)
    {
        if (type1.Text != Web.Text && type2.Text != Web.Text) {
            if (type1.Text == "")
            {
                type1.Text = Web.Text;
                type1.Visible = true;
                type1_b.Visible = true;
            }
            else
            {
                type2.Text = Web.Text;
                type2.Visible = true;
                type2_b.Visible = true;
            }
        }
    }



    protected void IT_Click(object sender, EventArgs e)
    {
        if (type1.Text != IT.Text && type2.Text != IT.Text)
        {
            if (type1.Text == "")
            {
                type1.Text = IT.Text;
                type1.Visible = true;
                type1_b.Visible = true;
            }
            else
            {
                type2.Text = IT.Text;
                type2.Visible = true;
                type2_b.Visible = true;
            }
        }
        
    }

    protected void Markdown_Click(object sender, EventArgs e)
    {
        if (type1.Text != Markdown.Text && type2.Text != Markdown.Text)
        {
            if (type1.Text == "")
            {
                type1.Text = Markdown.Text;
                type1.Visible = true;
                type1_b.Visible = true;
            }
            else
            {
                type2.Text = Markdown.Text;
                type2.Visible = true;
                type2_b.Visible = true;
            }
        }
    }

    protected void java_Click(object sender, EventArgs e)
    {
        if (type1.Text != java.Text && type2.Text != java.Text)
        {
            if (type1.Text == "")
            {
                type1.Text = java.Text;
                type1.Visible = true;
                type1_b.Visible = true;
            }
            else
            {
                type2.Text = java.Text;
                type2.Visible = true;
                type2_b.Visible = true;
            }
        }
    }

    protected void quan_Click(object sender, EventArgs e)
    {
        type1.Text = "";
        type2.Text = "";
        type1.Visible = false;
        type1_b.Visible = false;
        type2.Visible = false;
        type2_b.Visible = false;
    }
}