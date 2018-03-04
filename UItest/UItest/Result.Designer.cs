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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Result));
            this.bean_name = new System.Windows.Forms.Label();
            this.brew_type = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.mood_modifier = new System.Windows.Forms.TextBox();
            this.brew_remark = new System.Windows.Forms.TextBox();
            this.bean_remark = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // bean_name
            // 
            this.bean_name.AutoSize = true;
            this.bean_name.Font = new System.Drawing.Font("Comic Sans MS", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bean_name.Location = new System.Drawing.Point(447, 176);
            this.bean_name.Name = "bean_name";
            this.bean_name.Size = new System.Drawing.Size(127, 30);
            this.bean_name.TabIndex = 0;
            this.bean_name.Text = "bean_name";
            // 
            // brew_type
            // 
            this.brew_type.AutoSize = true;
            this.brew_type.Font = new System.Drawing.Font("Comic Sans MS", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.brew_type.Location = new System.Drawing.Point(447, 306);
            this.brew_type.Name = "brew_type";
            this.brew_type.Size = new System.Drawing.Size(122, 30);
            this.brew_type.TabIndex = 0;
            this.brew_type.Text = "brew_type";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(129, 209);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(312, 501);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 1;
            this.pictureBox1.TabStop = false;
            // 
            // button1
            // 
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button1.Font = new System.Drawing.Font("Comic Sans MS", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(562, 661);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(309, 49);
            this.button1.TabIndex = 3;
            this.button1.Text = "Another cup?";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Comic Sans MS", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(447, 522);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(188, 30);
            this.label2.TabIndex = 4;
            this.label2.Text = "Tips for barasta:";
            // 
            // mood_modifier
            // 
            this.mood_modifier.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.mood_modifier.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.mood_modifier.Location = new System.Drawing.Point(446, 555);
            this.mood_modifier.Multiline = true;
            this.mood_modifier.Name = "mood_modifier";
            this.mood_modifier.Size = new System.Drawing.Size(442, 88);
            this.mood_modifier.TabIndex = 6;
            // 
            // brew_remark
            // 
            this.brew_remark.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.brew_remark.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.brew_remark.Location = new System.Drawing.Point(447, 339);
            this.brew_remark.Multiline = true;
            this.brew_remark.Name = "brew_remark";
            this.brew_remark.Size = new System.Drawing.Size(442, 145);
            this.brew_remark.TabIndex = 7;
            // 
            // bean_remark
            // 
            this.bean_remark.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.bean_remark.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bean_remark.Location = new System.Drawing.Point(447, 209);
            this.bean_remark.Multiline = true;
            this.bean_remark.Name = "bean_remark";
            this.bean_remark.Size = new System.Drawing.Size(442, 84);
            this.bean_remark.TabIndex = 8;
            // 
            // Result
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.RosyBrown;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(1024, 768);
            this.ControlBox = false;
            this.Controls.Add(this.bean_remark);
            this.Controls.Add(this.brew_remark);
            this.Controls.Add(this.mood_modifier);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.brew_type);
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
        private System.Windows.Forms.Label brew_type;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox mood_modifier;
        private System.Windows.Forms.TextBox brew_remark;
        private System.Windows.Forms.TextBox bean_remark;
    }
}