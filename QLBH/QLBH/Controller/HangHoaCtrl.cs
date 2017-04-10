using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLBH.DAL;
using QLBH.DAO;

namespace QLBH.Controller
{
     class HangHoaCtrl
    {
        public static DataTable ListALl()
        {
            return HangHoaDAL.Select();
        }

        public static int HH_insert(HangHoaDAO hanghoa)
        {
            return HangHoaDAL.Insert(hanghoa);
        }

        public static int HH_update(HangHoaDAO hanghoa)
        {
            return HangHoaDAL.Update(hanghoa);
        }

        public static int HH_delete(string maHH)
        {
            return HangHoaDAL.Delete(maHH);
        }

        public static DataTable HH_search(string keyword)
        {
            return HangHoaDAL.Search(keyword);
        }

    }
}
