using QLBH.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH.DAL
{
    public class HangHoaDAL
    {
        public static DataTable Select()
        {
            return DatabaseQuery.GetList("Sp_ListHH", null);
        }

        public static int Insert(HangHoaDAO hanghoa)
        {
            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@mahh",hanghoa.MaHH),
                new SqlParameter("@tenhh",hanghoa.TenHH),
                new SqlParameter("@noisx",hanghoa.NoiSX),
                new SqlParameter("@donvi",hanghoa.DonVi),
                new SqlParameter("@makho",hanghoa.MaKho),
                new SqlParameter("@gia",hanghoa.Gia),
             };
            return DatabaseQuery.Execute("them_hh", para);
        }

        public static int Update(HangHoaDAO hanghoa)
        {
            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@mahh",hanghoa.MaHH),
                new SqlParameter("@tenhh",hanghoa.TenHH),
                new SqlParameter("@noisx",hanghoa.NoiSX),
                new SqlParameter("@donvi",hanghoa.DonVi),
                new SqlParameter("@makho",hanghoa.MaKho),
                new SqlParameter("@gia",hanghoa.Gia),
             };
            return DatabaseQuery.Execute("sua_hh", para);
        }

        public static int Delete(string id)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@mahh",id)
            };
            return DatabaseQuery.Execute("xoa_hh", para);
        }

        public static DataTable Search(string keyword)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@key",keyword)
            };
            return DatabaseQuery.GetList("Sp_searchHH", para);
        }

    }
}
