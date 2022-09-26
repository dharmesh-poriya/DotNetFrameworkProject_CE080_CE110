using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAuctionSystem.autentication
{
    public partial class SignUp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupBtnId_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (isEmailAlreadyExist(emailTextBox.Text))
            {
                Response.Write("<script>alert('Entered email already used!!');</script>");
            } else {
                string fileName = chackFileValidation();
                if("" != fileName)
                {
                    //Response.Write(fileName);
                    string firstname = firstnameTextBox.Text;
                    string lastname = lastnameTextBox.Text;
                    int age = Convert.ToInt32(ageTextBox.Text);
                    string email = emailTextBox.Text;
                    string gender = genderSelectBox.SelectedValue;
                    string profilepic = "images/default.png";
                    DateTime currentDate = DateTime.Now;
                    string password = passwordTextBox.Text;
                    int loginId = doEnterDataInLoginTbl(email, password);
                    if(0 < loginId)
                    {
                        string query = "insert into [User] values(@fname,@lname,@age,@gender,@pancard,@img,@verify,@registerdate,@loginid)";

                        using (con)
                        {
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@fname", firstname);
                            cmd.Parameters.AddWithValue("@lname", lastname);
                            cmd.Parameters.AddWithValue("@age", age);
                            cmd.Parameters.AddWithValue("@gender", gender);
                            cmd.Parameters.AddWithValue("@pancard", fileName);
                            cmd.Parameters.AddWithValue("@img", profilepic);
                            cmd.Parameters.AddWithValue("@verify", "Pending");
                            cmd.Parameters.AddWithValue("@registerdate", currentDate);
                            cmd.Parameters.AddWithValue("@loginid", loginId);
                            con.Open();
                            int a = cmd.ExecuteNonQuery();

                            if (0 < a)
                            {
                                //Response.Write("Registration succeful!!");
                                Response.Redirect("Login.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Not inserted');</script>");
                            }
                        }
                        
                    }
                    else
                    {
                        Response.Write("<script>alert('Something went wrong!!');</script>");
                    }
                }
            }
        }

        private int doEnterDataInLoginTbl(string email, string password)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into Login values(@email,@password)";

            using (con)
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();
                int a = cmd.ExecuteNonQuery();

                if (0 < a)
                {
                    query = "select * from Login where email=@em";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@em", email);

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        return Convert.ToInt32(dr[0]);
                    }
                }
                else
                {
                    Response.Write("<script>alert('Something went Wrong!!');</script>");
                }
            }
            return -1;
        }

        private string chackFileValidation()
        {
            string path = Server.MapPath("../files/");
 
            if (documentFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(documentFileUpload.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile postedFile = documentFileUpload.PostedFile;
                int length = postedFile.ContentLength;

                if (extension.ToLower() == ".pdf")
                {
                    if (1000000 >= length)
                    {
                        documentFileUpload.SaveAs(path + fileName);
                        //System.IO.Directory.CreateDirectory
                        string name = "files/" + fileName;
                        return name;
                    }
                    else
                    {
                        Response.Write("<script>alert('File size shoulb be less than 1MB');</script>");
                        return "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('File must be in pdf formate.');</script>");
                    return "";
                }
            }
            return "";
        }

        private bool isEmailAlreadyExist(string email)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Login where email=@em";
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@em", email);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
            }
            return false;
        }
    }
}