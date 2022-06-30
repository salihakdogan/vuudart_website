using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website
{
    public partial class giris_kayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e) /*giriş*/
        {
                    
        }

        protected void Button2_Click(object sender, EventArgs e) /*kayıt*/
        {
            cs.RandomClass randomaktod = new cs.RandomClass();
            string aktkod = randomaktod.sifreUret();
            Response.Write(aktkod);

            cs.Uye yeniuye = new cs.Uye();
            cs.UyeCRUD yeniuyeCRUD = new cs.UyeCRUD();

            yeniuye.Kullaniciad = TextBox3.Text;
            yeniuye.Mail = TextBox4.Text;
            yeniuye.Ad = TextBox5.Text;
            yeniuye.Soyad = TextBox6.Text;
            yeniuye.Sifre = TextBox7.Text;
        }
    }
}