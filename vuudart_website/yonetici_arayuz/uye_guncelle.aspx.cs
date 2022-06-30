using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class uye_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string kadiprm;
                kadiprm = Request.QueryString["prmkadi"];
                vuudart_website.cs.UyeCRUD uyeCRUD = new cs.UyeCRUD();
                DataTable uyedt = uyeCRUD.uyegoster(kadiprm);

                //TextBox1.Text = uyedt.Rows[0][0].ToString();
                TextBoxKadi.Value = uyedt.Rows[0][0].ToString();
                TextBox2.Text = uyedt.Rows[0][1].ToString();
                TextBox3.Text = uyedt.Rows[0][2].ToString();
                TextBox4.Text = uyedt.Rows[0][3].ToString();
                TextBox5.Text = uyedt.Rows[0][4].ToString();
                TextBox6.Text = uyedt.Rows[0][4].ToString();

                if (uyedt.Rows[0][5] != "")
                {
                    TextBox7.Text = uyedt.Rows[0][5].ToString();
                }

                if (uyedt.Rows[0][6] != "")
                {
                    TextBox8.Text = uyedt.Rows[0][6].ToString();
                }

                if (uyedt.Rows[0][7] != "")
                {
                    TextBox9.Text = uyedt.Rows[0][7].ToString();
                }

                if (uyedt.Rows[0][8] != "")
                {
                    TextBox10.Text = uyedt.Rows[0][8].ToString();
                }

                if (uyedt.Rows[0][9] != "")
                {
                    TextBox11.Text = uyedt.Rows[0][9].ToString();
                }

                if (uyedt.Rows[0][10] != "")
                {
                    TextBox12.Text = uyedt.Rows[0][10].ToString();
                }
            }          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cs.Sorgular sorgu = new cs.Sorgular();
          
            bool mailcevap = sorgu.mailkullanimdami(TextBox2.Text);
            bool tccevap = sorgu.tckullanimdami(TextBox7.Text);
            bool telefoncevap = sorgu.telefonkullanimdami(TextBox8.Text);

            if (mailcevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailkullanimda", "mailkullanimda()", true);
            }
            else if (tccevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "tckullanimda", "tckullanimda()", true);
            }
            else if (telefoncevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "telefonkullanimda", "telefonkullanimda()", true);
            }
            else
            {
                cs.UyeCRUD yenibilgiCRUD = new cs.UyeCRUD();
                cs.Uye yenibilgi = new cs.Uye();

                yenibilgi.Kullaniciad = TextBoxKadi.Value;
                yenibilgi.Mail = TextBox2.Text;
                yenibilgi.Ad = TextBox3.Text;
                yenibilgi.Soyad = TextBox4.Text;
                yenibilgi.Sifre = TextBox5.Text;

                yenibilgi.Tc = TextBox7.Text;
                yenibilgi.Telefon = TextBox8.Text;
                yenibilgi.Ulke = TextBox9.Text;
                yenibilgi.Sehir = TextBox10.Text;
                yenibilgi.Postakod = TextBox11.Text;
                yenibilgi.Adres = TextBox12.Text;

                if (!FileUpload1.HasFile)
                {
                    yenibilgi.Pfotograf = "uye_profil/default_uye_profil.jpg";
                }
                else
                {
                    string upfotograf = FileUpload1.FileName;
                    string upfotograftarih = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

                    FileUpload1.SaveAs(Server.MapPath("uye_profil/" + upfotograftarih + "_" + upfotograf));

                    yenibilgi.Pfotograf = "uye_profil/" + upfotograftarih + "_" + upfotograf;
                }

                bool cevap = yenibilgiCRUD.uyeguncelle(yenibilgi);
                if (cevap)
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
            if (IsPostBack)
            {
                string kadiprm;
                kadiprm = Request.QueryString["prmkadi"];
                vuudart_website.cs.UyeCRUD uyeCRUD = new cs.UyeCRUD();
                DataTable uyedt = uyeCRUD.uyegoster(kadiprm);

                //TextBox1.Text = uyedt.Rows[0][0].ToString();
                TextBoxKadi.Value = uyedt.Rows[0][0].ToString();
                TextBox2.Text = uyedt.Rows[0][1].ToString();
                TextBox3.Text = uyedt.Rows[0][2].ToString();
                TextBox4.Text = uyedt.Rows[0][3].ToString();
                TextBox5.Text = uyedt.Rows[0][4].ToString();
                TextBox6.Text = uyedt.Rows[0][4].ToString();

                if (uyedt.Rows[0][5] != "")
                {
                    TextBox7.Text = uyedt.Rows[0][5].ToString();
                }

                if (uyedt.Rows[0][6] != "")
                {
                    TextBox8.Text = uyedt.Rows[0][6].ToString();
                }

                if (uyedt.Rows[0][7] != "")
                {
                    TextBox9.Text = uyedt.Rows[0][7].ToString();
                }

                if (uyedt.Rows[0][8] != "")
                {
                    TextBox10.Text = uyedt.Rows[0][8].ToString();
                }

                if (uyedt.Rows[0][9] != "")
                {
                    TextBox11.Text = uyedt.Rows[0][9].ToString();
                }

                if (uyedt.Rows[0][10] != "")
                {
                    TextBox12.Text = uyedt.Rows[0][10].ToString();
                }
            }
        }
    }
}