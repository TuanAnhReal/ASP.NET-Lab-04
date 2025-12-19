using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_04
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        string strConn = ConfigurationManager.ConnectionStrings["HoaTuoiDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cldNgayCapNhat.SelectedDate = DateTime.Now;
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string tenFile = "";
                    if (fuHinh.HasFile)
                    {
                        // Lấy tên file và lưu vào thư mục chỉ định
                        tenFile = Path.GetFileName(fuHinh.FileName);
                        string path = Server.MapPath("~/Uploads/Hinh_San_Pham/") + tenFile;
                        fuHinh.SaveAs(path);
                    }

                    using (SqlConnection conn = new SqlConnection(strConn))
                    {
                        string sql = "INSERT INTO Hoa(TenHoa, Gia, Hinh, MaLoai, NgayDang, SoLuotXem) " +
                                     "VALUES (@ten, @gia, @hinh, @maloai, @ngay, @luotxem)";
                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@ten", txtTenHoa.Text);
                        cmd.Parameters.AddWithValue("@gia", txtGia.Text);
                        cmd.Parameters.AddWithValue("@hinh", tenFile);
                        cmd.Parameters.AddWithValue("@maloai", ddlLoai.SelectedValue);
                        cmd.Parameters.AddWithValue("@ngay", cldNgayCapNhat.SelectedDate);
                        cmd.Parameters.AddWithValue("@luotxem", 0); // Mặc định lượt xem = 0

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        lblThongBao.Text = "Thêm hoa mới thành công!";
                        lblThongBao.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception ex)
                {
                    lblThongBao.Text = "Thất bại: " + ex.Message;
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}