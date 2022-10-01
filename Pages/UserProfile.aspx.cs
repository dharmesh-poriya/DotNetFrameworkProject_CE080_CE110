using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem.Pages
{
    public partial class UserProfile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int userid = getUserId();
                if (0 < userid)
                {
                    userDetails(userid);
                    getCurrentActiveBiddingData(userid);
                    getPastBiddingData(userid);
                }
                else
                {
                    Response.Redirect("../authentication/Login.aspx");
                }
            }
        }


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
                        registerDateTextBox.Text = Convert.ToString(rd[8]);
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

        protected void editFirstNameImageButton_Click(object sender, ImageClickEventArgs e)
        {
            firstnameTextBox.ReadOnly = false;
        }

        protected void editLastNameImageButton_Click(object sender, ImageClickEventArgs e)
        {
            lastnameTextBox.ReadOnly = false;
        }

        protected void editAgeImageButton_Click(object sender, ImageClickEventArgs e)
        {
            ageTextBox.ReadOnly = false;
        }

        protected void editGenderImageButton_Click(object sender, ImageClickEventArgs e)
        {
            genderSelectBox.Enabled = true;
        }

        protected void updateButton0_Click(object sender, EventArgs e)
        {
            updateDetails();
        }

        private void updateDetails()
        {
            int userid = 0;
            HttpCookie cookie = Request.Cookies["user"];
            if (null != cookie)
            {
                userid = Convert.ToInt32(cookie["userId"]);
            }
            else if (null != Session["userId"])
            {
                userid = Convert.ToInt32(Session["userId"]);
            }
            else
            {
                Response.Redirect("../authentication/Login.aspx");
            }
            SqlConnection con = new SqlConnection(cs);
            string query = "update [User] set firstname=@fname, lastname=@lname, age=@age, gender=@gender where Id=@userid";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@fname", firstnameTextBox.Text);
                cmd.Parameters.AddWithValue("@lname", lastnameTextBox.Text);
                cmd.Parameters.AddWithValue("@age", ageTextBox.Text);
                cmd.Parameters.AddWithValue("@gender", genderSelectBox.SelectedValue);
                cmd.Parameters.AddWithValue("@userid", userid);
                int a = cmd.ExecuteNonQuery();
                if (0 < a)
                {
                    firstnameTextBox.ReadOnly = true;
                    lastnameTextBox.ReadOnly = true;
                    ageTextBox.ReadOnly = true;
                    genderSelectBox.Enabled = false;
                    Response.Write("<script>alert('Details updated successfully!!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Details not updated');</script>");
                }
            }
        }

        protected void editProfilePicImageButton_Click(object sender, ImageClickEventArgs e)
        {
            profilePhotoFileUpload.Enabled = true;
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            int userid = 0;
            HttpCookie cookie = Request.Cookies["user"];
            if (null != cookie)
            {
                userid = Convert.ToInt32(cookie["userId"]);
            }
            else if (null != Session["userId"])
            {
                userid = Convert.ToInt32(Session["userId"]);
            }
            else
            {
                Response.Redirect("../authentication/Login.aspx");
            }
            SqlConnection con = new SqlConnection(cs);
            string query = "update [User] set image=@img where Id=@userid";
            using (con)
            {
                con.Open();
                //string fileName = chackFileValidation();
                SqlCommand cmd = new SqlCommand(query, con);
                string imgName = chackFileValidation();
                if ("" != imgName)
                {
                    cmd.Parameters.AddWithValue("@img", imgName);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    int a = cmd.ExecuteNonQuery();
                    if (0 < a)
                    {
                        profilePhotoFileUpload.Enabled = false;
                        //Response.Write("<script>alert('Profile pic updated successfully!!');</script>");
                        messageLabel.Text = "Updated!!";
                        messageLabel.ForeColor = System.Drawing.Color.Green;
                        messageLabel.Visible = true;
                        Response.Redirect("UserProfile.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Profile pic not updated');</script>");
                    }
                }
            }
        }

        private string chackFileValidation()
        {
            string path = Server.MapPath("~/FileUpload/images/UserProfilePic/");

            if (profilePhotoFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(profilePhotoFileUpload.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile postedFile = profilePhotoFileUpload.PostedFile;
                int length = postedFile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".gif" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (1000000 >= length)
                    {
                        profilePhotoFileUpload.SaveAs(path + fileName);
                        //System.IO.Directory.CreateDirectory
                        string name = "FileUpload/images/UserProfilePic/" + fileName;
                        return name;
                    }
                    else
                    {
                        //Response.Write("<script>alert('Photo size must be less than 1MB!!');</script>");
                        messageLabel.Text = "Photo size must be less than 1MB!!";
                        messageLabel.ForeColor = System.Drawing.Color.Red;
                        messageLabel.Visible = true;
                        return "";
                    }
                }
                else
                {
                    //Response.Write("<script>alert('Photo formate is not valid!!');</script>");
                    messageLabel.Text = "Photo formate is not valid!!";
                    messageLabel.ForeColor = System.Drawing.Color.Red;
                    messageLabel.Visible = true;
                    return "";
                }
            }
            return "";
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

        private void getCurrentActiveBiddingData(int userid)
        {
            DataTable dt = new DataTable();
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
                        bool isActive = getProductDetails(details, Convert.ToInt32(dr["productid"]),query2);
                        if (isActive)
                        {
                            details.Add(Convert.ToString(dr[2]));
                            details.Add(Convert.ToString(dr[3]));
                            details.Add(Convert.ToString(dr[4]));
                            string[] dte = details[4].Split(' ');
                            dt.Rows.Add(details[0], details[1], details[2], details[3], dte[0], DateTime.Parse(details[5]).TimeOfDay);
                        }
                    }
                }
            }
            this.CurrentActiveBidGridView.DataSource = dt;
            this.CurrentActiveBidGridView.DataBind();
        }

        private bool getProductDetails(List<string> details, int productid,string query)
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
                        bool isActive = getProductDetails(details, Convert.ToInt32(dr["productid"]),query2);
                        if (isActive)
                        {
                            details.Add(Convert.ToString(dr[2]));
                            details.Add(Convert.ToString(dr[3]));
                            details.Add(Convert.ToString(dr[4]));
                            string[] dte = details[4].Split(' ');
                            dt.Rows.Add(details[0], details[1], details[2], details[3], dte[0], DateTime.Parse(details[5]).TimeOfDay);
                        }
                    }
                }
            }
            this.PastBiddingGridView.DataSource = dt;
            this.PastBiddingGridView.DataBind();
        }

    }
}