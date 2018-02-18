using System;
using System.Collections.Generic;
//using System.ComponentModel;
//using System.Data;
using System.Drawing;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

using System.IO;
using System.Reflection;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.Drawing.Text;

namespace QuestionUI
{
    /// <summary>
    /// The class will store selected item from input parameter list in its "Tag" attribute.
    /// Check the selection result when "Dialogueresult.OK" returnen.
    /// </summary>
    public partial class UI : Form
    {
        /// <summary>
        ///STRING list of options will also serves as a ".jpg" file to be displayed on screen,each option should has two pics.
        /// EX: list contains "Apple","Orange", then the program will display "Apple.jpg" and "Orange.jpg" as options.
        /// 
        /// There are two pics for each option,<fileName>.jpg and C<fileName>.jpg---C<fileName>.jpg stands for the clear version of option picture.
        /// EX: list contains "Apple", then program will look for Apple.jpg and CApple.jpg for the option,CApple.jpg will be shown when mouse hover on the option. 
        /// </summary>
        private List<String> InternalItems;

        //Path to find the pictures
        private String PicPath = "",Question="";
        TransparentLabel lblTrans = new TransparentLabel();
        //store option images
        private List<Image> ImageLibrary = new List<Image>();
        private List<Image> BlurImageLibrary = new List<Image>();
        /// <summary>
        /// This class will construct a question session that take in one question and a list of options.
        /// STRING list of options will also serves as an .jpg file to be displayed on screen,each option should has two pics.
        /// EX: list contains "Apple","Orange", then the program will display "Apple.jpg" and "Orange.jpg" as options.
        /// 
        /// There are two pics for each option,<fileName>.jpg and C<fileName>.jpg---C<fileName>.jpg stands for the clear version of option picture.
        /// EX: list contains "Apple", then program will look for Apple.jpg and CApple.jpg for the option,CApple.jpg will be shown when mouse hover on the option.
        /// 
        /// </summary>
        /// <param name="Items">This list contains filename of each selection.</param>
        /// <param name="question">The question display on screen.</param>
        public UI(List<String> Items,string question , string picpath)
        {
            InternalItems = Items;
            PicPath = picpath;
            Question = question;
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;

            MakeButtons(Items.Count);
           
            lblTrans.Height = 50;
        
            lblTrans.Width = 2000;
            lblTrans.Top = 50;
            lblTrans.Left = 50;
            lblTrans.Text = question;
            lblTrans.Font = new Font("Consolas", 30);
            this.Controls.Add(lblTrans);
            lblTrans.Visible = true;
            lblTrans.BringToFront();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            Thread t = new Thread(() => 
            {
                Form test = new Form();
                test.Size = this.Size;
                test.BackColor = Color.Wheat;
                test.FormBorderStyle = FormBorderStyle.None;
                test.WindowState = FormWindowState.Maximized;

                test.Opacity = 0;
                //test.TopMost = true;
                test.Show();
                for (int i = 0; i < 50; i++)
                 {
                     test.Opacity += 0.02;
                     Thread.Sleep(7);
                 }
                Thread.Sleep(300);
                for (int i = 0; i < 50; i++)
                {
                    test.Opacity -= 0.02;
                    Thread.Sleep(7);
                }
                test.Dispose();
            });
            t.Start();
            Thread.Sleep(650);
            Button SelectedBtn = (Button)sender;
            this.Tag = "\"" + Question + "\" " + InternalItems[Convert.ToInt16(SelectedBtn.Tag)];
            this.DialogResult = DialogResult.OK;      
        }

        private void MakeButtons(int BtnCount)
        {
            int ButtonWidth = this.Size.Width / BtnCount;
            for (int i = 0; i < BtnCount; i++)
            {
                //add image to library ,using index in tag to trace.
                
                //ImageLibrary.Add(Image.FromFile(PicPath + InternalItems[i] + ".jpg"));
                ImageLibrary.Add(Imager.PerformImageResizeAndPutOnCanvas(PicPath +"C"+ InternalItems[i] + ".jpg", ButtonWidth, 650));
                BlurImageLibrary.Add(Imager.PerformImageResizeAndPutOnCanvas(PicPath + InternalItems[i] + ".jpg", ButtonWidth, 650));
                Button Right = new Button();
                //Right.Tag = InternalItems[i];
                Right.Tag = i.ToString();
                //Right.Image = Image.FromFile(PicPath + Right.Tag + ".jpg");
                Right.Image = BlurImageLibrary[i];
                Right.Margin = new Padding(0,0,0,0);
                Right.Location = new Point(ButtonWidth * i, 0);
                Right.Size = new Size(ButtonWidth, this.Size.Height);
                Right.MouseClick += button1_Click;
                Right.MouseHover += button1_MouseHover;
                Right.MouseLeave += button1_MouseLeave;
                Right.TabStop = false;
                Right.FlatStyle = FlatStyle.Flat;
                Right.FlatAppearance.BorderSize = 0;
                Right.BackColor = Color.Transparent;
                Right.FlatAppearance.MouseDownBackColor = Color.Transparent;

                Right.FlatAppearance.MouseOverBackColor = Color.Transparent;
                this.Controls.Add(Right);
                
            }
        }
       
