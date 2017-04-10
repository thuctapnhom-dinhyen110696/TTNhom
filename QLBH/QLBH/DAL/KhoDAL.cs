using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLBH.DAO;
using System.Data.SqlClient;

namespace QLBH.DAL
{
    public class KhoDAL
    {
        public static DataTable Select()
        {
            return DatabaseQuery.GetList("Sp_ListKho", null);
        }

        public static int Insert(KhoDAO kho)
        {
            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@makho",kho.MaKho),
                new SqlParameter("@tenkho",kho.TenKho),
                new SqlParameter("@vitri",kho.ViTri),
                new SqlParameter("@manv",kho.MaNV)
             };
            return DatabaseQuery.Execute("them_kho", para);
        }

        public static int Update(KhoDAO kho)
        {
            SqlParameter[] para = new SqlParameter[]
             {
               new SqlParameter("@makho",kho.MaKho),
                new SqlParameter("@tenkho",kho.TenKho),
                new SqlParameter("@vitri",kho.ViTri),
                new SqlParameter("@manv",kho.MaNV)
             };
            return DatabaseQuery.Execute("sua_kho", para);
        }

        public static int Delete(string id)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@makho",id)
            };
            return DatabaseQuery.Execute("xoa_kho", para);
        }
        public static DataTable Search(string keyword)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@key",keyword)
            };
            return DatabaseQuery.GetList("Sp_searchKho", para);
        }

    }
}
