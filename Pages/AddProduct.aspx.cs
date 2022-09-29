using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OnlineAuctionSystem.Pages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void addProductButton_Click(object sender, EventArgs e)
        {
            bool isIt = isUserVerified();
            if (!isIt)
            {
                Response.Write("<script>alert('You are not verified yet!!');</script>");
                return;
            }
            string startdate = startDate.Value;
            string starttime = startTime.Value;
            string enddate = endDate.Value;
            string endtime = endTime.Value;
            string fileName = chackFileValidation();
            
            if ((DateTime.Parse(startdate) == DateTime.Parse(enddate)) && (DateTime.Parse(starttime) >= DateTime.Parse(endtime)))
            {
                Response.Write("<script>alert('Please select valid time');</script>");
            }
            else if("" != fileName)
            {
                string description = productDescriptionTextBox.Text;
                int baseprice = Convert.ToInt32(basePriceTextBox.Text);

                SqlConnection con = new SqlConnection(cs);
                using (con)
                {
                    con.Open();
                    string query = "insert into Product values(@image,@desc,@baseprice,@startdate,@enddate,@starttime,@endtime,@status,@userid)";
                    int userid = getUserId();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@image", fileName);
                    cmd.Parameters.AddWithValue("@desc", description);
                    cmd.Parameters.AddWithValue("@baseprice", baseprice);
                    cmd.Parameters.AddWithValue("@startdate",startdate);
                    cmd.Parameters.AddWithValue("@enddate", enddate);
                    cmd.Parameters.AddWithValue("@starttime",starttime);
                    cmd.Parameters.AddWithValue("@endtime", endtime);
                    cmd.Parameters.AddWithValue("@status", "CommingSoon");
                    cmd.Parameters.AddWithValue("@userid", userid);

                    int a = cmd.ExecuteNonQuery();
                    if(0 < a)
                    {
                        clearFields();
                        Response.Write("<script>alert('Product Added successfully!!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Product Not Added');</script>");
                    }
                }
            }
        }

        private void clearFields()
        {
            productDescriptionTextBox.Text = "";
            basePriceTextBox.Text = "";
            startDate.Value = endDate.Value = startTime.Value = endTime.Value = "";
        }

        private bool isUserVerified()
        {
            int userid = getUserId();
            return getStatus(userid);
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

        private string chackFileValidation()
        {
            string path = Server.MapPath("~/FileUpload/images/ProductImages/");

            if (productImageFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(productImageFileUpload.FileName);
                if(20 < fileName.Length)
                {
                    messageLabel.Text = "Photo name size must be less than 20 character!!";
                    messageLabel.ForeColor = System.Drawing.Color.Red;
                    messageLabel.Visible = true;
                    return "";
                }
                string extension = Path.GetExtension(fileName);
                HttpPostedFile postedFile = productImageFileUpload.PostedFile;
                int length = postedFile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".gif" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (1000000 >= length)
                    {
                        productImageFileUpload.SaveAs(path + fileName);
                        //System.IO.Directory.CreateDirectory
                        string name = "FileUpload/images/ProductImages/" + fileName;
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

    }
}