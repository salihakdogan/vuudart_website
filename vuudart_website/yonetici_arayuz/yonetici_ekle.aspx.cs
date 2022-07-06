using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class yonetici_ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string yeniunvan = Request.QueryString["unvaneklendi"];
            if (yeniunvan != null)
            {
                if (!IsPostBack)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "unvaneklendi", "unvaneklendi()", true);
                }
            }

            string unvanislemiptal = Request.QueryString["islem3iptal"];
            if (unvanislemiptal != null)
            {
                if (!IsPostBack)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "islem3iptal", "islem3iptal()", true);
                }
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
            cs.Sorgular sorgu = new cs.Sorgular();

            bool tccevap = sorgu.ytckullanimdami(TextBox1.Text);
            bool mailcevap = sorgu.ymailkullanimdami(TextBox2.Text);
            bool telefoncevap = sorgu.ytelefonkullanimdami(TextBox7.Text);

            if (tccevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "tckullanimda", "tckullanimda()", true);
            }
            else if (mailcevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailkullanimda", "mailkullanimda()", true);
            }
            else if (telefoncevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "telefonkullanimda", "telefonkullanimda()", true);
            }
            else
            {
                cs.Yonetici yeniyonetici = new cs.Yonetici();
                cs.YoneticiCRUD yeniyoneticiCRUD = new cs.YoneticiCRUD();

                yeniyonetici.Yoneticitc = TextBox1.Text;
                yeniyonetici.Mail = TextBox2.Text;
                yeniyonetici.Ad = TextBox3.Text;
                yeniyonetici.Soyad = TextBox4.Text;

                cs.Sifreleme sifreleme = new cs.Sifreleme();
                string encryptedsifre = sifreleme.Encrypt(TextBox5.Text);

                yeniyonetici.Sifre = encryptedsifre;
                yeniyonetici.Telefon = TextBox7.Text;
                yeniyonetici.Unvan = Convert.ToInt16(DropDownList1.SelectedValue);

                string yoneticigorsel = FileUpload1.FileName;
                string yoneticigorseltarih = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

                if (FileUpload1.HasFile != false)
                {
                    FileUpload1.SaveAs(Server.MapPath("img/yonetici_profil/" + yoneticigorsel + "_" + yoneticigorseltarih));
                    yeniyonetici.Pfotograf = "img/yonetici_profil/" + yoneticigorseltarih + "_" + yoneticigorsel;
                }
                else
                {
                    yeniyonetici.Pfotograf = "img/yonetici_profil/default_yonetici_profil.png";
                }

                bool cevap = yeniyoneticiCRUD.yoneticiekle(yeniyonetici);

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
            Response.Redirect(Request.RawUrl);
        }     

        protected void yeni_unvan_Click(object sender, EventArgs e)
        {
            tumsayfa.Visible = false;
            yeni_unvan_ekle.Visible = true;
        }

        protected void yu_kayit_button_Click(object sender, EventArgs e)
        {
            cs.Droplist yunvan = new cs.Droplist();
            cs.DroplistCRUD yudplistCRUD = new cs.DroplistCRUD();

            yunvan.Unvanad = yu_textbox1.Text;
            yunvan.Unvanaciklama = yu_textbox2.Text;

            bool cevap = yudplistCRUD.yunvanekle(yunvan);

            if (cevap == true)
            {
                Response.Redirect("yonetici_ekle.aspx?unvaneklendi=1");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "unvaneklenemedi", "unvaneklenemedi()", true);
            }
        }

        protected void yu_iptal_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("yonetici_ekle.aspx?islem3iptal=1");
        }
    }
}