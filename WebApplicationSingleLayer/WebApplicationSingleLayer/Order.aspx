<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplicationSingleLayer.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2> Welcome to Inventory Management Solutions!!</h2>
      <br /><br />
    <h1><span class="badge bg-info btn-lg btn-block">Eenter New Order</span></h1>

   <div class="form-group row">
        <label for="salesmanNo" class="col-sm-2 col-form-label">Order No</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtOrderNo" runat="server" placeholder="order no"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="salesmanName" class="col-sm-2 col-form-label">Purchase Amount</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtPurchAmt" runat="server" placeholder="Amount"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="city" class="col-sm-2 col-form-label">Order Date</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtOrderDate" TextMode="DateTimeLocal" runat="server" placeholder="date"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="commission" class="col-sm-2 col-form-label">Customer Id</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCustId" runat="server" placeholder="customer id"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="commission" class="col-sm-2 col-form-label">Salesman Id</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtSalsId" runat="server" placeholder="salesman id"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Enter Order"></asp:Button>
        </div>
    </div>
    <br /><br />
    <h1><span class="badge bg-success btn-lg btn-block">Existing Orders</span></h1>

    <div class="text-center">

    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" DataKeyNames="order_no" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="order_no" HeaderText="order_no" ReadOnly="True" SortExpression="order_no" />
            <asp:BoundField DataField="purch_amt" HeaderText="purch_amt" SortExpression="purch_amt" />
            <asp:BoundField DataField="ord_date" HeaderText="ord_date" SortExpression="ord_date" />
            <asp:BoundField DataField="customer_id" HeaderText="customer_id" SortExpression="customer_id" />
            <asp:BoundField DataField="salesman_id" HeaderText="salesman_id" SortExpression="salesman_id" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" DeleteCommand="DELETE FROM [orders] WHERE [order_no] = @order_no" InsertCommand="INSERT INTO [orders] ([order_no], [purch_amt], [ord_date], [customer_id], [salesman_id]) VALUES (@order_no, @purch_amt, @ord_date, @customer_id, @salesman_id)" SelectCommand="SELECT * FROM [orders]" UpdateCommand="UPDATE [orders] SET [purch_amt] = @purch_amt, [ord_date] = @ord_date, [customer_id] = @customer_id, [salesman_id] = @salesman_id WHERE [order_no] = @order_no">
        <DeleteParameters>
            <asp:Parameter Name="order_no" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="order_no" Type="Int32" />
            <asp:Parameter Name="purch_amt" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="ord_date" />
            <asp:Parameter Name="customer_id" Type="Int32" />
            <asp:Parameter Name="salesman_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="purch_amt" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="ord_date" />
            <asp:Parameter Name="customer_id" Type="Int32" />
            <asp:Parameter Name="salesman_id" Type="Int32" />
            <asp:Parameter Name="order_no" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br />

</asp:Content>
