using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH.DAL
{
    public class NhanVienDAL
    {
        public static DataTable Select()
        {
            return DatabaseQuery.GetList("Sp_ListNV", null);
        }
    }
}
