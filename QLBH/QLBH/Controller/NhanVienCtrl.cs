using QLBH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH.Controller
{
    class NhanVienCtrl
    {
        public static DataTable ListALl()
        {
            return NhanVienDAL.Select();
        }
    }
}
