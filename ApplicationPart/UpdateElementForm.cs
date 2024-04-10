using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace CarDealershipDatabase
{
    public partial class UpdateElementForm : Form
    {

        public string InputValue { get; set; }
        public UpdateElementForm()
        {
            InitializeComponent();
        }

        private void buttonOK_Click_1(object sender, EventArgs e)
        {
            InputValue = textBoxInput.Text;
            DialogResult = DialogResult.OK;
            Close();
        }
    }
}
