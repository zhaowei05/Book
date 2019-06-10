using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin.Book
{
    public partial class BookAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (myFile.FileName == "")
                {
                    spanUploadInfo.InnerHtml = "上传文件不能为空";
                    return;
                }
                if (this.myFile.HasFile)
                {
                    string type = this.myFile.PostedFile.ContentType.ToLower();
                    if (type.Contains("image")|| type.Contains("gif")|| type.Contains("jpeg")|| type.Contains("jpg")|| type.Contains("png"))
                    {
                        hdPicPath.Value = "";
                        string fileExtension = "."+myFile.FileName.Split('.')[myFile.FileName.Split('.').Length - 1];
                        string path = Server.MapPath("~/uploadfile/");
                        string name = filename() + fileExtension;
                        myFile.PostedFile.SaveAs(path + name);
                        spanUploadInfo.InnerHtml = "上传成功！";
                        hdPicPath.Value = name;
                    }
                    else
                    {
                        spanUploadInfo.InnerHtml = "文件格式错误！";
                    }

                }
            }
            catch(Exception error)
            {
                Response.Write(error.ToString());
            }
           
        }

        //private static bool isfile(FileUpload  file)
        //{
        //    System.IO.FileStream fs = new System.IO.FileStream(file.PostedFile.FileName, System.IO.FileMode.Open, System.IO.FileAccess.Read);
        //    BinaryReader r = new BinaryReader(fs);
        //    string fre = "";
        //    byte buffer;
        //    try
        //    {
        //        buffer = r.ReadByte();
        //        fre = buffer.ToString();
        //        buffer= r.ReadByte();
        //        fre+= buffer.ToString();
        //    }
        //    catch
        //    {

        //    }
        //    fs.Close();
        //    r.Close();
        //    if (fre == "255216" || fre == "7173" || fre == "6677" || fre == "13780")
        //        return true;
        //    else
        //        return false;
        //}

        private static string filename()
        {
            string str = "";
            Random ra = new Random();
            DateTime time = new DateTime();
            str +=DateTime.Now.ToString("yyyyMMddhhmmss");
            str += ra.Next(1, 9);
            str += ra.Next(1, 9);
            str += ra.Next(1, 9);
            return str;
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            BookInfoBLL infoBLL = new BookInfoBLL();
            BookInfoEntity infoEntity = new BookInfoEntity();
            infoEntity.TypeId = int.Parse(hdTwoType.Value);
            infoEntity.BookCode = txtBookCode.Text;
            infoEntity.BookName = txtBookName.Text;
            infoEntity.BookPrice = decimal.Parse(txtBookPrice.Text);
            infoEntity.BookDisCount = decimal.Parse(txtBookDisCount.Text);
            infoEntity.BookAuthor = txtBookAuthor.Text;
            infoEntity.BookPress = txtBookPress.Text;
            infoEntity.PressTime = DateTime.Parse(txtPressTime.Text);
            infoEntity.PicPath = hdPicPath.Value;
            infoEntity.SellCount = 0;
            infoEntity.BookRemark = txtBookRemark.Text;
            if (infoBLL.Add(infoEntity) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误！');</script>");
            }
        }
    }
}