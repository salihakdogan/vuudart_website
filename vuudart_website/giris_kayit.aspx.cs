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

namespace vuudart_website
{
    public partial class giris_kayit : System.Web.UI.Page
    {
        HttpCookie kuki = new HttpCookie("vuudartuyegiris");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["vuudartuyegiris"] != null)
                {
                    kuki = Request.Cookies["vuudartuyegiris"];
                    TextBox1.Text = kuki["uyemail"].ToString();
                }
            }

            if (Session["dogrulamayatasi"] != null)
            {
                TextBox1.Text = Session["dogrulamayatasi"].ToString();
            }

            if (Session["kayitsonrasidogrulamayatasi"] != null)
            {
                TextBox1.Text = Session["kayitsonrasidogrulamayatasi"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e) /*giriş*/
        {
            cs.Sifreleme sifreleme = new cs.Sifreleme();
            string encryptedsifre = sifreleme.Encrypt(TextBox2.Text);

            cs.UyeCRUD uye = new cs.UyeCRUD();
            bool mailgiris = uye.uyegirissitemail(TextBox1.Text,encryptedsifre);

            cs.UyeCRUD dogrulanmismi = new cs.UyeCRUD();
            DataTable dtuye = dogrulanmismi.uyelerilistele();

            bool dogrulanmisuye = dogrulanmismi.dogrulanmisuye(TextBox1.Text, Convert.ToString(dtuye.Rows[0][13]));

            Session["dogrulamayatasi"] = TextBox1.Text;

            if (mailgiris)
            {
                if (dogrulanmisuye == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "dogrulamagerekli", "dogrulamagerekli()", true);
                }
                else
                {
                    Session["uyemail"] = TextBox1.Text;

                    if (CheckBox1.Checked)
                    {
                        kuki["uyemail"] = TextBox1.Text;

                        kuki.Expires = DateTime.Now.AddDays(10);
                        Response.Cookies.Add(kuki);
                    }
                    Session["uyegirisi"] = "ok";

                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "girishatali", "girishatali()", true);
            }

        }

        protected void Button2_Click(object sender, EventArgs e) /*kayıt*/
        {
            Session["kayitsonrasidogrulamayatasi"] = TextBox4.Text;
            
            cs.Sorgular sorgu = new cs.Sorgular();
            bool kadicevap = sorgu.kadikullanimdami(TextBox3.Text);
            bool mailcevap = sorgu.mailkullanimdami(TextBox4.Text);

            if (kadicevap == true)/*mail adresi kullaniliyorsa*/
            {
                ClientScript.RegisterStartupScript(this.GetType(), "kadikullanimda", "kadikullanimda()", true);
            }
            else if (mailcevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailkullanimda", "mailkullanimda()", true);
            }
            else
            {
                cs.RandomClass randomaktod = new cs.RandomClass();
                string aktkod = randomaktod.sifreUret();                

                cs.Uye yeniuye = new cs.Uye();
                cs.UyeCRUD yeniuyeCRUD = new cs.UyeCRUD();
                 
                yeniuye.Kullaniciad = TextBox3.Text;
                yeniuye.Mail = TextBox4.Text;
                yeniuye.Ad = TextBox5.Text;
                yeniuye.Soyad = TextBox6.Text;
                yeniuye.Pfotograf = "img/uye_profil/default_uye_profil.png";

                cs.Sifreleme sifreleme = new cs.Sifreleme();
                string encryptedsifre = sifreleme.Encrypt(TextBox7.Text);

                yeniuye.Sifre = encryptedsifre;          

                yeniuye.Dkod = aktkod;
                yeniuye.Durum = 0;

                if (CheckBox3.Checked)
                {
                    yeniuye.Mailonay = 1;
                }
                else
                {
                    yeniuye.Mailonay = 0;
                }

                bool cevap = yeniuyeCRUD.uyeeklesite(yeniuye);

                if (cevap == true)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "basarilikayit", "basarilikayit()", true);                  
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "basarisizkayit", "basarisizkayit()", true);
                }

                string to = TextBox4.Text; //kime mail gidecek
                string from = "vuudart@vuudart.site"; //bizim mail adreisimiz

                MailMessage message = new MailMessage(from, to);

                string mailbody = "Sayın " + TextBox5.Text + " " + TextBox6.Text + " VuudArt'a Hoş Geldiniz! Kaydınızı tamamlamak için doğrulama kodunuz: " + aktkod;
                message.Subject = "Aramıza Hoş geldiniz VuudArt üyelik doğrulama kodunuz";
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
        }
    }
}