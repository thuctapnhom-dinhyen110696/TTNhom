using QLBH.DAL;
using QLBH.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH.Controller
{
    class KhoCtrl
    {
        public static DataTable ListALl()
        {
            return KhoDAL.Select();
        }
        public static int Kho_insert(KhoDAO kho)
        {
            return KhoDAL.Insert(kho);
        }

        public static int Kho_update(KhoDAO kho)
        {
            return KhoDAL.Update(kho);
        }

        public static int Kho_delete(string maKho)
        {
            return KhoDAL.Delete(maKho);
        }
        public static DataTable Kho_search(string keyword)
        {
            return KhoDAL.Search(keyword);
        }

    }
}
