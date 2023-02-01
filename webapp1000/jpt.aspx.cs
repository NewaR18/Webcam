using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp1000
{
    public partial class jpt : System.Web.UI.Page
    {
        public static string value="0";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string conval = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Submitted(object sender, EventArgs e)
        {
            int uploadedid = 0;
            uploadedid=Convert.ToInt32(value);
            if (!upload2.HasFile && uploadedid==0)
            {
                Label1.Visible = true;
                Label1.Text = "Please Select Image File";
            }
            else if (upload2.PostedFile.ContentLength > 100000)
            {
                Label1.Visible = true;
                Label1.Text = "Maximum File Limit:100KB";
            }
            else
            {
                int length = upload2.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                string response = "";
                upload2.PostedFile.InputStream.Read(pic, 0, length);
                try
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "Register";
                        using (SqlConnection conn = new SqlConnection(conval))
                        {
                            cmd.Connection = conn;
                            conn.Open();
                            cmd.CommandTimeout = 30;
                            cmd.Parameters.AddWithValue("@uid", uploadedid);
                            cmd.Parameters.AddWithValue("@name", name.Text);
                            cmd.Parameters.AddWithValue("@address", address.Text);
                            cmd.Parameters.AddWithValue("@email", email.Text);
                            cmd.Parameters.AddWithValue("@phone", phone.Text);
                            cmd.Parameters.Add("@img", SqlDbType.Image).Value = pic;
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        response = reader.GetString(0);
                                    }
                                }
                            }
                        }
                    }
                    Label1.Visible = true;
                    Label1.Text = response;
                    if (response == "Submitted")
                    {
                        Response.Redirect("Card.aspx?uid="+uploadedid);
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }
        /*protected void changed(object sender, EventArgs e)
        {
            if (upload.HasFile)
            {
                take.Visible = false;
            }
        }*/
        [WebMethod()]
        public static string getfromCSPage(string num)
        {
            value = num;
            return "Sub.aspx";
        }
    }

}