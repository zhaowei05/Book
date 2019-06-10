using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
    public class MemberEntity
    {
        public int MemberId { get; set; }//--主键编号
        public string MemberAcc { get; set; }//--用户名
        public string MemberPwd { get; set; }//--密码
        public string MemberCode { get; set; }//--身份证
        public string MemberName { get; set; }//--真实姓名
        public string MemberPhone { get; set; }//--电话
        public string MemberAddress { get; set; }//--地址
        public string MemberMail { get; set; }//--邮箱
        public DateTime MemberAddTime { get; set; }//--会员注册时间

    }
}
