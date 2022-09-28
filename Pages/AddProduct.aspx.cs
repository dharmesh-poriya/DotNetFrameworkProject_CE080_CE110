using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addProductButton_Click(object sender, EventArgs e)
        {
            
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
                Response.Write("<script>alert('valid');</script>");
            }
            else
            {
                Response.Write("<script>alert('File is not valid');</script>");
            }
        }

        private string chackFileValidation()
        {
            string path = Server.MapPath("~/images/product/");

            if (productImageFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(productImageFileUpload.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile postedFile = productImageFileUpload.PostedFile;
                int length = postedFile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".gif" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (1000000 >= length)
                    {
                        productImageFileUpload.SaveAs(path + fileName);
                        //System.IO.Directory.CreateDirectory
                        string name = "files/" + fileName;
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