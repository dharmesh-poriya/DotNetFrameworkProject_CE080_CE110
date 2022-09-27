using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace OnlineAuctionSystem.Pages
{
    public partial class AdminPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fetchPendingUserData();
                fetchVerifiedUserData();
            }
        }

        private void fetchVerifiedUserData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select Id,firstname,lastname,age,pancard from [User] where verified=@status";
            using (con)
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@status", "Verified");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                VerifiedUserDataGridView.DataSource = ds;
                VerifiedUserDataGridView.DataBind();
            }
        }

        private void fetchPendingUserData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select Id,firstname,lastname,age,pancard from [User] where verified=@status";
            using (con)
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@status", "Pending");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                PendingUserDataGridView.DataSource = ds;
                PendingUserDataGridView.DataBind();
            }
        }

        protected void UserVerify_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "verifyUser")
            {
                //Response.Write(e.CommandArgument);
                updateUserStatusDetails(Convert.ToInt32(e.CommandArgument));
            }
        }
        private void updateUserStatusDetails(int userid)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "update [User] set verified=@status where Id=@userid";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@status", "Verified");
                cmd.Parameters.AddWithValue("@userid", userid);
                int a = cmd.ExecuteNonQuery();
                if(0 < a)
                {
                    fetchPendingUserData();
                    fetchVerifiedUserData();
                    Response.Write("<script>alert('User verified successfully!!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('User Not verified');</script>");
                }
            }
        }

        protected void UserDelete_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "deleteUser")
            {
                //Response.Write(e.CommandArgument);
                deleteUserDetails(Convert.ToInt32(e.CommandArgument));
            }
        }

        private void deleteUserDetails(int userid)
        {
            SqlConnection con = new SqlConnection(cs);
            int loginid = getLoginID(userid);
            if(0 < loginid)
            {
                string query = "delete from [User] where Id=@userid";
                using (con)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    int a = cmd.ExecuteNonQuery();
                    if(0 < a)
                    {
                        deleteLoginDetails(loginid);
                    }
                    else
                    {
                        Response.Write("<script>alert('User Not Deleted');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Something went wrong!!');</script>");
            }
            
        }

        private void deleteLoginDetails(int loginid)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from [Login] where Id=@loginid";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@loginid", loginid);
                int a = cmd.ExecuteNonQuery();
                if (0 < a)
                {
                    fetchPendingUserData();
                    fetchVerifiedUserData();
                    Response.Write("<script>alert('User Deleted Successfully!!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('User not Deleted!!');</script>");
                }
            }

        }

        private int getLoginID(int userid)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select login_id from [User] where Id=@userid";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    if (rd.Read())
                    {
                        return Convert.ToInt32(rd[0]);
                    }
                }
            }
            return -1;
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["adminId"] = null;
            HttpCookie cookie = Request.Cookies["Admin"];

            if (null != cookie)
            {
                //cookie = null;
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("~/default.aspx");
        }
    }
}