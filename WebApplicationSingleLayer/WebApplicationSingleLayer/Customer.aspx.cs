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
    public partial class Customer : System.Web.UI.Page
    {
        private string _connectionString = ConfigurationManager.ConnectionStrings["InventoryConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gvCustomer.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int custId = int.Parse(txtCustID.Text);
            string custName = txtCustName.Text;
            string city = txtCity.Text;
            double grade = double.Parse(txtGrade.Text);
            int salesId = int.Parse(txtSalesId.Text);

            var query = $"INSERT INTO customer(customer_id, cust_name, city, grade, salesman_id) VALUES({custId}, '{custName}', '{city}', {grade}, {salesId});";

            SqlConnection connection = new SqlConnection(_connectionString);

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(query, connection); 
                cmd.ExecuteNonQuery();
                gvCustomer.DataBind();
                //BindGridView();
                ClearFormFields();
                DateSaveMessage();
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

        //private void BindGridView()
        //{
        //    SqlConnection connection = new SqlConnection(_connectionString);
        //    try
        //    {
        //        connection.Open();
        //        var query = "SELECT * FROM customer;";
        //        SqlCommand cmd = new SqlCommand(query, connection);
        //        DataTable DT = new DataTable();
        //        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //        adapter.Fill(DT);   
        //        if(DT.Rows.Count > 0)
        //        {
        //            gvCustomer.DataSource = DT;
        //            gvCustomer.DataBind();
        //        }
        //    }
        //    catch(Exception ex)
        //    {
        //        string message = ex.Message;
        //        throw new Exception (message, ex);
        //    }
        //    finally
        //    {
        //        connection.Close();
        //    }
        //}

        private void ClearFormFields()
        {
            txtCustID.Text = "";
            txtCustName.Text = "";
            txtCity.Text = "";
            txtGrade.Text = "";
            txtSalesId.Text = "";
            txtCustID.Focus();

        }
        private void DateSaveMessage()
        {
            //Insert record here.

            //Display success message.
            string message = "Customer details have been saved successfully.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}