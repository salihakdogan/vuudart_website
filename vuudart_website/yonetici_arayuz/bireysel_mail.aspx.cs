using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class bireysel_mail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["uyemail"] != null)
            {
                string gelenuyemail = Request.QueryString["uyemail"];
                TextBox1.Text = gelenuyemail;
            }

            if (Request.QueryString["yoneticimail"] != null)
            {
                string gelenyoneticimail = Request.QueryString["yoneticimail"];
                TextBox1.Text = gelenyoneticimail;
            }

            if (Request.QueryString["gonderenmail"] != null)
            {
                string gonderenmail = Request.QueryString["gonderenmail"];
                TextBox1.Text = gonderenmail;
                Session["gonderenmail"] = gonderenmail;
            }

            if (Request.QueryString["konubaslik"] != null)
            {
                string konubaslik = Request.QueryString["konubaslik"];
                TextBox2.Text = "Gönderdiğiniz '" + konubaslik + "' başlıklı mail hakkında:";
            }

            if (Request.QueryString["mailid"] != null)
            {
                string mailkod = Request.QueryString["mailid"];
                Session["mailkod"] = mailkod;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string to = TextBox1.Text; //kime mail gidecek
            string from = "vuudart@vuudart.site"; //bizim mail adreisimiz

            MailMessage message = new MailMessage(from, to);

            string mailbody = TextBox3.Text;
            message.Subject = TextBox2.Text;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("mail.vuudart.site", 587); //guzelhosting smtp
            System.Net.NetworkCredential basicCredential = new
            System.Net.NetworkCredential("vuudart@vuudart.site", "Va-2022*webtasarim"); //gonderen mail adresi şifresi 
            client.EnableSsl = false;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential;

            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            cs.GonderilenMail gndmail = new cs.GonderilenMail();
            cs.GonderilenMailCRUD gndmailCRUD = new cs.GonderilenMailCRUD();

            gndmail.Tur = 0;
            gndmail.Gonderilentur = 0;
            gndmail.Gonderilen = TextBox1.Text;
            gndmail.Konubaslik = TextBox2.Text;
            gndmail.Mailmesaj = TextBox3.Text;
            gndmail.Gonderenunvan = Session["yoneticiad"].ToString() + " - " + Session["yoneticiunvan"].ToString();
            gndmail.Durum = Convert.ToBoolean(0);
            gndmail.Gtarih = DateTime.Now;

            bool cevap = gndmailCRUD.gondermail(gndmail);

            if (cevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailgonderildi", "mailgonderildi()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailgonderilemedi", "mailgonderilemedi()", true);
            }

            if (Session["gonderenmail"] != null && Session["mailkod"] != null)
            {
                cs.GelenMailCRUD gelenmailCRUD = new cs.GelenMailCRUD();
                bool yanitlandi = gelenmailCRUD.mailyanitla(Session["gonderenmail"].ToString(), Session["mailkod"].ToString());
            }          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}