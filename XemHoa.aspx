<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="Lab_04.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:DropDownList ID="ddlLoai" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai" Height="36px" Width="231px" AutoPostBack="True"></asp:DropDownList>

<div class="row mt-3 pb-3">
    <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
        <ItemTemplate>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm text-center">
                    <img src='/Uploads/Hinh_San_Pham/<%# Eval("Hinh") %>' 
                         class="card-img-top p-2" 
                         alt='<%# Eval("TenHoa") %>' 
                         style="height: 200px; object-fit: cover;">
                    
                    <div class="card-body d-flex flex-column">
                        <h6 class="card-title fw-bold text-dark">
                            <%# Eval("TenHoa") %>
                        </h6>
                        
                        <p class="card-text text-danger fw-bold mt-auto">
                            Giá bán: <%# Eval("Gia", "{0:#,##0} đồng") %>
                        </p>
                        
                        <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn btn-success w-100">
                            <i class="bi bi-cart-plus"></i> Add To Cart
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            <asp:Label ID="Label1" Visible="<%# rptHoa.Items.Count ==0 %>" runat="server" Text="Không có dữ liệu" CssClass="text-danger"></asp:Label>
        </FooterTemplate>
    </asp:Repeater>
</div>


    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>" ProviderName="<%$ ConnectionStrings:HoaTuoiDB.ProviderName %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" ProviderName="<%$ ConnectionStrings:HoaTuoiDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
