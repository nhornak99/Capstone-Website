using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

public partial class Admin : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);
    StringBuilder tableBuilder = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillDropDown();
            BindGrid();
        }

        districtList.Text = districtList.SelectedValue;
    }

    private void FillDropDown()
    {
        string selectCMD = "SELECT District_Name FROM DistrictTbl";
        using (con)
        {
            using (SqlCommand cmd = new SqlCommand(selectCMD))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                districtList.DataSource = cmd.ExecuteReader();
                districtList.DataTextField = "District_Name";
                //districtList.DataValueField = "District_ID";
                districtList.DataBind();
                con.Close();
            }
        }
        //districtList.Items.Insert(0, new ListItem("--Select District--", "0"));
    }

    protected void districtList_SelectedIndexChanged(object sender, EventArgs e)
    {
        int district = 0;
        if (districtList.Text == "Medina")
            district = 1;
        else if (districtList.Text == "Brunswick")
            district = 3;
        else if (districtList.Text == "Highland")
            district = 4;

        if (Page.IsPostBack)
        {
            
            con.Open();
            SqlCommand cmd = new SqlCommand();


            cmd.CommandText = "SELECT FirstName, UserName, Password FROM UserTbl WHERE District_ID=" + district;
            BindGrid();
            cmd.Connection = con;
            SqlDataReader rd = cmd.ExecuteReader();
            tableBuilder.Append("<table border='1'>");
            tableBuilder.Append("<tr><th>FirstName</th><th>UserName</th><th>Password</th>");
            tableBuilder.Append("</tr>");

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    tableBuilder.Append("<tr>");
                    tableBuilder.Append("<td>" + rd[0] + "</td>");
                    tableBuilder.Append("<td>" + rd[1] + "</td>");
                    tableBuilder.Append("<td>" + rd[2] + "</td>");
                    tableBuilder.Append("</tr>");
                }
            }
            tableBuilder.Append("</table>");
            //PlaceHolder1.Controls.Add(new Literal { Text = tableBuilder.ToString() });
            rd.Close();
        }
    }

    private void BindGrid()
    {
        int district = 0;
        if (districtList.Text == "Medina")
            district = 1;
        else if (districtList.Text == "Brunswick")
            district = 3;
        else if (districtList.Text == "Highland")
            district = 4;

        using (con)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT User_ID, FirstName, UserName, Password FROM UserTbl WHERE District_ID = " + district))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }

    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        con.Open();
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        BindGrid();
        return dt;
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;

        districtList.Items.Add(row.Cells[2].Text);
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.NewSelectedIndex];
    }

    protected void AddNewUser(object sender, EventArgs e)
    {
        int district = 0;
        if (districtList.Text == "Medina")
            district = 1;
        else if (districtList.Text == "Brunswick")
            district = 3;
        else if (districtList.Text == "Highland")
            district = 4;

        string Name = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
        string Username = ((TextBox)GridView1.FooterRow.FindControl("txtUserName")).Text;
        string password = ((TextBox)GridView1.FooterRow.FindControl("txtPassword")).Text;
        
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO UserTbl(FirstName, UserName, Password, District_ID) " +
            "VALUES(@Name, @Username, @password, @district);" +
            "SELECT User_ID, FirstName, UserName, Password FROM UserTbl WHERE District_ID=" + district;
        //cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
        cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = Name;
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = Username;
        cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password;
        cmd.Parameters.Add("@district", SqlDbType.Int).Value = district;
        GridView1.DataSource = GetData(cmd);
        GridView1.DataBind();

    }

    protected void EditUser(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }

    protected void UpdateUser(object sender, GridViewUpdateEventArgs e)
    {
        int district = 0;
        if (districtList.Text == "Medina")
            district = 1;
        else if (districtList.Text == "Brunswick")
            district = 3;
        else if (districtList.Text == "Highland")
            district = 4;

        string UserID = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblUserID")).Text;
        string Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
        string Username = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtUsername")).Text;
        string password = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPassword")).Text;
        
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE UserTbl SET FirstName=@Name, UserName=@Username, Password=@password WHERE User_ID=@UserID;" +
            "SELECT User_ID, FirstName, UserName, Password FROM UserTbl WHERE District_ID = " + district;
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
        cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = Name;
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = Username;
        cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password;
        //cmd.Parameters.Add("@District_ID", SqlDbType.Int).Value = district;
        GridView1.EditIndex = -1;
        GridView1.DataSource = GetData(cmd);
        GridView1.DataBind();
    }

    protected void DeleteUser(object sender, EventArgs e)
    {
        int district = 0;
        if (districtList.Text == "Medina")
            district = 1;
        else if (districtList.Text == "Brunswick")
            district = 3;
        else if (districtList.Text == "Highland")
            district = 4;

        LinkButton lnkRemove = (LinkButton)sender;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "DELETE FROM UserTbl WHERE User_ID=@UserID;" +
        "SELECT User_ID, FirstName, UserName, Password FROM UserTbl WHERE District_ID = " + district;
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = lnkRemove.CommandArgument;
        GridView1.DataSource = GetData(cmd);
        GridView1.DataBind();
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        BindGrid();
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM UserTbl WHERE User_ID='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");
        //TextBox txtname=(TextBox)gr.cell[].control[];
        TextBox textName = (TextBox)row.Cells[0].Controls[0];
        TextBox textUN = (TextBox)row.Cells[1].Controls[0];
        TextBox textPass = (TextBox)row.Cells[2].Controls[0];
        //TextBox textadd = (TextBox)row.FindControl("txtadd");
        //TextBox textc = (TextBox)row.FindControl("txtc");
        GridView1.EditIndex = -1;
        con.Open();
        //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);
        SqlCommand cmd = new SqlCommand("UPDATE UserTbl SET FirstName='" + textName.Text + "',UserName='" + textUN.Text + "',Password='" + textPass.Text + "'where User_ID='" + userid + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }
}