using QLBH.Controller;
using QLBH.DAO;
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
    public partial class Kho : Form
    {
        public KhoDAO kho = null;
        public int action = 0;
        public Kho()
        {
            InitializeComponent();
            kho = new KhoDAO();
        }

        private void Kho_Load(object sender, EventArgs e)
        {
            dgvListKho.DataSource = KhoCtrl.ListALl();
            cmbMaNV.DataSource = NhanVienCtrl.ListALl();
            cmbMaNV.DisplayMember = "TenNV";
            cmbMaNV.ValueMember = "MaNV";
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            XoaTextbox();
            TaoMaHH();
            action = 1;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            int res;
            if (action == 1)
            {
                res = ThemKho();
                if(res > 0)
                {
                    MessageBox.Show("Thêm kho thành công!");
                    dgvListKho.DataSource = KhoCtrl.ListALl();
                }
                else
                {
                    MessageBox.Show("Chưa thêm được kho mới!");
                }

            }
            else if (action == 2)
            {
                res = SuaKho();
                if (res > 0)
                {
                    MessageBox.Show("Cập nhật kho thành công!");
                    dgvListKho.DataSource = KhoCtrl.ListALl();
                }
                else
                {
                    MessageBox.Show("Chưa cập nhật được thông tin kho!");
                }

            }
        }

        public void XoaTextbox()
        {
            txtTenKho.Text = "";
            txtViTri.Text = "";
        }

        public void TaoMaHH()
        {
            string ma = SinhMaCtrl.MaMaxKho();
            kho.MaKho = (Convert.ToInt32(ma) + 1).ToString();
            txtMaKho.Text = kho.MaKho;
        }

        public void LayDL()
        {
            kho.TenKho = txtTenKho.Text;
            kho.ViTri = txtViTri.Text;
            kho.MaNV = cmbMaNV.SelectedValue.ToString();
        }

        public int ThemKho()
        {
            LayDL();
            try
            {
                int result = KhoCtrl.Kho_insert(kho);
                return result;
            }
            catch(Exception e)
            {
                return -1;
            }
        }

        public int SuaKho()
        {
            LayDL();
            kho.MaKho = txtMaKho.Text;
            try
            {
                int result = KhoCtrl.Kho_update(kho);
                return result;
            }
            catch (Exception e)
            {
                return -1;
            }
        }

        private void dgvListKho_SelectionChanged(object sender, EventArgs e)
        {
            txtMaKho.Text = dgvListKho.CurrentRow.Cells[0].Value.ToString();
            txtTenKho.Text = dgvListKho.CurrentRow.Cells[1].Value.ToString();
            txtViTri.Text = dgvListKho.CurrentRow.Cells[2].Value.ToString();
            cmbMaNV.SelectedValue = dgvListKho.CurrentRow.Cells[3].Value;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            action = 2;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int res = KhoCtrl.Kho_delete(txtMaKho.Text);
            if (res > 0)
            {
                MessageBox.Show("Xóa thành công!");
                dgvListKho.DataSource = KhoCtrl.ListALl();
            }
            else
            {
                MessageBox.Show("Chưa xóa được kho đã chọn!");
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            dgvListKho.DataSource = KhoCtrl.Kho_search(txtSearch.Text);
        }
    }
}
