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
    public partial class CreateElementForm : Form
    {
        private string tableName;
        private SqlConnection connection;
        public CreateElementForm(string tableName, SqlConnection connection)
        {
            InitializeComponent();
            this.tableName = tableName;
            this.connection = connection;
            this.Text = "Create element for " + tableName;
            LoadColumnNames();
            
        }
        private void LoadColumnNames()
        {
            try
            {
                string query = "SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TableName", tableName);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string columnName = reader.GetString(0);
                            string columnType = reader.GetString(1);

                            // Adauga un label pentru numele coloanei
                            Label lblColumnName = new Label();
                            lblColumnName.Text = columnName + ":";
                            lblColumnName.AutoSize = true;
                            flowLayoutPanel1.Controls.Add(lblColumnName);

                            // Adauga un textbox sau alt control corespunzator tipului coloanei
                            if (columnType == "D-ate")
                            {
                                DateTimePicker datePicker = new DateTimePicker();
                                datePicker.Format = DateTimePickerFormat.Short;
                                flowLayoutPanel1.Controls.Add(datePicker);
                            }
                            else if (columnName == "Tip_Binar")
                            {
                                ComboBox comboBox = new ComboBox();
                                comboBox.Items.AddRange(new object[] { "y", "n" });
                                comboBox.DropDownStyle = ComboBoxStyle.DropDownList;
                                flowLayoutPanel1.Controls.Add(comboBox);
                            }
                            else if (columnName == "Pozitie")
                            {
                                ComboBox comboBox = new ComboBox();
                                comboBox.Items.AddRange(new object[] { "Vanzator", "Manager", "Consultant financiar", "TestDrive Employee", "Administrator" });
                                comboBox.DropDownStyle = ComboBoxStyle.DropDownList;
                                flowLayoutPanel1.Controls.Add(comboBox);
                            }
                            else
                            {
                                // Dacă nu este un tip special de coloană, adaugă un textbox
                                TextBox txtColumnValue = new TextBox();
                                txtColumnValue.Name = columnName;
                                txtColumnValue.Width = 100;
                                flowLayoutPanel1.Controls.Add(txtColumnValue);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                this.DialogResult = DialogResult.Cancel;
                this.Close();
            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }

        private void buttonCreate_Click(object sender, EventArgs e)
        {
            try
            {
                string insertQuery = "INSERT INTO " + tableName + " (";
                string valuesQuery = " VALUES (";
                foreach (Control control in flowLayoutPanel1.Controls)
                {
                    if (control is TextBox)
                    {
                        TextBox textBox = (TextBox)control;
                        insertQuery += textBox.Name + ",";
                        valuesQuery += "@" + textBox.Name + ",";
                    }
                }
                insertQuery = insertQuery.TrimEnd(',') + ")";
                valuesQuery = valuesQuery.TrimEnd(',') + ")";

                string query = insertQuery + valuesQuery;
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    foreach (Control control in flowLayoutPanel1.Controls)
                    {
                        if (control is TextBox)
                        {
                            TextBox textBox = (TextBox)control;
                            command.Parameters.AddWithValue("@" + textBox.Name, textBox.Text);
                        }
                    }
                    command.ExecuteNonQuery();
                }
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}

