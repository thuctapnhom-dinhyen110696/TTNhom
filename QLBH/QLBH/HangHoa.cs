using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLBH.Controller;
using QLBH.DAO;

namespace QLBH
{
    public partial class HangHoa : Form
    {
        HangHoaDAO hanghoa = null;
        public int action = 0;
             
        public HangHoa()
        {
            InitializeComponent();
            hanghoa = new HangHoaDAO();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            XoaTextbox();
            TaoMaHH();
            action = 1;
        }

        private void HangHoa_Load(object sender, EventArgs e)
        {
            dgvHH.DataSource = HangHoaCtrl.ListALl();
            cmbMaKho.DataSource = KhoCtrl.ListALl();
            cmbMaKho.DisplayMember = "Tên Kho";
            cmbMaKho.ValueMember = "Mã Kho";
        }

        public void LayDL()
        {
            hanghoa.TenHH = txtTenHH.Text;
            hanghoa.NoiSX = txtNoiSX.Text;
            hanghoa.DonVi = txtDonVi.Text;
            hanghoa.Gia = txtGia.Text;
            hanghoa.MaKho = cmbMaKho.SelectedValue.ToString();
        }

        public int ThemHH()
        {
            LayDL();
            try
            {
                int result = HangHoaCtrl.HH_insert(hanghoa);
                return result;
            }
            catch(Exception e)
            {
                return -1;
            }
            
        }

        public int SuaHH()
        {
            LayDL();
            hanghoa.MaHH = txtMaHH.Text;
            try
            {
                int result = HangHoaCtrl.HH_update(hanghoa);
                return result;
            }
            catch (Exception e)
            {
                return -1;
            }
        }

        public void XoaTextbox()
        {
            txtDonVi.Text = "";
            txtGia.Text = "";
            txtNoiSX.Text = "";
            txtTenHH.Text = "";
        }

        public void TaoMaHH()
        {
            string ma = SinhMaCtrl.MaMaxHH();
            hanghoa.MaHH = (Convert.ToInt32(ma) + 1).ToString();
            txtMaHH.Text = hanghoa.MaHH;
        }


        private void btnLuu_Click(object sender, EventArgs e)
        {
            int res;
            if (action == 1)
            {
                res = ThemHH();
                if(res > 0)
                {
                    MessageBox.Show("Thêm hàng hóa thành công!");
                    dgvHH.DataSource = HangHoaCtrl.ListALl();
                }
                else
                {
                    MessageBox.Show("Chưa thêm được hàng hóa mới!");
                }
            }
            else if (action == 2)
            {
                res = SuaHH();
                if (res > 0)
                {
                    MessageBox.Show("Cập nhật hàng hóa thành công!");
                    dgvHH.DataSource = HangHoaCtrl.ListALl();
                }
                else
                {
                    MessageBox.Show("Chưa cập nhật được thông tin hàng hóa!");
                }
            }
        }

        private void dgvHH_SelectionChanged(object sender, EventArgs e)
        {
            txtMaHH.Text = dgvHH.CurrentRow.Cells[0].Value.ToString();
            txtTenHH.Text = dgvHH.CurrentRow.Cells[1].Value.ToString();
            txtNoiSX.Text = dgvHH.CurrentRow.Cells[2].Value.ToString();
            txtDonVi.Text = dgvHH.CurrentRow.Cells[3].Value.ToString();
            cmbMaKho.SelectedValue = dgvHH.CurrentRow.Cells[4].Value;
            txtGia.Text = dgvHH.CurrentRow.Cells[5].Value.ToString();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            action = 2;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int res = HangHoaCtrl.HH_delete(txtMaHH.Text);
            if(res > 0)
            {
                MessageBox.Show("Xóa thành công!");
                dgvHH.DataSource = HangHoaCtrl.ListALl();
            }
            else
            {
                MessageBox.Show("Chưa xóa được hàng hóa đã chọn!");
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            dgvHH.DataSource = HangHoaCtrl.HH_search(txtSearch.Text);
        }
    }
}
