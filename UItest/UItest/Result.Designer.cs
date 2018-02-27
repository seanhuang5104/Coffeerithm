namespace QuestionUI
{
    partial class Result
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
            this.bean_name = new System.Windows.Forms.Label();
            this.bean_remark = new System.Windows.Forms.Label();
            this.brew_type = new System.Windows.Forms.Label();
            this.brew_remark = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // bean_name
            // 
            this.bean_name.AutoSize = true;
            this.bean_name.Font = new System.Drawing.Font("Consolas", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bean_name.Location = new System.Drawing.Point(447, 78);
            this.bean_name.Name = "bean_name";
            this.bean_name.Size = new System.Drawing.Size(100, 22);
            this.bean_name.TabIndex = 0;
            this.bean_name.Text = "bean_name";
            // 
            // bean_remark
            // 
            this.bean_remark.AutoSize = true;
            this.bean_remark.Font = new System.Drawing.Font("Consolas", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bean_remark.Location = new System.Drawing.Point(447, 128);
            this.bean_remark.Name = "bean_remark";
            this.bean_remark.Size = new System.Drawing.Size(120, 22);
            this.bean_remark.TabIndex = 0;
            this.bean_remark.Text = "bean_remark";
            // 
            // brew_type
            // 
            this.brew_type.AutoSize = true;
            this.brew_type.Font = new System.Drawing.Font("Consolas", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.brew_type.Location = new System.Drawing.Point(447, 212);
            this.brew_type.Name = "brew_type";
            this.brew_type.Size = new System.Drawing.Size(100, 22);
            this.brew_type.TabIndex = 0;
            this.brew_type.Text = "brew_type";
            // 
            // brew_remark
            // 
            this.brew_remark.AutoSize = true;
            this.brew_remark.Font = new System.Drawing.Font("Consolas", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.brew_remark.Location = new System.Drawing.Point(447, 261);
            this.brew_remark.Name = "brew_remark";
            this.brew_remark.Size = new System.Drawing.Size(120, 22);
            this.brew_remark.TabIndex = 0;
            this.brew_remark.Text = "brew_remark";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(-2, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(443, 771);
            this.pictureBox1.TabIndex = 1;
            this.pictureBox1.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Consolas", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(451, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(377, 37);
            this.label1.TabIndex = 2;
            this.label1.Text = "May we present you :";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(838, 707);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(174, 49);
            this.button1.TabIndex = 3;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Result
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1024, 768);
            this.ControlBox = false;
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.brew_remark);
            this.Controls.Add(this.brew_type);
            this.Controls.Add(this.bean_remark);
            this.Controls.Add(this.bean_name);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Result";
            this.Text = "Result";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label bean_name;
        private System.Windows.Forms.Label bean_remark;
        private System.Windows.Forms.Label brew_type;
        private System.Windows.Forms.Label brew_remark;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
    }
}