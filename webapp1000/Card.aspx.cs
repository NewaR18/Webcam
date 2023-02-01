using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp1000
{
    public partial class Card : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ImageID"] != null)

            {


                SqlCommand cmd = new SqlCommand();

                /*cmd.Parameters.Add("@id", SqlDbType.Int).Value*/

                /*= Convert.ToInt32(Request.QueryString["ImageID"]);*/

                DataTable dt = GetData(cmd);

                if (dt != null)

                {

                    Byte[] bytes = (Byte[])dt.Rows[0]["image"];

                    Response.Buffer = true;

                    Response.Charset = "";

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);


                    Response.AddHeader("content-disposition", "attachment;filename="+ dt.Rows[0]["Id"].ToString());

                    Response.BinaryWrite(bytes);

                    Response.Flush();

                    Response.End();

                }
            }
            using(SqlCommand cmd=new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "getcard";
                using(SqlConnection conn=new SqlConnection("server=NEWAR-PC; database=Infodev1; Integrated Security=SSPI"))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    using(SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if(rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                getname.Text=rdr["Name"].ToString();
                                getaddress.Text = rdr["Address"].ToString();
                                getemail.Text = rdr["Email"].ToString();
                                getphone.Text=rdr["PhoneNo"].ToString();
                            }
                        }
                    }
                }
            }
        }
        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("server=NEWAR-PC; database=Infodev1; Integrated Security=SSPI");
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getcard";
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