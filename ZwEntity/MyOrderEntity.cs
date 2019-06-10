using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
    public class MyOrderEntity
    {
        public int OrderId { get; set; }//--主键编号
        public string OrderCode { get; set; }//--订单号(年月日时分秒+会员编号)
        public int MemberId { get; set; }//--会员编号
        public string OrderPeople { get; set; }//--收货人
        public string OrderPhone { get; set; }//--收货电话
        public string OrderAddress { get; set; }//--收货地址
        public decimal OrderAllMoney { get; set; }//--订单总金额
        public int OrderStatus { get; set; }//--订单状态(1-新订单，2-发货中，3-等待收货，4-已收货，5-用户删除)
        public string OrderTime { get; set; }//--订单时间

        public MemberEntity Member { get; set; }//--会员

        //public List<OrderDetailEntity> listorde { get; set; }//订单详情
    }
}
