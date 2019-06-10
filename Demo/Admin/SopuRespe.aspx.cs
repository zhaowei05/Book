using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin
{
    public partial class SopuRespe : Login
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //"Booktype的方法
            if (Request["web"].Equals("Book"))
            {
                if (Request["kou"].Equals("delete"))
                {
                    Book_delete();
                }
                if (Request["kou"].Equals("Add"))
                {
                    Book_Add();
                }
                if (Request["kou"].Equals("update"))
                {
                    Book_update();
                }
            }

            if (Request["web"].Equals("Member"))
            {
                if (Request["kou"].Equals("list"))
                {
                    Member_list();
                }
                if (Request["kou"].Equals("delete"))
                {
                    Member_delete();
                }
            }

            if (Request["web"].Equals("Order"))
            {
                if (Request["kou"].Equals("list"))
                {
                    Order_list();
                }
                if (Request["kou"].Equals("delete"))
                {
                    Order_delete();
                }
                if (Request["kou"].Equals("update"))
                {
                    Order_update();
                }
            }

            if (Request["web"].Equals("User"))
            {
                if (Request["kou"].Equals("list"))
                {
                    User_list();
                }
                if (Request["kou"].Equals("aoccount"))
                {
                    User_aoccount();
                }
                if (Request["kou"].Equals("delete"))
                {
                    User_delete();
                }
            }
        }

        private void User_delete()
        {
            MyUserBLL myUserBLL = new MyUserBLL();
            int id = int.Parse(Request["UserId"]);
            Response.Write(myUserBLL.Delete(id));
            Response.End();
        }

        private void User_aoccount()
        {
            MyUserBLL myUserBLL = new MyUserBLL();
            string acoot = Request["UserAccount"];
            Response.Write(myUserBLL.list(acoot));
            Response.End();        }

        private void User_list()
        {
            MyUserBLL myUserBLL = new MyUserBLL();
            MyUserEntity userEntity = new MyUserEntity();
            userEntity.UserAccount = Request["UserAccount"];
            userEntity.UserRealName= Request["UserRealName"];
            int count = 0;
            List<MyUserEntity> list = myUserBLL.list(userEntity, int.Parse(Request["PageInt"]), int.Parse(Request["PageSize"]),out count);
            Response.Write(count+"||"+MyJson.ToJsJson(list));
            Response.End();
        }

        private void Order_update()
        {
            int id = Convert.ToInt32(Request["OrderId"]);
            ZwBLL.MyOrderBLL myOrder = new MyOrderBLL();
            ZwEntity.MyOrderEntity entitymyOrder = myOrder.list(id);
            if (entitymyOrder.OrderStatus<4)
                entitymyOrder.OrderStatus = entitymyOrder.OrderStatus + 1;
            Response.Write(myOrder.Update(entitymyOrder));
            Response.End();
        }

        private void Order_delete()
        {
            int id = Convert.ToInt32(Request["OrderId"]);
            ZwBLL.MyOrderBLL myOrder = new MyOrderBLL();
            Response.Write( myOrder.Delete(id));
            Response.End();
        }

        private void Order_list()
        {
            MyOrderBLL orderBLL = new MyOrderBLL();
            string date = "";
            if (!string.IsNullOrWhiteSpace(Request["startdate"])|| !string.IsNullOrWhiteSpace(Request["enddate"]))
                date = Request["startdate"] + "," + Request["enddate"];
            MyOrderEntity orderEntity = new MyOrderEntity();
            int count = 0;
            orderEntity.OrderStatus = Convert.ToInt32(Request["OrderStatus"]);
            List<MyOrderEntity> list=orderBLL.list(date, orderEntity,int.Parse(Request["PageInt"]),int.Parse(Request["Pagesize"]),out count);
            Response.Write(count+"||"+MyJson.ToJsJson(list));
            Response.End();
        }

        private void Member_delete()
        {
            MemberBLL member = new MemberBLL();
            Response.Write( member.Delete(int.Parse(Request["MemberId"])));
            Response.End();
        }

        private void Member_list()
        {
            MemberBLL member = new MemberBLL();
            MemberEntity entity = new MemberEntity();
            entity.MemberName = Request["MemberName"];
            int count = 0;
            List<MemberEntity> list = member.list(entity, int.Parse(Request["PageInt"]), int.Parse(Request["PageSize"]), out count);
            Response.Write(count+"||"+MyJson.ToJsJson(list));
            Response.End();
        }

        private void Book_update()
        {
            BookTypeBLL typeBLL = new BookTypeBLL();
            BookTypeEntity typeEntity = new BookTypeEntity();
            typeEntity = typeBLL.lists(int.Parse(Request["TypeId"]));
            typeEntity.ParentId= int.Parse(Request["ParentId"]);
            typeEntity.TypeName = Request["TypeName"];
            Response.Write(typeBLL.Update(typeEntity));
            Response.End();
        }

        private void Book_Add()
        {
            BookTypeBLL typeBLL = new BookTypeBLL();
            BookTypeEntity typeEntity = new BookTypeEntity();
            typeEntity.ParentId= int.Parse(Request["ParentId"]);
            typeEntity.TypeName = Request["TypeName"];
            Response.Write(typeBLL.Add(typeEntity));
            Response.End();
        }

        private void Book_delete()
        {
            BookTypeBLL typeBLL = new BookTypeBLL();
            Response.Write(typeBLL.Delete(int.Parse(Request["TypeId"])));
            Response.End();
        }
    }
}