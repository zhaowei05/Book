using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin.Book
{
    public partial class BookEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindadta();
        }

        #region 绑定数据
        private void bindadta()
        {
            int id = 0;
            if (string.IsNullOrWhiteSpace(Request["BookId"]))
                return;
            id = int.Parse(Request["BookId"]);
            BookInfoBLL infoBLL = new BookInfoBLL();
            BookInfoEntity infoEntity = infoBLL.list(id);
            BookTypeBLL typeBLL = new BookTypeBLL();
            BookTypeEntity typeEntity = typeBLL.lists(infoEntity.TypeId);
            ViewState["TypeId"] = typeEntity.TypeId;
            ViewState["ParentId"] = typeEntity.ParentId;
            txtBookCode.Text= infoEntity.BookCode;
            txtBookName.Text = infoEntity.BookName;
            txtBookAuthor.Text = infoEntity.BookAuthor;
            txtBookPrice.Text = infoEntity.BookPrice.ToString("n");
            txtBookDisCount.Text = infoEntity.BookDisCount.ToString("n");
            txtBookPress.Text = infoEntity.BookPress;
            txtPressTime.Text = infoEntity.PressTime.ToString("yyyy-MM-dd");
            hdPicPath.Value = infoEntity.PicPath;
            txtBookRemark.Text= infoEntity.BookRemark;
        }
        #endregion

        #region 修改
        protected void btAdd_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (string.IsNullOrWhiteSpace(Request["BookId"]))
                return;
            id = int.Parse(Request["BookId"]);
            BookInfoBLL infoBLL = new BookInfoBLL();
            BookInfoEntity infoEntity = infoBLL.list(id);
            infoEntity.TypeId = int.Parse(hdTwoType.Value);
            infoEntity.BookCode = txtBookCode.Text;
            infoEntity.BookName = txtBookName.Text;
            infoEntity.BookPrice = decimal.Parse(txtBookPrice.Text);
            infoEntity.BookDisCount = decimal.Parse(txtBookDisCount.Text);
            infoEntity.BookAuthor = txtBookAuthor.Text;
            infoEntity.BookPress = txtBookPress.Text;
            infoEntity.PressTime = DateTime.Parse(txtPressTime.Text);
            infoEntity.PicPath = hdPicPath.Value;
            infoEntity.BookRemark = txtBookRemark.Text;
            if (infoBLL.Update(infoEntity) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('保存成功！');window.location.href='BookList.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误！');</script>");
            }
        }
        #endregion

        #region 文件上传
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
                    if (type.Contains("image") || type.Contains("gif") || type.Contains("jpeg") || type.Contains("jpg") || type.Contains("png"))
                    {
                        hdPicPath.Value = "";
                        string fileExtension = "." + myFile.FileName.Split('.')[myFile.FileName.Split('.').Length - 1];
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
            catch (Exception error)
            {
                Response.Write(error.ToString());
            }

        }
        private static string filename()
        {
            string str = "";
            Random ra = new Random();
            DateTime time = new DateTime();
            str += DateTime.Now.ToString("yyyyMMddhhmmss");
            str += ra.Next(1, 9);
            str += ra.Next(1, 9);
            str += ra.Next(1, 9);
            return str;
        }
        #endregion

       
    }
}