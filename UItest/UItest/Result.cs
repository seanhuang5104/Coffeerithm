using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reflection;
using System.IO;

namespace QuestionUI
{
    public partial class Result : Form
    {
        public Result(List<String> item,String path)
        {
            InitializeComponent();
            button1.ForeColor = Color.FromArgb(225, 226, 210);
            button1.BackColor = Color.FromArgb(58,58,59);
            label2.BackColor = Color.FromArgb(58, 58, 59);
            label2.ForeColor = Color.FromArgb(225, 226, 210);
            bean_name.BackColor = Color.FromArgb(58, 58, 59);
            bean_name.ForeColor = Color.FromArgb(225, 226, 210);
            bean_remark.BackColor = Color.FromArgb(58, 58, 59);
            bean_remark.ForeColor = Color.FromArgb(225, 226, 210);
            brew_type.BackColor = Color.FromArgb(58, 58, 59);
            brew_type.ForeColor = Color.FromArgb(225, 226, 210);
            brew_remark.BackColor = Color.FromArgb(58, 58, 59);
            brew_remark.ForeColor = Color.FromArgb(225, 226, 210);
            mood_modifier.BackColor = Color.FromArgb(58, 58, 59);
            mood_modifier.ForeColor = Color.FromArgb(225, 226, 210);
            string beanName = item[0].ToUpper().Replace('-', ' ');
            int seperatorIndex = beanName.IndexOf('_');
            if (seperatorIndex != -1)
                bean_name.Text = beanName.Substring(beanName.IndexOf('_') + 1, beanName.Length - (beanName.IndexOf('_') + 1));
            else
                bean_name.Text = beanName;
            bean_remark.Text = item[1];
            string brewRemark = item[2].ToUpper().Replace('-', ' ');

            seperatorIndex = brewRemark.IndexOf('_');
            if (seperatorIndex != -1)
                brew_type.Text = brewRemark.Substring(brewRemark.IndexOf('_') + 1, brewRemark.Length - (brewRemark.IndexOf('_') + 1));
            else
                brew_type.Text = brewRemark;

            brew_remark.Text = item[3];
            if (!File.Exists(path + "\\" + item[4] + ".jpg"))
            {
                Assembly myAssembly = Assembly.GetExecutingAssembly();
                Stream myStream = myAssembly.GetManifestResourceStream("QuestionUI.Properties.NotFound.png");
                pictureBox1.Image = new Bitmap(myStream);
            }
            else
                pictureBox1.Image = Image.FromFile(path + "\\" + item[4] + ".jpg");
            mood_modifier.Text = item[5].Replace(".",System.Environment.NewLine);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }
    }
}
