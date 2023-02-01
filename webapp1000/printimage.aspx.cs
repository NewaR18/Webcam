using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp1000
{
    public partial class printimage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*// create a connection to the database
            SqlConnection connection = new SqlConnection("server=NEWAR-PC; database=Infodev1; Integrated Security=SSPI");

            // create a command to retrieve the image data
            SqlCommand command = new SqlCommand("SELECT image FROM Image_table WHERE Id = 1", connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            // check if a record was returned
            if (reader.Read())
            {
                // retrieve the image data
                byte[] imageData = (byte[])reader["image"];
                Response.ContentType = "image/jpeg";
                Response.AddHeader("Content-Disposition", "attachment; filename=image.jpg");
                Response.OutputStream.Write(imageData, 0, imageData.Length);
            }
            reader.Close();
            connection.Close();
            Response.End();*/

            if (Request.QueryString["ImageID"] != null)

            {

                string strQuery = "select Id,image from Image_table where Id=23";

                SqlCommand cmd = new SqlCommand(strQuery);

                /*cmd.Parameters.Add("@id", SqlDbType.Int).Value*/

                /*= Convert.ToInt32(Request.QueryString["ImageID"]);*/

                DataTable dt = GetData(cmd);

                if (dt != null)

                {

                    Byte[] bytes = (Byte[])dt.Rows[0]["image"];

                    Response.Buffer = true;

                    Response.Charset = "";

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);


                    Response.AddHeader("content-disposition", "attachment;filename="

                    + dt.Rows[0]["Id"].ToString());

                    Response.BinaryWrite(bytes);

                    Response.Flush();

                    Response.End();

                }

            }
        }
        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("server=NEWAR-PC; database=Infodev1; Integrated Security=SSPI");
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }
    }
}