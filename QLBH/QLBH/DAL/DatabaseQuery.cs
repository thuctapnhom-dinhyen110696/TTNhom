using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH.DAL
{
    public class DatabaseQuery
    {
        public static SqlConnection conn;
        public static SqlConnection Connect()
        {
            try
            {
                string sql = @"Data Source=DESKTOP-V2HABOD\SQLEXPRESS;Initial Catalog=tt_nhom;Integrated Security=True";
                SqlConnection con = new SqlConnection(sql);
                if (con.State == ConnectionState.Broken || con.State == ConnectionState.Closed)
                    con.Open();
                return con;
            }
            catch (SqlException)
            {
                return null;
            }
        }

        public static DataTable GetList(string proc, SqlParameter[] para)
        {
            try
            {
                conn = Connect();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = proc;
                cmd.CommandType = CommandType.StoredProcedure;
                if (para != null)
                    cmd.Parameters.AddRange(para);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                conn.Close();
                return dt;
            }
            catch (SqlException)
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                return null;
            }
        }
        public static int Execute(string proc, SqlParameter[] para)
        {
            try
            {
                conn = Connect();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = proc;
                cmd.CommandType = CommandType.StoredProcedure;
                if (para != null)
                    cmd.Parameters.AddRange(para);
                int res = cmd.ExecuteNonQuery();

                return res;
            }
            catch (SqlException)
            {
                return 0;
            }
            conn.Close();
        }

        public static string ExecuteGet(string proc, SqlParameter[] para)
        {
            try
            {
                conn = Connect();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = proc;
                cmd.CommandType = CommandType.StoredProcedure;
                if (para != null)
                    cmd.Parameters.AddRange(para);
                string res = cmd.ExecuteScalar().ToString();
                conn.Close();
                return res;
            }
            catch (SqlException)
            {
                return "";
            }
        }


    }
}
