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
    public partial class Product : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null == Request.QueryString["id"] || false == isProductExist(Convert.ToInt32(Request.QueryString[0])))
            {
                string fun = "alert";
                string mess = "alert('ERROR-404 : PAGE NOT FOUND');window.location ='../Default.aspx';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), fun, mess, true);
                return;
            }
            int productid = Convert.ToInt32(Request.QueryString[0]);
            /*if (!IsPostBack)
            {
                
            }*/
            fetchProductDetails(productid);
            fetchBiddingDetails(productid);
            int userid = getUserId();
            if (isThisProductOfUser(userid, productid))
            {
                productOwnerLabel.Visible = true;
                ChangeBidLabel.Visible = false;
                changeBidTextBox.Visible = false;
                updateBidValueButton.Visible = false;
                editBidValueImageButton.Visible = false;
            }
            bool bidactive = isBidActive(productid);
            if (false == bidactive)
            {
                declareWinner(productid);
            }

        }

        protected void buttonClick_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "viewOwnerDetails")
            {
                //Response.Write(e.CommandArgument);
                Response.Redirect("~/Pages/ShowUserProfile.aspx?Id=" + e.CommandArgument);
                //updateActiveBiddingDetails(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void editBidValueImageButton_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Write("editing!!");
            int userid = getUserId();
            if (0 < userid)
            {
                //Response.Write("editing!!");
                int productid = Convert.ToInt32(Request.QueryString[0]);
                bool bidActive = isBidActive(productid);
                if (bidActive)
                {
                    if (getStatus(userid))
                    {
                        changeBidTextBox.Enabled = true;
                        updateBidValueButton.Enabled = true;
                        errorMessageBidValueLabel.Visible = false;
                        //Response.Write("now we can bid!!");

                    }
                    else
                    {
                        Response.Write("<script>alert('Your verification under process.');</script>");
                        return;
                    }
                }
                else
                {
                    updateBidValueButton.Enabled = false;
                    //editBidValueImageButton.Enabled = false;
                    Response.Write("<script>alert('Bid is not active yet!!');</script>");
                }
            }
            else
            {
                string fun = "alert";
                string mess = "alert('You are not logged in!!');window.location ='../authentication/Login.aspx';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), fun, mess, true);
                return;
            }
        }

        protected void updateBidValueButton_Click(object sender, EventArgs e)
        {
            changeBidTextBox.Enabled = false;
            updateBidValueButton.Enabled = false;

            int productid = Convert.ToInt32(Request.QueryString[0]);
            long mx_bid = getMaxBidValue(productid);
            long enteredBid = Convert.ToInt64(changeBidTextBox.Text);
            if (enteredBid > mx_bid)
            {
                int userid = getUserId();
                if (0 < userid)
                {
                    int bidId = getBidId(userid, productid);
                    if (0 < bidId)
                    {
                        if (updateBidValue(bidId, enteredBid))
                        {
                            fetchBiddingDetails(productid);
                            Response.Write("<script>alert('Your Bid updated successfully');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('server Error');</script>");
                        }
                    }
                    else
                    {
                        if (insertNewBid(userid, productid, enteredBid))
                        {
                            fetchBiddingDetails(productid);
                            Response.Write("<script>alert('Your Bid updated successfully');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('server Error');</script>");
                        }
                    }
                }
                else
                {
                    string fun = "alert";
                    string mess = "alert('You are not logged in!!');window.location ='../authentication/Login.aspx';";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), fun, mess, true);
                    return;
                }
            }
            else
            {
                errorMessageBidValueLabel.Visible = true;
                errorMessageBidValueLabel.Text = "bidvalue must be greater than baseprice and current highestbid";
                errorMessageBidValueLabel.ForeColor = System.Drawing.Color.DarkRed;
            }
            //Response.Write(mx_bid);
        }


        //my functions

        private bool isProductExist(int v)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select * from [Product] where Id=@productid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", v);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
            }
            return false;
        }

        private void declareWinner(int productid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select userid,MAX(bidvalue) As mxbidvalue from[BidTable] where productid = @productid GROUP BY userid";
                SqlCommand cmd = new SqlCommand(@query, con);
                cmd.Parameters.AddWithValue("@productid", productid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        changeBidTextBox.Enabled = false;
                        updateBidValueButton.Enabled = false;
                        editBidValueImageButton.Enabled = false;
                        winnerLabel.Visible = true;
                        winnerLinkHyperLink.Visible = true;
                        getWinnerDetails(Convert.ToInt32(dr[0]));
                    }
                }
            }
        }

        private void getWinnerDetails(int userid)
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
                    if (dr.Read())
                    {
                        winnerLinkHyperLink.Text = dr[1].ToString();
                        winnerLinkHyperLink.NavigateUrl = "~/Pages/ShowUserProfile.aspx?Id=" + Convert.ToString(dr[0]);
                    }
                }
            }
        }

        private void fetchProductDetails(int productid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select Id,name,description,baseprice,image,startingdate,endingdate,startingtime,endingtime,userid from [Product] where Id=@productid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ProductBiddingGridView.DataSource = ds;
                    ProductBiddingGridView.DataBind();
                }
                else
                {
                    Response.Write("ERROR:404 => Page not found");
                }
            }
        }

        private void fetchBiddingDetails(int productid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                string query = "select BT.userid,BT.bidvalue,BT.biddate,BT.bidtime,U.firstname from BidTable BT INNER JOIN [User] U ON BT.userid=U.Id where BT.productid=@productid ORDER BY bidvalue DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                BiddingGridView.DataSource = ds;
                BiddingGridView.DataBind();
            }
            //string temp = "Select *   from tbl_projects\r\ninner join tbl_tasks on tbl_tasks.PROJECT_ID = tbl_projects.PROJECT_ID\r\nwhere tbl_projects.USER_ID = @USER_ID and tbl_projects.FAVORITE = @FAVORITE ";
        }

        private int getUserId()
        {
            HttpCookie cookie = Request.Cookies["user"];
            if (null != cookie || null != Session["userId"])
            {
                if (null != cookie)
                {
                    int userid = Convert.ToInt32(cookie["userId"]);
                    return userid;
                }
                else
                {
                    int userid = Convert.ToInt32(Session["userId"]);
                    return userid;
                }
            }
            return -1;
        }

        private bool isBidActive(int productid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select * from [Product] " +
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
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);
                cmd.Parameters.AddWithValue("@currentdate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@currenttime", DateTime.Now.TimeOfDay);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
            }
            return false;
        }

        private bool getStatus(int userid)
        {
            SqlConnection con = new SqlConnection(cs);

            string query = "select verified from [User] where Id=@userid";
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
                        return ("Verified" == Convert.ToString(rd[0]));
                    }
                }
                else
                    return false;
            }
            return false;
        }

        private bool isThisProductOfUser(int userid, int productid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select userid from [Product] where Id=@productid and userid=@userid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
            }
            return false;
        }

        private long getMaxBidValue(int productid)
        {
            long basePrice = getBasePriceOfProduct(productid);
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select MAX(bidvalue) As mxbidvalue from [BidTable] where productid=@productid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        if (DBNull.Value != dr["mxbidvalue"])
                        {
                            return Convert.ToInt64(dr[0]);
                        }
                    }
                }
            }
            return basePrice;
        }

        private long getBasePriceOfProduct(int productid)
        {
            long basePrice = 0;
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select baseprice from [Product] where Id=@productid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@productid", productid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        basePrice = Convert.ToInt64(dr[0]);
                    }
                }
            }
            return basePrice;
        }

        private int getBidId(int userid, int productid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string query = "select Id from [BidTable] where userid=@userid and productid=@productid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@productid", productid);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        return Convert.ToInt32(dr[0]);
                    }
                }
            }
            return -1;
        }

        private bool insertNewBid(int userid, int productid, long enteredBid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string time = Convert.ToString(DateTime.Now.TimeOfDay.Hours);
                time += ":" + Convert.ToString(DateTime.Now.TimeOfDay.Minutes);
                time += ":" + Convert.ToString(DateTime.Now.TimeOfDay.Seconds);

                string query = "insert into BidTable values(@userid,@bidvalue,@biddate,@bidtime,@productid)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@bidvalue", enteredBid);
                cmd.Parameters.AddWithValue("@biddate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@bidtime", DateTime.Parse(time).TimeOfDay);
                cmd.Parameters.AddWithValue("@productid", productid);

                int a = cmd.ExecuteNonQuery();
                if (0 < a)
                {
                    return true;
                }
            }
            return false;
        }

        private bool updateBidValue(int bidId, long enteredbid)
        {
            SqlConnection con = new SqlConnection(cs);
            using (con)
            {
                con.Open();
                string time = Convert.ToString(DateTime.Now.TimeOfDay.Hours);
                time += ":" + Convert.ToString(DateTime.Now.TimeOfDay.Minutes);
                time += ":" + Convert.ToString(DateTime.Now.TimeOfDay.Seconds);

                string query = "update [BidTable] set  bidvalue=@bidvalue,biddate=@biddate,bidtime=@bidtime where Id=@bidid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@bidvalue", enteredbid);
                cmd.Parameters.AddWithValue("@biddate", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@bidtime", DateTime.Parse(time).TimeOfDay);
                cmd.Parameters.AddWithValue("@bidid", bidId);

                int a = cmd.ExecuteNonQuery();
                if (0 < a)
                {
                    return true;
                }
            }
            return false;
        }

    }
}