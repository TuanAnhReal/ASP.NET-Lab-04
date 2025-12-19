using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_04
{
    public partial class TraCuu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string strConn = ConfigurationManager.ConnectionStrings["HoaTuoiDB"].ConnectionString;

        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            // Chỉ thực thi khi các Validator đã kiểm tra hợp lệ
            if (Page.IsValid)
            {
                double giaTu = 0;
                double giaDen = double.MaxValue;

                // Ép kiểu an toàn sau khi đã qua bước Validation
                if (!string.IsNullOrEmpty(txtGiaTu.Text)) giaTu = double.Parse(txtGiaTu.Text);
                if (!string.IsNullOrEmpty(txtGiaDen.Text)) giaDen = double.Parse(txtGiaDen.Text);

                using (SqlConnection conn = new SqlConnection(strConn))
                {
                    string sql = "SELECT * FROM Hoa WHERE Gia >= @giaTu AND Gia <= @giaDen";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@giaTu", giaTu);
                    cmd.Parameters.AddWithValue("@giaDen", giaDen);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptHoa.DataSource = dt;
                    rptHoa.DataBind();
                }
            }
        }
    }
}