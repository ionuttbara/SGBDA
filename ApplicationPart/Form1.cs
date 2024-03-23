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
            // Connect to the database
            string connectionString = "Data Source=IBBFA506II\\IBBSQLEXPRESS;Initial Catalog=SGBDDA;Integrated Security=True";
            connection = new SqlConnection(connectionString);
            connection.Open();

            // Populate the ComboBox with table names
            DataTable tableNames = connection.GetSchema("Tables");
            foreach (DataRow row in tableNames.Rows)
            {
                comboBox1.Items.Add(row["TABLE_NAME"]);
            }
            // Set Anchor property for controls
            comboBox1.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            dataGridView1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Load data into DataGridView when a table is selected
            string selectedTable = comboBox1.SelectedItem.ToString();
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM " + selectedTable, connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            dataGridView1.DataSource = dataTable;
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
            if (comboBox1.SelectedItem == null)
            {
                MessageBox.Show("Selectați un tabel înainte de a adăuga date!", "Avertisment", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string selectedTable = comboBox1.SelectedItem.ToString();
            switch (selectedTable)
            {
                case "Brands":
                    AddBrand();
                    break;
                case "Models":
                    AddModel();
                    break;
                // Adaugă cazuri pentru celelalte tabele
                default:
                    MessageBox.Show("Tabelul selectat nu este gestionat pentru adăugare de date.", "Eroare", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }
        private void AddBrand()
        {
            using (var form = new AddBrandForm())
            {
                var result = form.ShowDialog();
                if (result == DialogResult.OK)
                {
                    // Se obțin valorile introduse în formular și se adaugă în baza de date
                    // Exemplu:
                    // string brandName = form.BrandName;
                    // Adaugare în baza de date utilizând un SqlCommand
                }
            }
        }

        private void AddModel()
        {
            // Implementare similară cu AddBrand() pentru adăugarea de modele
            // Se utilizează un alt formular (AddModelForm) pentru introducerea datelor
        }
    }
}
