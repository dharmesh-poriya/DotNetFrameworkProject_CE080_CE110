using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem
{
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        private string isLoggedIn()
        {
            HttpCookie usercookie = Request.Cookies["user"];
            HttpCookie admincookie = Request.Cookies["Admin"];
            if (null != usercookie || null != Session["userId"])
            {
                return "user";
            }else if (null != admincookie || null != Session["adminId"])
            {
                return "admin";
            }
            return "";
        }
        protected void setVisibilityForButton()
        {
            HttpCookie cookie = Request.Cookies["user"];
            if (null != cookie)
            {
                loginBtn.Visible = false;
                logoutBtn.Visible = true;
                profileImageBtn.Visible = true;
                int userid = Convert.ToInt32(cookie["userId"]);
                string imgUrl = userImage(userid);
                //Response.Write(imgUrl);
                profileImageBtn.ImageUrl = imgUrl;
            }
            else if (null != Session["userId"])
            {
                loginBtn.Visible = false;
                logoutBtn.Visible = true;
                profileImageBtn.Visible = true;
                int userid = Convert.ToInt32(Session["userId"]);
                string imgUrl = userImage(userid);
                //Response.Write(imgUrl);
                profileImageBtn.ImageUrl = imgUrl;
            }
            else
            {
                loginBtn.Visible = true;
                logoutBtn.Visible = false;
                profileImageBtn.Visible = false;
            }
        }

        private string userImage(int userid)
        {
            SqlConnection con = new SqlConnection(cs);

            string query = "select * from [User] where Id=@userid";
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
                        string imgurl = "~/" + rd[6].ToString();
                        return imgurl;
                    }
                }
            }
            return "~/FileUpload/images/DefaultImages/default.png";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            setVisibilityForButton();
            updateActiveBiddingDetails();
            updateFutureBiddingDetails();
            updatePastBiddingDetails();
        }

        private void updatePastBiddingDetails()
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select Id,name,image,startingdate,endingdate,startingtime,endingtime from [Product] where ((endingdate < @currentdate) or (endingdate = @currentdate and endingtime <= @currenttime)) order by startingdate,startingtime,endingdate,endingtime asc";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@currentdate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@currenttime", DateTime.Now.TimeOfDay);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                PastBiddingGridView.DataSource = ds;
                PastBiddingGridView.DataBind();
            }
        }

        private void updateFutureBiddingDetails()
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select Id,name,image,startingdate,endingdate,startingtime,endingtime from [Product] where (startingdate = @currentdate and startingtime > @currenttime) or (startingdate > @currentdate) order by startingdate,startingtime,endingdate,endingtime asc";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@currentdate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@currenttime", DateTime.Now.TimeOfDay);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                FutureBiddingGridView.DataSource = ds;
                FutureBiddingGridView.DataBind();
            }
        }

        private void updateActiveBiddingDetails()
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select Id,name,image,startingdate,endingdate,startingtime,endingtime from [Product] where (startingdate = @currentdate and startingtime <= @currenttime) or (endingdate = @currentdate and endingtime >= @currenttime) or (startingdate < @currentdate and endingdate > @currentdate) order by startingdate,startingtime,endingdate,endingtime asc";
                SqlCommand cmd = new SqlCommand(query,con);
                cmd.Parameters.AddWithValue("@currentdate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@currenttime", DateTime.Now.TimeOfDay);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ActiveBiddingGridView.DataSource = ds;
                ActiveBiddingGridView.DataBind();
            }
        }
        protected void loginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("authentication/Login.aspx");
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session["userId"] = null;
            HttpCookie cookie = Request.Cookies["user"];

            if (null != cookie)
            {
                //cookie = null;
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("default.aspx");
        }

        protected void profileImageBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Pages/UserProfile.aspx");
        }

        protected void addProductButton_Click(object sender, EventArgs e)
        {
            string who = isLoggedIn();
            if("admin" == who)
            {
                Response.Redirect("~/default.aspx");
            }else if("user" == who)
            {
                Response.Redirect("~/Pages/AddProduct.aspx");
            }
            else
            {
                Response.Write("<script>alert('You are not logged in!!');</script>");
            }
        }
/*
        protected void ActiveBidding_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "viewDetail")
            {
                Response.Write(e.CommandArgument);
                //Response.Redirect("~/Pages/Product.aspx");
                //updateActiveBiddingDetails(Convert.ToInt32(e.CommandArgument));
            }
        }
*/
/*
        protected void FutureBidding_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "viewDetail")
            {
                Response.Write(e.CommandArgument);
                //Response.Redirect("~/Pages/Product.aspx");
                //updateFutureBiddingDetails(Convert.ToInt32(e.CommandArgument));
            }
        }
*/


    }
}