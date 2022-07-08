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
    public partial class toplu_mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add("Lütfen seçim yapın");
                DropDownList1.Items.Add("Mail iletisi isteyen tüm üyeler");
                DropDownList1.Items.Add("Tüm yöneticiler");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text == "Mail iletisi isteyen tüm üyeler")
            {
                cs.GonderilenMailCRUD gidenmailler = new cs.GonderilenMailCRUD();
                DataTable dt = new DataTable();
                dt = gidenmailler.onaymaillistele();

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    string to = Convert.ToString(dt.Rows[i][1]); //kime mail gidecek
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
                }

                cs.GonderilenMail gndmail = new cs.GonderilenMail();
                cs.GonderilenMailCRUD gndmailCRUD = new cs.GonderilenMailCRUD();

                gndmail.Tur = 1;
                gndmail.Gonderilentur = 0;
                gndmail.Gonderilen = "Mail iletisi isteyen tüm üyeler";
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
            }

            if (DropDownList1.SelectedItem.Text == "Tüm yöneticiler")
            {
                cs.GonderilenMailCRUD gidenmailler = new cs.GonderilenMailCRUD();
                DataTable dt = new DataTable();
                dt = gidenmailler.yetkilimaillistele();

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    string to = Convert.ToString(dt.Rows[i][3]); //kime mail gidecek
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
                }

                cs.GonderilenMail gndmail = new cs.GonderilenMail();
                cs.GonderilenMailCRUD gndmailCRUD = new cs.GonderilenMailCRUD();

                gndmail.Tur = 1;
                gndmail.Gonderilentur = 1;
                gndmail.Gonderilen = "Tüm yöneticiler";
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
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}