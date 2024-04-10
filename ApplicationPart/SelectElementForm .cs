using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarDealershipDatabase
{
    public partial class SelectElementForm : Form
    {
        public int SelectedElementId { get; private set; }
        public SelectElementForm()
        {
            InitializeComponent();
        }

        private void buttonOK_Click(object sender, EventArgs e)
        {
        
        }
    }
}
