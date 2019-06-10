using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using System.Data;

namespace ZwDAL
{
    public class MemberDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<MemberEntity> list()
        {
            List<MemberEntity> list = new List<MemberEntity>();
            string sql = "select * from Member";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MemberEntity entity = new MemberEntity();
                entity.MemberId = int.Parse(item["MemberId"].ToString());
                entity.MemberAcc = item["MemberAcc"].ToString();
                entity.MemberPwd = item["MemberPwd"].ToString();
                entity.MemberCode = item["MemberCode"].ToString();
                entity.MemberName = item["MemberName"].ToString();
                entity.MemberPhone = item["MemberPhone"].ToString();
                entity.MemberAddress = item["MemberAddress"].ToString();
                entity.MemberMail = item["MemberMail"].ToString();
                entity.MemberAddTime = DateTime.Parse(item["MemberAddTime"].ToString());
                list.Add(entity);
            }
            return list;
        }

        public int list(string str)
        {
            String sql = "select count(*) from Member where MemberAcc='"+ str + "'";
            db.PrepareSql(sql);
            return int.Parse(db.ExecScalar().ToString());
        }

        public List<MemberEntity> list(MemberEntity myentity, int Pageint, int Pagesize, out int Count)
        {
            string sqlwhere = "";
            if (myentity != null)
            {
                if (myentity.MemberName != null && !myentity.MemberName.Equals(""))
                    sqlwhere += " and MemberAcc like'%" + myentity.MemberName + "%'";
            }
            string sql = "select count(*) from Member where 1=1 " + sqlwhere;
            db.PrepareSql(sql);
            Count = int.Parse(db.ExecScalar().ToString());
            List<MemberEntity> list = new List<MemberEntity>();
            sql = @"select *from(
select ROW_NUMBER()over(order by MemberId) rowid,*from Member where 1=1 " + sqlwhere + ") Tamp where rowid between @satr and @end";
            db.PrepareSql(sql);
            db.SetParameter("satr", (Pageint - 1) * Pagesize + 1);
            db.SetParameter("end", Pageint * Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MemberEntity entity = new MemberEntity();
                entity.MemberId = int.Parse(item["MemberId"].ToString());
                entity.MemberAcc = item["MemberAcc"].ToString();
                entity.MemberPwd = item["MemberPwd"].ToString();
                entity.MemberCode = item["MemberCode"].ToString();
                entity.MemberName = item["MemberName"].ToString();
                entity.MemberPhone = item["MemberPhone"].ToString();
                entity.MemberAddress = item["MemberAddress"].ToString();
                entity.MemberMail = item["MemberMail"].ToString();
                entity.MemberAddTime = DateTime.Parse(item["MemberAddTime"].ToString());
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 详情
        public MemberEntity list(int id)
        {
            string sql = "select * from Member where MemberId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            MemberEntity entity = new MemberEntity();
            entity.MemberId = int.Parse(dt.Rows[0]["MemberId"].ToString());
            entity.MemberAcc = dt.Rows[0]["MemberAcc"].ToString();
            entity.MemberPwd = dt.Rows[0]["MemberPwd"].ToString();
            entity.MemberCode = dt.Rows[0]["MemberCode"].ToString();
            entity.MemberName = dt.Rows[0]["MemberName"].ToString();
            entity.MemberPhone = dt.Rows[0]["MemberPhone"].ToString();
            entity.MemberAddress = dt.Rows[0]["MemberAddress"].ToString();
            entity.MemberMail = dt.Rows[0]["MemberMail"].ToString();
            entity.MemberAddTime = DateTime.Parse(dt.Rows[0]["MemberAddTime"].ToString());
            return entity;
        }
        #endregion

        #region 登录
        public MemberEntity Delu(MemberEntity Userentity)
        {
            string sql = "select * from Member where MemberAcc=@MemberAcc and MemberPwd=@MemberPwd";
            db.PrepareSql(sql);
            db.SetParameter("MemberAcc", Userentity.MemberAcc);
            db.SetParameter("MemberPwd", Userentity.MemberPwd);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count != 1)
            {
                return null;
            }
            else
            {
                MemberEntity entity = new MemberEntity();
                entity.MemberId = int.Parse(dt.Rows[0]["MemberId"].ToString());
                entity.MemberAcc = dt.Rows[0]["MemberAcc"].ToString();
                entity.MemberPwd = dt.Rows[0]["MemberPwd"].ToString();
                entity.MemberCode = dt.Rows[0]["MemberCode"].ToString();
                entity.MemberName = dt.Rows[0]["MemberName"].ToString();
                entity.MemberPhone = dt.Rows[0]["MemberPhone"].ToString();
                entity.MemberAddress = dt.Rows[0]["MemberAddress"].ToString();
                entity.MemberMail = dt.Rows[0]["MemberMail"].ToString();
                entity.MemberAddTime = DateTime.Parse(dt.Rows[0]["MemberAddTime"].ToString());
                return entity;
            }
        }
        #endregion

        #region 添加
        public int Add(MemberEntity entity)
        {
            string sql = @"insert into Member(MemberAcc,MemberPwd,MemberCode,MemberName,MemberPhone,MemberAddress,MemberMail,MemberAddTime) values(@MemberAcc,@MemberPwd,@MemberCode,@MemberName,@MemberPhone,@MemberAddress,@MemberMail,GETDATE())";
            db.PrepareSql(sql);
            db.SetParameter("MemberAcc", entity.MemberAcc);
            db.SetParameter("MemberPwd", entity.MemberPwd);
            db.SetParameter("MemberCode", entity.MemberCode);
            db.SetParameter("MemberName", entity.MemberName);
            db.SetParameter("MemberPhone", entity.MemberPhone);
            db.SetParameter("MemberAddress", entity.MemberAddress);
            db.SetParameter("MemberMail", entity.MemberMail);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from Member  where MemberId=" + id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(MemberEntity entity)
        {
            string sql = "Update Member set MemberPwd=@MemberPwd,MemberCode=@MemberCode,MemberName=@MemberName,MemberPhone=@MemberPhone,MemberAddress=@MemberAddress,MemberMail=@MemberMail where MemberId=@MemberId";
            db.PrepareSql(sql);
            db.SetParameter("MemberPwd", entity.MemberPwd);
            db.SetParameter("MemberCode", entity.MemberCode);
            db.SetParameter("MemberName", entity.MemberName);
            db.SetParameter("MemberPhone", entity.MemberPhone);
            db.SetParameter("MemberAddress", entity.MemberAddress);
            db.SetParameter("MemberMail", entity.MemberMail);
            db.SetParameter("MemberId", entity.MemberId);
            return db.ExecNonQuery();
        }
        #endregion
    }
}
