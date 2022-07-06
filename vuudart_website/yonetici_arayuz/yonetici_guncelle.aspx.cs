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
    public partial class yonetici_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tcprm;
                tcprm = Request.QueryString["prmtc"];
                cs.YoneticiCRUD yoneticiCRUD = new cs.YoneticiCRUD();
                DataTable yoneticidt = yoneticiCRUD.yoneticigoster(tcprm);

                TextBoxTc.Value = yoneticidt.Rows[0][0].ToString();
                TextBox2.Text = yoneticidt.Rows[0][3].ToString();
                TextBox3.Text = yoneticidt.Rows[0][1].ToString();
                TextBox4.Text = yoneticidt.Rows[0][2].ToString();

                cs.Sifreleme sifreleme = new cs.Sifreleme();
                string decryptedsifre = sifreleme.Decrypt(yoneticidt.Rows[0][4].ToString());

                TextBox5.Text = decryptedsifre;
                TextBox6.Text = decryptedsifre;

                TextBox7.Text = yoneticidt.Rows[0][5].ToString();
                DropDownList1.SelectedValue = yoneticidt.Rows[0][6].ToString();
            }

            if (!IsPostBack)
            {
                cs.DroplistCRUD droplistelistele = new cs.DroplistCRUD();

                DataTable unvandt = droplistelistele.unvanliste();

                DropDownList1.DataValueField = "UnvanID";
                DropDownList1.DataTextField = "Unvan";
                DropDownList1.DataSource = unvandt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string tcprm;
            tcprm = Request.QueryString["prmtc"];
            cs.YoneticiCRUD yoneticiCRUD = new cs.YoneticiCRUD();
            DataTable yoneticidt = yoneticiCRUD.yoneticigoster(tcprm);
            
            string aynimail = yoneticidt.Rows[0][3].ToString();
            string aynitelefon = yoneticidt.Rows[0][5].ToString();

            cs.Sorgular sorgu = new cs.Sorgular();

            bool ymailcevap = sorgu.ymailkullanimdami(TextBox2.Text);
            bool ytelefoncevap = sorgu.ytelefonkullanimdami(TextBox7.Text);

            if (ymailcevap == true && aynimail != TextBox2.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailkullanimda", "mailkullanimda()", true);
            }
            else if (ytelefoncevap == true && aynitelefon != TextBox7.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "telefonkullanimda", "telefonkullanimda()", true);
            }
            else
            {
                cs.YoneticiCRUD yenibilgiCRUD = new cs.YoneticiCRUD();
                cs.Yonetici yenibilgi = new cs.Yonetici();

                yenibilgi.Yoneticitc = TextBoxTc.Value;
                yenibilgi.Mail = TextBox2.Text;
                yenibilgi.Ad = TextBox3.Text;
                yenibilgi.Soyad = TextBox4.Text;

                cs.Sifreleme sifreleme = new cs.Sifreleme();
                string encryptedsifre = sifreleme.Encrypt(TextBox5.Text);

                yenibilgi.Sifre = encryptedsifre;
                yenibilgi.Telefon = TextBox7.Text;
                yenibilgi.Unvan = Convert.ToInt16(DropDownList1.SelectedValue);

                string yoneticigorsel = FileUpload1.FileName;
                string yoneticigorseltarih = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

                if (FileUpload1.HasFile != false)
                {
                    FileUpload1.SaveAs(Server.MapPath("img/yonetici_profil/" + yoneticigorsel + "_" + yoneticigorseltarih));
                    yenibilgi.Pfotograf = "img/yonetici_profil/" + yoneticigorseltarih + "_" + yoneticigorsel;
                }
                else
                {
                    yenibilgi.Pfotograf = "img/yonetici_profil/default_yonetici_profil.png";
                }

                bool cevap = yenibilgiCRUD.yoneticiguncelle(yenibilgi);
                if (cevap)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "basariliguncelleme", "basariliguncelleme()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "basarisizguncelleme", "basarisizguncelleme()", true);
                }
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}