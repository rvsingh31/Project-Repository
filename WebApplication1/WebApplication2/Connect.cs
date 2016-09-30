using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Web.SessionState;


namespace Connect
{
    public class ConnectClass
    {

       static  string constr = WebConfigurationManager.ConnectionStrings["database"].ConnectionString;

            SqlConnection conn = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand();
            public void setConnection()
            {
                  this.cmd.Connection = this.conn;
            }
            
        public void setCommand(string s)
        {
            this.cmd.CommandText = s;
        }
            public void openConnection()
            {
                     this.conn.Open();
            }

        public void setParameter(string a,string b)
        {
            this.cmd.Parameters.AddWithValue(a,b);
        }
        public void closeConnection()
        {
            this.conn.Close();
        }

        public SqlDataReader getDDLResults()
        {
            return this.cmd.ExecuteReader();
        }

        public int getDMLResults()
        {
            return this.cmd.ExecuteNonQuery();
        }

        public SqlDataAdapter getDataAdapter()
        {
            SqlDataAdapter sd = new SqlDataAdapter(this.cmd);
            return sd;
        }

    }
}