        private void button1_MouseHover(object sender, EventArgs e)
        {
            Button me = (Button)sender;
            me.Image = ImageLibrary[Convert.ToInt16(me.Tag)];
            lblTrans.Refresh();
        }

        private void button1_MouseLeave(object sender, EventArgs e)
        {
            Button me = (Button)sender;
            me.Image = BlurImageLibrary[Convert.ToInt16(me.Tag)];
            lblTrans.Refresh();
        }
    }

    public static class Imager
    {
        /// <summary>  
        /// the image remains the same size, and it is placed in the middle of the new canvas  
        /// </summary>  
        /// <param name="image">image to put on canvas</param>  
        /// <param name="width">canvas width</param>  
        /// <param name="height">canvas height</param>  
        /// <param name="canvasColor">canvas color</param>  
        /// <returns></returns>  
        public static Image PutOnCanvas(Image image, int width, int height)
        {
            var res = new Bitmap(width, height);
            using (var g = Graphics.FromImage(res))
            {
                g.Clear(Color.White);
                var x = (width - image.Width) / 2;
                var y = (height - image.Height) / 2;
                g.DrawImageUnscaled(image, x, y, image.Width, image.Height);
            }

            return res;
        }

        /// <summary>  
        /// resize an image and maintain aspect ratio  
        /// </summary>  
        /// <param name="image">image to resize</param>  
        /// <param name="newWidth">desired width</param>  
        /// <param name="maxHeight">max height</param>  
        /// <param name="onlyResizeIfWider">if image width is smaller than newWidth use image width</param>  
        /// <returns>resized image</returns>  
        public static Image Resize(Image image, int newWidth, int maxHeight, bool onlyResizeIfWider)
        {
            if (onlyResizeIfWider && image.Width <= newWidth) newWidth = image.Width;

            var newHeight = image.Height * newWidth / image.Width;
            if (newHeight > maxHeight)
            {
                // Resize with height instead  
                newWidth = image.Width * maxHeight / image.Height;
                newHeight = maxHeight;
            }

            var res = new Bitmap(newWidth, newHeight);

            using (var graphic = Graphics.FromImage(res))
            {
                graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphic.SmoothingMode = SmoothingMode.HighQuality;
                graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                graphic.CompositingQuality = CompositingQuality.HighQuality;
                graphic.DrawImage(image, 0, 0, newWidth, newHeight);
            }

            return res;
        }

        /// <summary>  
        /// Crop an image   
        /// </summary>  
        /// <param name="img">image to crop</param>  
        /// <param name="cropArea">rectangle to crop</param>  
        /// <returns>resulting image</returns>  
        public static Image Crop(Image img, Rectangle cropArea)
        {
            var bmpImage = new Bitmap(img);
            var bmpCrop = bmpImage.Clone(cropArea, bmpImage.PixelFormat);
            return bmpCrop;
        }


        public static Image PerformImageResizeAndPutOnCanvas(string pFileNameWpath, int pWidth, int pHeight)
        {
            if (!File.Exists(pFileNameWpath))
            {
                Assembly myAssembly = Assembly.GetExecutingAssembly();
                Stream myStream = myAssembly.GetManifestResourceStream("QuestionUI.Properties.NotFound.png");
                Bitmap bmp = new Bitmap(myStream);
                return bmp;
            }

            Image imgBef;
            imgBef = Image.FromFile(pFileNameWpath);
      

            Image _imgR;
            _imgR = Imager.Resize(imgBef, pWidth, pHeight, true);


            Image _img2;
            _img2 = Imager.PutOnCanvas(_imgR, pWidth, pHeight);

            return _img2;
        }
    }

    public class TransparentLabel : Control
    {
        public TransparentLabel()
        {
            TabStop = false;
        }

        protected override CreateParams CreateParams
        {
            get
            {
                CreateParams cp = base.CreateParams;
                cp.ExStyle |= 0x20;
                return cp;
            }
        }

        protected override void OnPaintBackground(PaintEventArgs e)
        {
            // do nothing
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            using (SolidBrush brush = new SolidBrush(ForeColor))
            {
                e.Graphics.DrawString(Text, Font, brush, -1, 0);
            }
        }
    }

}
