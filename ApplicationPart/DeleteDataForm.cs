using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CarDealershipDatabase
{
    public partial class DeleteDataForm : Form
    {
        private SqlConnection connection;
        private string tableName;

        public DeleteDataForm(SqlConnection connection, string tableName)
        {
            InitializeComponent();
            this.connection = connection;
            this.tableName = tableName;

            LoadData();
        }
        private void LoadData()
        {
            try
            {
                // Load data from the specified table into a DataTable
                SqlDataAdapter adapter = new SqlDataAdapter($"SELECT * FROM {tableName}", connection);
                DataTable table = new DataTable();
                adapter.Fill(table);

                // Bind the DataTable to the DataGridView
                dataView.DataSource = table;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the selected row
                int selectedRowIndex = dataView.CurrentCell.RowIndex;
                DataGridViewRow selectedRow = dataView.Rows[selectedRowIndex];

                // Get the value of the primary key column (assuming the first column as primary key)
                object primaryKeyValue = selectedRow.Cells[0].Value;

                // Construct the delete query
                string deleteQuery = $"DELETE FROM {tableName} WHERE {dataView.Columns[0].DataPropertyName} = @PrimaryKeyValue";

                // Execute the delete query
                SqlCommand command = new SqlCommand(deleteQuery, connection);
                command.Parameters.AddWithValue("@PrimaryKeyValue", primaryKeyValue);
                int rowsAffected = command.ExecuteNonQuery();

                // Inform the user about successful deletion
                MessageBox.Show(rowsAffected + " row(s) deleted successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Reload data into the DataGridView
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error deleting row: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
}
}
