using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationSingleLayer
{
    public partial class Order : System.Web.UI.Page
    {
        private string _connectinString = ConfigurationManager.ConnectionStrings["InventoryConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int orderNo = int.Parse(txtOrderNo.Text);
            double purchAmt = double.Parse(txtPurchAmt.Text);
            DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);
            int customerId = int.Parse(txtCustId.Text);
            int salesmanId = int.Parse(txtSalsId.Text);

            var query = $"INSERT INTO orders(order_no, purch_amt, ord_date, customer_id, salesman_id) VAlUES({orderNo}, {purchAmt}, '{orderDate.Date}', {customerId}, {salesmanId});"; 
            SqlConnection connection = new SqlConnection(_connectinString);
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(query, connection); 
                cmd.ExecuteNonQuery();
                BindGridView();
                ClearFormFields();
                DateSave();
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                throw new Exception(message, ex);   
            }
            finally
            {
                connection.Close(); 
            }
        }
        private void BindGridView()
        {
            SqlConnection connection = new SqlConnection(_connectinString);
            try
            {
                connection.Open();

                var query = "SELECT * FROM orders;";
                SqlCommand cmd = new SqlCommand(query, connection);
                DataTable DT = new DataTable();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(DT);

                if (DT.Rows.Count > 0)
                {
                    gvOrders.DataSource = DT;
                    gvOrders.DataBind();
                }
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                throw new Exception(message, ex);
            }
            finally { connection.Close(); }
        }
        private void ClearFormFields()
        {
            txtCustId.Text = "";
            txtOrderDate.Text = "";
            txtOrderNo.Text = "";
            txtPurchAmt.Text = "";
            txtSalsId.Text = "";
            txtOrderNo.Focus();
        }
        private void DateSave()
        {
            //Insert record here.

            //Display success message.
            string message = "Order details have been saved successfully.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}