<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="Lab_04.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container mt-3" style="max-width: 600px;">
        <h3 class="text-center text-success mb-4">THÊM HOA MỚI</h3>
        
        <div class="card p-4 shadow-sm">
            <div class="mb-3 row">
                <label class="col-sm-3 col-form-label fw-bold">Danh mục:</label>
                <div class="col-sm-9">
                    <asp:DropDownList ID="ddlLoai" runat="server" CssClass="form-select" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-3 col-form-label fw-bold">Tên hoa:</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtTenHoa" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTenHoa" runat="server" ControlToValidate="txtTenHoa" 
                        ErrorMessage="Tên hoa không được rỗng" ForeColor="Red" Display="Dynamic" ValidationGroup="vldThemHoa" >(*)</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-3 col-form-label fw-bold">Giá:</label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtGia" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGia" runat="server" ControlToValidate="txtGia" 
                        ErrorMessage="Giá không được rỗng" ForeColor="Red" Display="Dynamic" ValidationGroup="vldThemHoa" >(*)</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvGia" runat="server" ControlToValidate="txtGia" 
                        Operator="DataTypeCheck" Type="Double" ErrorMessage="Giá phải là kiểu số" 
                        ForeColor="Red" Display="Dynamic" ValidationGroup="vldThemHoa" >(*)</asp:CompareValidator>
                </div>
                <asp:ValidationSummary ID="vsLoi" runat="server" 
                ForeColor="Red" ValidationGroup="vldThemHoa" DisplayMode="BulletList" 
                HeaderText="Danh sách lỗi:" />
            </div>

            <div class="mb-3 row">
                <label class="col-sm-3 col-form-label fw-bold">Ngày cập nhật:</label>
                <div class="col-sm-9">
                    <asp:Calendar ID="cldNgayCapNhat" runat="server" SelectionMode="Day" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-3 col-form-label fw-bold">Hình:</label>
                <div class="col-sm-9">
                    <asp:FileUpload ID="fuHinh" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="text-center mt-3">
                <asp:Button ID="btnThem" runat="server" Text="Thêm mới" ValidationGroup="vldThemHoa" CssClass="btn btn-success px-4" OnClick="btnThem_Click" />
                <br />
                <asp:Label ID="lblThongBao" runat="server" CssClass="mt-2 d-block fw-bold"></asp:Label>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
</asp:Content>
