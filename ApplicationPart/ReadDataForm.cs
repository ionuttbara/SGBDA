using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CarDealershipDatabase
{
    public partial class ReadDataForm : Form
    {
        private string tableName;
        private SqlConnection connection;

        public ReadDataForm(string tableName, SqlConnection connection)
        {
            InitializeComponent();
            this.tableName = tableName;
            this.connection = connection;
            this.Text = "View " + tableName + " Data";

            // Inițializați DataGridView cu datele din tabel
            LoadDataIntoDataGridView();
        }

        private void LoadDataIntoDataGridView()
        {
            try
            {
                string query = "SELECT * FROM " + tableName;
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("A apărut o eroare în timpul încărcării datelor:\n" + ex.Message, "Eroare", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Alte metode pentru căutare, sortare etc. pot fi adăugate aici
    }
}
