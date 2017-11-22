using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
namespace moviesite
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RequestType.ToLower() == "post")
            {
                //MailMessage myMessage = new MailMessage();
                //myMessage.Subject = Request.Form["email"];
                //myMessage.Body = Request.Form["content"];
                //myMessage.From = new MailAddress("191329761@qq.com", Request.Form["name"]);
                //myMessage.To.Add(new MailAddress("awen1018@hotmail.com", "me"));

                //SmtpClient mySmtpClient = new SmtpClient();
                //mySmtpClient.Host = "smtp.qq.com";
                //mySmtpClient.Port = 465;
                //mySmtpClient.Credentials = new System.Net.NetworkCredential("191329761@qq.com", "vckumneczobxbgjf");
                ////指定 SmtpClient 使用安全套接字层(SSL)加密连接
                //mySmtpClient.EnableSsl = true;

                //try
                //{
                //    mySmtpClient.Send(myMessage);
                //}
                //catch (SmtpException ex)
                //{
                //    Response.Write(ex);
                //}
                try
                {
                    MailMessage message = new MailMessage();
                    message.From = new MailAddress("191329761@qq.com", "拉普达", Encoding.GetEncoding("utf-8"));//GB18030，发送邮箱/昵称
                    message.To.Add(new MailAddress("awen1018@hotmail.com", "awen", Encoding.GetEncoding("utf-8")));//GB18030，接收邮箱
                    message.Subject = Request.Form["email"]; ;
                    message.Body = Request.Form["content"];
                    SmtpClient sc = new SmtpClient();
                    sc.DeliveryMethod = SmtpDeliveryMethod.Network;
                    sc.EnableSsl = true;
                    sc.Port = 25;
                    sc.Host = "smtp.qq.com";    //smtp服务
                    sc.UseDefaultCredentials = false;
                    sc.Credentials = new System.Net.NetworkCredential("191329761@qq.com", "vckumneczobxbgjf");  //自己邮箱的帐密
                    sc.Send(message);
                    Response.Write("<script>alert('发送成功');</script>");
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}