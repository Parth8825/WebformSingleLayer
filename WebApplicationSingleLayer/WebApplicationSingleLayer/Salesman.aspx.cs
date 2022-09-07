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
    public partial class Salesman : System.Web.UI.Page
    {
        private string _connectionString = ConfigurationManager.ConnectionStrings["InventoryConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gvSalesman.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int salesmanID = Convert.ToInt32(txtID.Text);
            string name = txtSalesmanName.Text;
            string city = txtCity.Text;
            float commision = float.Parse(txtCommission.Text);

            var query = $"insert into salesman(salesman_id, name, city, commission) values({salesmanID},'{name}','{city}',{commision});";

            SqlConnection connection = new SqlConnection(_connectionString);


            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand(query, connection);

                cmd.ExecuteNonQuery();
                gvSalesman.DataBind();
               // BindGridView();

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

        //        var query = "select * from salesman;";
        //        SqlCommand cmd = new SqlCommand(query, connection);
        //        DataTable DT = new DataTable();

        //        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //        adapter.Fill(DT);

        //        if (DT.Rows.Count > 0)
        //        {
        //            gvSalesman.DataSource = DT;
        //            gvSalesman.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string message = ex.Message;
        //        throw new Exception(message, ex);
        //    }
        //    finally { connection.Close(); }

        //}

        private void ClearFormFields()
        {
            txtSalesmanName.Text = "";
            txtID.Text = "";
            txtCommission.Text = "";
            txtCity.Text = "";
            txtID.Focus();
        }

        private void DateSaveMessage()
        {
            //Insert record here.

            //Display success message.
            string message = "Salesman details have been saved successfully.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}