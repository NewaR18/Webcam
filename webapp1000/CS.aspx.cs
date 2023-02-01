using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;

public partial class CS : System.Web.UI.Page
{
    [WebMethod()]
    public static int SaveCapturedImage(string data)
    {
        int a=2;
        string fileName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
        //Convert Base64 Encoded string to Byte Array.
        byte[] imageBytes = Convert.FromBase64String(data.Split(',')[1]);
        SqlConnection con = new SqlConnection("server=NEWAR-PC; database=Infodev1; Integrated Security=SSPI");
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "insertimageonly";
            cmd.Parameters.Add("@img", SqlDbType.Image).Value = imageBytes;
            cmd.Connection = con;
            con.Open();
            using(SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        a = Convert.ToInt32(reader["sudip"]);
                    }
                }
            }
            con.Close();
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return a;
    }
}