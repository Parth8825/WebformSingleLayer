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

    <asp:GridView ID="gvOrders" runat="server">
    </asp:GridView>
<br />

</asp:Content>
