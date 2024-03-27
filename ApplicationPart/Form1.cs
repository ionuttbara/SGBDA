using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using Microsoft.VisualBasic;


namespace CarDealershipDatabase
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private SqlConnection connection;
        private void Form1_Load(object sender, EventArgs e)
        { 
            try
            {
                // Connect to the database
                string connectionString = "Data Source=IBBFA506II\\IBBSQLEXPRESS;Initial Catalog=SGBDAA;Integrated Security=True";
                connection = new SqlConnection(connectionString);
                connection.Open();
                PopulateFilterComboBox();
            }
            catch (SqlException ex)
            {
                // Connection failed, handle the exception
                MessageBox.Show("Failed to connect to the database.\nHere is the Error Message:\n " + ex.Message);
                // Optionally, you can log the exception details for debugging purposes
            }

            // Populate the ComboBox with table names
            DataTable tableNames = connection.GetSchema("Tables");
            foreach (DataRow row in tableNames.Rows)
            {
                tablesCombo.Items.Add(row["TABLE_NAME"]);
            }
            // Set Anchor property for controls
            tablesCombo.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            dataGridView1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            elementalText.Anchor = AnchorStyles.Left | AnchorStyles.Right;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Load data into DataGridView when a table is selected
            string selectedTable = tablesCombo.SelectedItem.ToString();
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM " + selectedTable, connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            dataGridView1.DataSource = dataTable;
            elementalText.Text = "Selected records: " + selectedTable;
            // Obțineți și afișați numărul de înregistrări din tabel
            int recordCount = GetRecordCount(selectedTable);
            elementalText.Text += " | There are : " + recordCount.ToString() + " records.";

        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            // Close the database connection when the form is closed
            if (connection != null && connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {

            string selectedTableName = tablesCombo.SelectedItem.ToString();

            using (var form = new CreateElementForm(selectedTableName, connection))
            {
                var result = form.ShowDialog();
                if (result == DialogResult.OK)
                {
                    // Afiseaza mesajul de succes
                    MessageBox.Show("Elementul a fost creat cu succes!", "Succes", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // Reincarca datele in DataGridView
                    //      LoadDataIntoDataGridView(selectedTableName);
                }
            }
        }

        private int GetRecordCount(string tableName)
        {
            int recordCount = 0;
            try
            {
                // Count records.
                string query = "SELECT COUNT(*) FROM " + tableName;
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    recordCount = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error.\n" + ex.Message, "Eroare", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return recordCount;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string selectedTableName = tablesCombo.SelectedItem.ToString();

            using (var form = new ReadDataForm(selectedTableName, connection))
            {
                form.ShowDialog();
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                // Check if a valid cell is clicked (not header or empty row)
                if (e.RowIndex >= 0 && e.ColumnIndex >= 0)
                {
                    // Get the selected cell
                    DataGridViewCell selectedCell = dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex];

                    // Get the table name, column name, and row ID
                    string tableName = tablesCombo.SelectedItem.ToString();
                    string columnName = dataGridView1.Columns[e.ColumnIndex].HeaderText;
                    int rowID = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["ID"].Value);
                    using (UpdateElementForm updateForm = new UpdateElementForm())
                    {
                        // Set the initial value in the input dialog to the current cell value
                        updateForm.textBoxInput.Text = selectedCell.Value?.ToString() ?? "";

                        // Show the update form
                        if (updateForm.ShowDialog() == DialogResult.OK)
                        {
                            // Update the cell value in the DataGridView
                            string newValue = updateForm.InputValue;
                            if (!string.IsNullOrEmpty(newValue))
                            {
                                selectedCell.Value = newValue;
                            }

                            // Update the database record
                            string updateQuery = $"UPDATE {tableName} SET {columnName} = @NewValue WHERE ID = @RowID";
                            using (SqlCommand command = new SqlCommand(updateQuery, connection))
                            {
                                command.Parameters.AddWithValue("@NewValue", newValue);
                                command.Parameters.AddWithValue("@RowID", rowID);
                                command.ExecuteNonQuery();
                            }
                        }
                    }

                        }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error modifying cell value: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string tableName = tablesCombo.SelectedItem.ToString();
            using (var selectElementForm = new SelectElementForm())
            {
                if (selectElementForm.ShowDialog() == DialogResult.OK)
                {
                }
            }
        }

        private void searchTextBox_TextChanged(object sender, EventArgs e)
        {
            string searchText = searchTextBox.Text.Trim().ToLower();

            // Check if there's a data source
            if (dataGridView1.DataSource is DataTable dataTable)
            {
                // Get the default view of the DataTable
                DataView dataView = dataTable.DefaultView;

                // Apply a filter to the default view based on the search text
                if (!string.IsNullOrEmpty(searchText))
                {
                    string filterExpression = string.Join(" OR ", dataTable.Columns.Cast<DataColumn>()
                                                                .Select(col => $"CONVERT([{col.ColumnName}], System.String) LIKE '%{searchText}%'"));
                    dataView.RowFilter = filterExpression;
                }
                else
                {
                    // If the search text is empty, clear the filter
                    dataView.RowFilter = string.Empty;
                }
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string selectedTableName = tablesCombo.SelectedItem.ToString();

            using (var form = new DeleteDataForm(connection,selectedTableName))
            {
                form.ShowDialog();
                // Optionally, you can reload the data into the DataGridView after the column is deleted
                // LoadDataIntoDataGridView(selectedTableName);
            }
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string selectedQuery = "";
                switch (comboBox2.SelectedIndex)
                {
                    case 0: // Selectare a tuturor mașinilor dintr-un anumit showroom
                        selectedQuery = @"
                    SELECT *
                    FROM Cars";
                        break;

                    case 1: // Selectare a tuturor mașinilor dintr-un anumit showroom
                        selectedQuery = @"
                    SELECT *
                    FROM Cars
                    WHERE ShowroomID = (SELECT ID FROM Showrooms WHERE Nume = 'Nume Showroom')";
                        break;
                    case 2: // Selectare a celor mai vechi și celor mai noi modele de mașini
                        selectedQuery = @"
                    SELECT MIN(An) AS CelMaiVechiModel, MAX(An) AS CelMaiNouModel
                    FROM Cars";
                        break;
                    case 3: // Detalii testdrive pentru masinile de culoare alba
                        selectedQuery = @"SELECT *
FROM TestDrivesDetailsView
WHERE CarColor = 'alb';";
                        break;
                    case 4: // Lista JSON-Array cu toate Caracteristicile primei masini
                        selectedQuery = @"DECLARE @CarID INT = 1; -- Înlocuiește 1 cu ID-ul real al mașinii

SELECT (SELECT Nume
        FROM Features
        WHERE ID IN (SELECT ID FROM Features WHERE ID= @CarID)
        FOR JSON PATH) AS CarFeatures;";
                        break;
                    case 5: // Clientii care au cumparat mai mult de o masina
                        selectedQuery = @"SELECT cu.ID, cu.Nume, cu.Prenume, COUNT(s.CarID) AS TotalCarsBought
FROM Customers cu
INNER JOIN Sales s ON cu.ID = s.CustomerID
GROUP BY cu.ID, cu.Nume, cu.Prenume
HAVING COUNT(s.CarID) > 1;";
                        break;
                    default:
                        break;
                }

                if (!string.IsNullOrEmpty(selectedQuery))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(selectedQuery, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error applying filter: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void PopulateFilterComboBox()
        {
            try
            {
                comboBox2.Items.Clear();
                comboBox2.Items.Add("Toate masinile existente");
                comboBox2.Items.Add("Mașini dintr-un showroom specific");
                comboBox2.Items.Add("Cele mai vechi și cele mai noi modele de mașini");
                comboBox2.Items.Add("Detalii testdrive pentru masinile de culoare alba");
                comboBox2.Items.Add("Lista JSON-Array cu toate Caracteristicile primei masini");
                comboBox2.Items.Add("Clientii care au cumparat mai mult de o masina");
                comboBox2.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Eroare la popularea filtrului: " + ex.Message, "Eroare", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }

}