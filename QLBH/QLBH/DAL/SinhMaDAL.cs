using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH.DAL
{
    public class SinhMaDAL
    {
        public static string LayMaMaxHHDAL()
        {
            
            return DatabaseQuery.ExecuteGet("Sp_MaMaxHH", null);
        }

        public static string LayMaMaxKhoDAL()
        {
            return DatabaseQuery.ExecuteGet("Sp_MaMaxKho", null);
        }
    }
}
