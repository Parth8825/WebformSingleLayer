<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="WebApplicationSingleLayer.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Welcome to Customer Page!!</h2>
      <br />

    <h2><span class="badge badge-info btn-lg btn-block">Enter a New Salesman</span></h2>
    <br />
    <div class="form-group row">
        <label for="salesmanNo" class="col-sm-2 col-form-label">Customer Id</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCustID" runat="server" placeholder="id"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="salesmanName" class="col-sm-2 col-form-label">Customer Name</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCustName" runat="server" placeholder="customer name"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="city" class="col-sm-2 col-form-label">City</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="city"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="commission" class="col-sm-2 col-form-label">Grade</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtGrade" runat="server" placeholder="Grade"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <label for="commission" class="col-sm-2 col-form-label">Salesman id</label>
        <div class="col-sm-10">
            <asp:TextBox class="form-control" ID="txtSalesId" runat="server" placeholder="salesman id"></asp:TextBox>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Enter Salesman"></asp:Button>
        </div>
    </div>


    <h1><span class="badge badge-success btn-lg btn-block">Existing Salesman</span></h1>

    <asp:GridView ID="gvCustomer" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="customer_id" DataSourceID="SqlDataSource1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="customer_id" HeaderText="customer_id" ReadOnly="True" SortExpression="customer_id" />
            <asp:BoundField DataField="cust_name" HeaderText="cust_name" SortExpression="cust_name" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="grade" HeaderText="grade" SortExpression="grade" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryConnectionString %>" DeleteCommand="DELETE FROM [customer] WHERE [customer_id] = @customer_id" InsertCommand="INSERT INTO [customer] ([customer_id], [cust_name], [city], [grade], [salesman_id]) VALUES (@customer_id, @cust_name, @city, @grade, @salesman_id)" SelectCommand="SELECT * FROM [customer]" UpdateCommand="UPDATE [customer] SET [cust_name] = @cust_name, [city] = @city, [grade] = @grade, [salesman_id] = @salesman_id WHERE [customer_id] = @customer_id">
        <DeleteParameters>
            <asp:Parameter Name="customer_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="customer_id" Type="Int32" />
            <asp:Parameter Name="cust_name" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="grade" Type="Int32" />
            <asp:Parameter Name="salesman_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cust_name" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="grade" Type="Int32" />
            <asp:Parameter Name="salesman_id" Type="Int32" />
            <asp:Parameter Name="customer_id" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>

    <br />
</asp:Content>
