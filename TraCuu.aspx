<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="Lab_04.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container mt-3">
        <div class="row mb-3 shadow-sm p-3 bg-light rounded">
            
            <div class="col-md-12 d-flex align-items-center flex-wrap gap-3">
    <span class="fw-bold">Giá bán từ:</span>
    <asp:TextBox ID="txtGiaTu" runat="server" CssClass="form-control" Width="120px"></asp:TextBox>
    
    <span class="fw-bold">đến:</span>
    <asp:TextBox ID="txtGiaDen" runat="server" CssClass="form-control" Width="120px"></asp:TextBox>
    
    <asp:Button ID="btnTraCuu" runat="server" Text="Tìm kiếm" 
    CssClass="btn btn-primary" OnClick="btnTraCuu_Click" 
    ValidationGroup="vldTimKiem" />
</div>

<div class="col-12 mt-2">
    <asp:CompareValidator ID="cvGiaTu" runat="server" ControlToValidate="txtGiaTu" 
        Operator="DataTypeCheck" Type="Double" ErrorMessage="Giá từ phải là số" 
        CssClass="text-danger d-block" Display="Dynamic" ValidationGroup="vldTimKiem">(*)</asp:CompareValidator>
    
    <asp:CompareValidator ID="cvGiaDen" runat="server" ControlToValidate="txtGiaDen" 
        Operator="DataTypeCheck" Type="Double" ErrorMessage="Giá đến phải là số" 
        CssClass="text-danger d-block" Display="Dynamic" ValidationGroup="vldTimKiem">(*)</asp:CompareValidator>

    <asp:CompareValidator ID="cvSoSanhGia" runat="server" ControlToValidate="txtGiaDen" 
        ControlToCompare="txtGiaTu" Operator="GreaterThanEqual" Type="Double" 
        ErrorMessage="Giá đến phải lớn hơn hoặc bằng giá từ" 
        CssClass="text-danger d-block" Display="Dynamic" ValidationGroup="vldTimKiem">(*)</asp:CompareValidator>
    <asp:ValidationSummary ID="vsLoi" runat="server" 
    ForeColor="Red" ValidationGroup="vldTimKiem" DisplayMode="BulletList" 
    HeaderText="Danh sách lỗi:" />
</div>

        </div>

        <div class="row">
            <asp:Repeater ID="rptHoa" runat="server">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card h-100 shadow-sm text-center">
                            <img src='<%# "/Uploads/Hinh_San_Pham/" + Eval("Hinh") %>' 
                                 class="card-img-top p-2" style="height: 180px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <h6 class="card-title fw-bold"><%# Eval("TenHoa") %></h6>
                                <p class="card-text text-danger fw-bold mt-auto">
                                    Giá bán: <%# Eval("Gia", "{0:#,##0} đồng") %>
                                </p>
                                <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CssClass="btn btn-success w-100" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
