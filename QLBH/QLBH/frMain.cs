using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBH
{
    public partial class frMain : Form
    {
        public frMain()
        {
            InitializeComponent();
        }

        private void hàngHóaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            HangHoa frHH = new HangHoa();
            frHH.ShowDialog();
        }

        private void khoHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Kho frKho = new Kho();
            frKho.ShowDialog();
        }
    }
}
