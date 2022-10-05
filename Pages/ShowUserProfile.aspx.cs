using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem.Pages
{
    public partial class ShowUserProfile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null == Request.QueryString["Id"] || false == isUserExist(Convert.ToInt32(Request.QueryString[0])))
            {
                string fun = "alert";
                string mess = "alert('ERROR-404 : PAGE NOT FOUND');window.location ='../Default.aspx';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), fun, mess, true);
                return;
            }

            int userid = Convert.ToInt32(Request.QueryString["Id"]);

            userDetails(userid);
            getUserProductDetails(userid);
            getCurrentActiveBiddingData(userid);
            getPastBiddingData(userid);
        }


        // MY FUNCTIONS

        private void userDetails(int userid)
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
                        firstnameTextBox.Text = Convert.ToString(rd[1]);
                        lastnameTextBox.Text = Convert.ToString(rd[2]);
                        ageTextBox.Text = Convert.ToString(rd[3]);
                        string email = userEmail(Convert.ToInt32(rd[9]));
                        emailTextBox.Text = email;
                        userImage.ImageUrl = "~/" + rd[6].ToString();
                        genderSelectBox.SelectedValue = Convert.ToString(rd[4]);
                        statusTextBox.Text = Convert.ToString(rd[7]);
                        string[] dte = Convert.ToString(rd[8]).Split(' ');
                        registerDateTextBox.Text = dte[0];
                    }
                }
            }
        }
        private string userEmail(int login_id)
        {
            SqlConnection con = new SqlConnection(cs);

            string query = "select * from [Login] where Id=@loginid";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@loginid", login_id);
                SqlDataReader rd = cmd.ExecuteReader();
                string email = "";
                if (rd.HasRows)
                {
                    if (rd.Read())
                    {
                        email = rd[1].ToString();
                    }
                }
                return email;
            }
        }
        private bool isUserExist(int userid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select * from [User] where Id=@userid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
            }
            return false;
        }

        private void getCurrentActiveBiddingData(int userid)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Image");
            dt.Columns.Add("ProductName");
            dt.Columns.Add("basePrice");
            dt.Columns.Add("bidValue");
            dt.Columns.Add("Date");
            dt.Columns.Add("Time");

            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query1 = "select * from [BidTable] where userid=@userid";
                string query2 = "select * from [Product] " +
                    "where " +
                    "Id=@productid " +
                    "and " +
                    "(" +
                    "(startingdate < @currentdate and endingdate > @currentdate) " +
                    "or " +
                    "(" +
                    "(startingdate = @currentdate and startingtime <= @currenttime) " +
                    "and " +
                    "((endingdate>@currentdate) or (endingdate = @currentdate and endingtime > @currenttime))" +
                    ") " +
                    "or " +
                    "(" +
                    "(startingdate < @currentdate) " +
                    "and " +
                    "(endingdate = @currentdate and endingtime > @currenttime)" +
                    ")" +
                    ")";
                SqlCommand cmd = new SqlCommand(query1, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        List<string> details = new List<string>();
                        bool isActive = getProductDetails(details, Convert.ToInt32(dr["productid"]), query2);
                        if (isActive)
                        {
                            details.Add(Convert.ToString(dr[2]));
                            details.Add(Convert.ToString(dr[3]));
                            details.Add(Convert.ToString(dr[4]));
                            string[] dte = details[5].Split(' ');
                            dt.Rows.Add(details[0], details[1], details[2], details[3], details[4], dte[0], DateTime.Parse(details[6]).TimeOfDay);

                        }
                    }
                }
            }
            this.CurrentActiveBidGridView.DataSource = dt;
            this.CurrentActiveBidGridView.DataBind();
        }

        private bool getProductDetails(List<string> details, int productid, string query)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);
                cmd.Parameters.AddWithValue("@currentdate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@currenttime", DateTime.Now.TimeOfDay);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        details.Add(Convert.ToString(dr[0]));
                        details.Add(Convert.ToString(dr[1]));
                        details.Add(Convert.ToString(dr[2]));
                        details.Add(Convert.ToString(dr[4]));
                    }
                    return true;
                }
            }
            return false;
        }

        private void getPastBiddingData(int userid)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Image");
            dt.Columns.Add("ProductName");
            dt.Columns.Add("basePrice");
            dt.Columns.Add("bidValue");
            dt.Columns.Add("Date");
            dt.Columns.Add("Time");

            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query1 = "select * from [BidTable] where userid=@userid";
                string query2 = "select * from [Product] " +
                    "where " +
                    "Id=@productid " +
                    "and " +
                    "(" +
                    "(endingdate < @currentdate) " +
                    "or " +
                    "(endingdate = @currentdate and endingtime <= @currenttime) " +
                    ")";
                SqlCommand cmd = new SqlCommand(query1, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        List<string> details = new List<string>();
                        bool isActive = getProductDetails(details, Convert.ToInt32(dr["productid"]), query2);
                        if (isActive)
                        {
                            details.Add(Convert.ToString(dr[2]));
                            details.Add(Convert.ToString(dr[3]));
                            details.Add(Convert.ToString(dr[4]));
                            string[] dte = details[5].Split(' ');
                            dt.Rows.Add(details[0], details[1], details[2], details[3], details[4], dte[0], DateTime.Parse(details[6]).TimeOfDay);
                        }
                    }
                }
            }
            this.PastBiddingGridView.DataSource = dt;
            this.PastBiddingGridView.DataBind();
        }


        protected void viewBids_Click(object sender, EventArgs e)
        {
            ProductsGridView.Visible = !ProductsGridView.Visible;
            productLabel.Visible = !productLabel.Visible;
            currentActiveLabel.Visible = !currentActiveLabel.Visible;
            CurrentActiveBidGridView.Visible = !CurrentActiveBidGridView.Visible;
            pastBiddingLabel.Visible = !pastBiddingLabel.Visible;
            PastBiddingGridView.Visible = !PastBiddingGridView.Visible;
        }

        private void getUserProductDetails(int userid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                string query = "select Id,image,name,baseprice,startingdate,endingdate from [Product] where userid=@userid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductsGridView.DataSource = ds;
                ProductsGridView.DataBind();
            }
        }
    }
}