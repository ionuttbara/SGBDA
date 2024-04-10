namespace CarDealershipDatabase
{
    partial class DeleteDataForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.removeBtn = new System.Windows.Forms.Button();
            this.dataView = new System.Windows.Forms.DataGridView();
            this.textInfo = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataView)).BeginInit();
            this.SuspendLayout();
            // 
            // removeBtn
            // 
            this.removeBtn.Location = new System.Drawing.Point(677, 332);
            this.removeBtn.Name = "removeBtn";
            this.removeBtn.Size = new System.Drawing.Size(75, 23);
            this.removeBtn.TabIndex = 1;
            this.removeBtn.Text = "Remove";
            this.removeBtn.UseVisualStyleBackColor = true;
            this.removeBtn.Click += new System.EventHandler(this.button1_Click);
            // 
            // dataView
            // 
            this.dataView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataView.Location = new System.Drawing.Point(22, 51);
            this.dataView.Name = "dataView";
            this.dataView.Size = new System.Drawing.Size(730, 263);
            this.dataView.TabIndex = 2;
            // 
            // textInfo
            // 
            this.textInfo.AutoSize = true;
            this.textInfo.Location = new System.Drawing.Point(22, 13);
            this.textInfo.Name = "textInfo";
            this.textInfo.Size = new System.Drawing.Size(168, 13);
            this.textInfo.TabIndex = 3;
            this.textInfo.Text = "Select a row to remove from table:";
            // 
            // DeleteDataForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(764, 364);
            this.Controls.Add(this.textInfo);
            this.Controls.Add(this.dataView);
            this.Controls.Add(this.removeBtn);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "DeleteDataForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "DeleteDataForm";
            ((System.ComponentModel.ISupportInitialize)(this.dataView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button removeBtn;
        private System.Windows.Forms.DataGridView dataView;
        private System.Windows.Forms.Label textInfo;
    }
}