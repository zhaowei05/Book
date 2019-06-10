using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo
{
    public partial class Myrespson : Demo.Longin
    {
        //public partial class Myrespson : System.Web.UI.Page
        //{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["web"].Equals("BookCart"))
            {
                if (Request["kou"].Equals("list"))
                    BookCart_list();
                if (Request["kou"].Equals("Add"))
                    return;
                if (Request["kou"].Equals("Updatesz"))
                    BookCart_Updatesz();
                if (Request["kou"].Equals("Updatexz"))
                    BookCart_Updatexz();
                if (Request["kou"].Equals("Delete"))
                    BookCart_Delete();
                if (Request["kou"].Equals("Updatss"))
                    BookCart_Updatss();
            }

            if (Request["web"].Equals("BookSearch"))
            {
                if (Request["kou"].Equals("Search"))
                {
                    BookSearch_Search();
                }
                if (Request["kou"].Equals("binzije"))
                {
                    BookSearch_binzije();
                }
                if (Request["kou"].Equals("babaid"))
                {
                    BookSearch_babaid();
                }
                if (Request["kou"].Equals("delete"))
                {
                    BookSearch_delete();
                }
            }

            if (Request["web"].Equals("OrderList"))
            {
                if (Request["kou"].Equals("listOr"))
                    OrderList_listOr();
                if (Request["kou"].Equals("Delete"))
                    OrderList_Delete();
            }
        }

        
        #region 用户的删除（修改OrderStatus为5）
        private void OrderList_Delete()
        {
            MyOrderBLL orderBLL = new MyOrderBLL();
            MyOrderEntity orderEntity = orderBLL.list(int.Parse(Request["OrderId"]));
            orderEntity.OrderStatus = 5;
            Response.Write(orderBLL.Update(orderEntity));
            Response.End();
        }
        #endregion

        #region 数据的请求（分页）
        private void OrderList_listOr()
        {
            MemberEntity memberEntity = (MemberEntity)Session["usr"];
            OrderDetailBLL orderDetail = new OrderDetailBLL();
            int count = 0;
            //List<OrderDetailEntity> listor = orderDetail.list(memberEntity.MemberId, 1, 4, out count);
            List<OrderDetailEntity> listor = orderDetail.list(memberEntity.MemberId, int.Parse(Request["Pageint"]), int.Parse(Request["Pagesize"]), out count);
            string str = count + "(fan_ker)" + MyJson.ToJsJson(listor);
            Response.Write(str);
            Response.End();
        }
        #endregion

        #region 查询父亲的id
        private void BookSearch_babaid()
        {
            int typid = int.Parse(Request["TypeId"]);
            BookTypeBLL typeBLL = new BookTypeBLL();
            BookTypeEntity typeEntity = typeBLL.lists(typid);
            if (typeEntity == null)
                Response.Write(0);
            else
                Response.Write(MyJson.ToJsJson(typeEntity));

            Response.End();
        }
        #endregion

        #region 查询书分级列表
        private void BookSearch_binzije()
        {
            int typid = int.Parse(Request["TypeId"]);
            BookTypeBLL typeBLL = new BookTypeBLL();
            BookTypeEntity typeEntity = typeBLL.lists(typid);
            if (typeEntity == null)
                Response.Write(MyJson.ToJsJson(typeBLL.list(0)));
            else
            {
                if (typeEntity.ParentId == 0)
                {
                    Response.Write(MyJson.ToJsJson(typeBLL.list(typeEntity.TypeId)));
                }
                else
                {
                    Response.Write(MyJson.ToJsJson(typeBLL.list(typeEntity.ParentId)));
                }
            }

            Response.End();
        }
        #endregion

        #region book删除
        private void BookSearch_delete()
        {
            BookInfoBLL bookInfo = new BookInfoBLL();
            Response.Write(bookInfo.Delete(int.Parse(Request["BookId"])));
            Response.End();
        }

        #endregion

        #region book搜索
        private void BookSearch_Search()
        {

            BookInfoEntity infoEntity = new BookInfoEntity();
            if (!string.IsNullOrWhiteSpace(Request["TypeId"]))
            {
                BookTypeBLL typeBLL = new BookTypeBLL();
                BookTypeEntity typeEntity = typeBLL.lists(int.Parse(Request["TypeId"]));
                if (typeEntity == null)
                    infoEntity.TypeId = 0;
                else if (typeEntity.ParentId != 0)
                   infoEntity.TypeId = int.Parse(Request["TypeId"]);
            }
            if (!string.IsNullOrWhiteSpace(Request["ParentId"]))
            {
                infoEntity.SellCount = int.Parse(Request["ParentId"]);
            }
            if (!string.IsNullOrWhiteSpace(Request["BookName"]))
                infoEntity.BookName = Request["BookName"];
            BookInfoBLL infoBLL = new BookInfoBLL();
            int count = 0;
            List<BookInfoEntity> infolist = infoBLL.list(infoEntity, int.Parse(Request["Pageint"]), int.Parse(Request["Pagesize"]), out count);
            Response.Write(count + "_" + MyJson.ToJsJson(infolist));
            Response.End();
        }


        #endregion

        #region 购物车列表
        private void BookCart_list()
        {
            BookCartBLL bLL = new BookCartBLL();
            List<BookCartEntity> list = bLL.list(((MemberEntity)Session["usr"]).MemberId);
            Response.Write(MyJson.ToJsJson(list));
            Response.End();
        }
        #endregion

        #region 购物车删除
        private void BookCart_Delete()
        {
            BookCartBLL bLL = new BookCartBLL();
            bLL.Delete(int.Parse(Request["CartId"]));
            BookCart_list();
        }
        #endregion

        #region 购物车商品数量修改
        private void BookCart_Updatesz()
        {
            BookCartBLL bLL = new BookCartBLL();
            BookCartEntity entity = bLL.lists(int.Parse(Request["CartId"]));
            entity.BookCount = int.Parse(Request["BookCount"]);
            bLL.Update(entity);
            BookCart_list();
        }
        #endregion

        #region 购物车商品是否选择
        private void BookCart_Updatexz()
        {
            BookCartBLL bLL = new BookCartBLL();
            BookCartEntity entity = bLL.lists(int.Parse(Request["CartId"]));
            entity.IsSelect = entity.IsSelect == 0 ? 1 : 0;
            bLL.Update(entity);
            BookCart_list();
        }
        #endregion

        #region 购物车商品批量选择
        private void BookCart_Updatss()
        {
            BookCartBLL cartBLL = new BookCartBLL();
            MemberEntity member = (MemberEntity)Session["usr"];
            List<BookCartEntity> cartEntity = cartBLL.list(member.MemberId);
            var icv = from ic in cartEntity where ic.IsSelect == 0 select ic;
            if (Request["qxz"].ToLower().Equals("true"))
            {
                foreach (var item in icv)
                {
                    BookCartEntity entity = cartBLL.lists(item.CartId);
                    entity.IsSelect = entity.IsSelect == 0 ? 1 : 0;
                    cartBLL.Update(entity);
                }
            }
            else
            {
                if (icv.Count() == 0)
                    foreach (BookCartEntity item in cartEntity)
                    {
                        BookCartEntity entity = cartBLL.lists(item.CartId);
                        entity.IsSelect = entity.IsSelect == 0 ? 1 : 0;
                        cartBLL.Update(entity);
                    }
            }
            BookCart_list();
        }
        #endregion

    }
}