using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLBH.DAL;

namespace QLBH.Controller
{
    public class SinhMaCtrl
    {
        public static string MaMaxHH()
        {
            return SinhMaDAL.LayMaMaxHHDAL();
        }
        public static string MaMaxKho()
        {
            return SinhMaDAL.LayMaMaxKhoDAL();
        }
    }
}
