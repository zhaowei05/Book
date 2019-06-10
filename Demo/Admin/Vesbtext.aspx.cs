using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin
{
    public partial class Vesbtext : System.Web.UI.Page
    {
        Random re = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            yztext();
        }
        private void yztext()
        {
            Bitmap bitmap = new Bitmap(90, 30);

            Graphics g = Graphics.FromImage(bitmap);
            g.Clear(Color.White);
            for (int i = 0; i < re.Next(20, 40); i++)
            {
                g.DrawLine(new Pen(Color.FromArgb(re.Next(0, 256), re.Next(0, 256), re.Next(0, 256)), re.Next(1, 2)), re.Next(0, 90), re.Next(0, 30), re.Next(0, 90), re.Next(0, 30));
            }


            for (int i = 0; i < re.Next(100, 150); i++)
            {
                bitmap.SetPixel(re.Next(90), re.Next(30), Color.FromArgb(re.Next(0, 256), re.Next(0, 256), re.Next(0, 256)));
            }

            string str = svsjr();
            Session["chek"] = str;
            g.DrawRectangle(new Pen(Color.Black), 1, 1, 88, 28);
            Brush bhs = new SolidBrush(Color.Black);
            g.DrawString(str, new Font("微软雅黑", 14), bhs, 15, 3);

            MemoryStream ms = new MemoryStream();
            bitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            Response.ContentType = "image/jpeg";
            Response.BinaryWrite(ms.ToArray());
        }
        private string svsjr()
        {
            string str = "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
            string binf = "";
            for (int i = 0; i < 4; i++)
            {
                binf += str[re.Next(0, str.Length)];
            }
            return binf;
        }
    }
}