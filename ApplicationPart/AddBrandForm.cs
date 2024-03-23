using System;
using System.Windows.Forms;

namespace CarDealershipDatabase
{
    public partial class AddBrandForm : Form
    {
        public string BrandName { get; private set; }

        public AddBrandForm()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            // Se validează datele introduse (de exemplu, se verifică dacă toate câmpurile sunt completate)
            if (string.IsNullOrEmpty(textBoxBrandName.Text))
            {
                MessageBox.Show("Introduceți numele brandului.", "Eroare", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Se salvează numele brandului introdus în proprietatea BrandName
            BrandName = textBoxBrandName.Text;

            // Se închide formularul cu rezultatul OK
            DialogResult = DialogResult.OK;
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Se închide formularul fără a salva nimic
            DialogResult = DialogResult.Cancel;
            Close();
        }
    }
}
