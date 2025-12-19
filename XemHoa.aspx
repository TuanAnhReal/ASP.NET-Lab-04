<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="Lab_04.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:DropDownList ID="ddlLoai" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai" Height="36px" Width="231px" AutoPostBack="True"></asp:DropDownList>

<asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
    <ItemTemplate>
        <img src="/Uploads/Hinh_San_Pham/<%#  Eval("Hinh") %>" > <br />
        <%# Eval("TenHoa") %> <br />
       <span class="text-danger"> <%# Eval("Gia", "{0: #,##0} đồng") %> </span> <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add to Card" /> <br />
    </ItemTemplate>
</asp:Repeater>


    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>" ProviderName="<%$ ConnectionStrings:HoaTuoiDB.ProviderName %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" ProviderName="<%$ ConnectionStrings:HoaTuoiDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
