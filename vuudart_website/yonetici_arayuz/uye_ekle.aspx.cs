using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class uye_ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cs.SorgularCRUD sorgu = new cs.SorgularCRUD();

            bool mailcevap = sorgu.mailkullanimdami(TextBox3.Text);
            bool telefoncevap = sorgu.telefonkullanimdami(TextBox4.Text);
            bool tccevap = sorgu.tckullanimdami(TextBox7.Text);
     
            if (mailcevap == true)/*mail adresi kullaniliyorsa*/
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailkullanimda", "mailkullanimda()", true);
            }
            else if (telefoncevap == true)
            {              
                ClientScript.RegisterStartupScript(this.GetType(), "telefonkullanimda", "telefonkullanimda()", true);
            }
            else if (tccevap == true)
            {             
                ClientScript.RegisterStartupScript(this.GetType(), "tckullanimda", "tckullanimda()", true);
            }
            else
            {
                //yeni sayfa
                cs.Uye yeniuye = new cs.Uye();
                cs.UyeCRUD yeniuyeCRUD = new cs.UyeCRUD();

                yeniuye.Ad = TextBox1.Text;
                yeniuye.Soyad = TextBox2.Text;
                yeniuye.Mail = TextBox3.Text;
                yeniuye.Telefon = TextBox4.Text;
                yeniuye.Sifre = TextBox5.Text;

                yeniuye.Tc = TextBox7.Text;
                yeniuye.Sirket = TextBox8.Text;
                yeniuye.Ulke = TextBox9.Text;
                yeniuye.Sehir = TextBox10.Text;
                yeniuye.Postakod = TextBox11.Text;
                yeniuye.Adres = TextBox12.Text;


                if (!FileUpload1.HasFile)
                {
                    yeniuye.Pfotograf = "uye_profil/default_uye_profil.jpg";
                }
                else
                {
                    //string upfotograf = FileUpload1.FileName.Replace(FileUpload1.FileName, "uye_profil");
                    string upfotograf = FileUpload1.FileName;
                    string upfotograftarih = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

                    FileUpload1.SaveAs(Server.MapPath("uye_profil/" + upfotograftarih + "_" + upfotograf));

                    yeniuye.Pfotograf = "uye_profil/" + upfotograftarih + "_" + upfotograf;
                }

                bool cevap = yeniuyeCRUD.uyeekle(yeniuye);

                if (cevap == true)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "basarilikayit", "basarilikayit()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "basarisizkayit", "basarisizkayit()", true);
                }
            }                   
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
        }
    }
}