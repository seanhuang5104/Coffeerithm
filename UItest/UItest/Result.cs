using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuestionUI
{
    public partial class Result : Form
    {
        public Result(List<String> item,String path)
        {
            InitializeComponent();
            bean_name.Text = item[0];
            bean_remark.Text = item[1];
            brew_type.Text = item[2];
            brew_remark.Text = item[3];
            //pictureBox1.Image = Image.FromFile(path + "\\"+item[4] + ".jpg");
            mood_modifier.Text = item[5];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }
    }
}
