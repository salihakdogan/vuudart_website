using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class urun_ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            string yenikategori = Request.QueryString["kateeklendi"];
            if (yenikategori != null)
            {
                if (!IsPostBack)
                { 
                    ClientScript.RegisterStartupScript(this.GetType(), "kategorieklendi", "kategorieklendi()", true);
                }             
            }

            string kategoriislemiptal = Request.QueryString["islem1iptal"];
            if (kategoriislemiptal != null)
            {
                if (!IsPostBack)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "islem1iptal", "islem1iptal()", true);
                }
            }

            string yenihammadde = Request.QueryString["hmddeklendi"];
            if (yenihammadde != null)
            {
                if (!IsPostBack)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "hammaddeeklendi", "hammaddeeklendi()", true);
                }
            }

            string hammadeislemiiptal = Request.QueryString["islem2iptal"];
            if (hammadeislemiiptal != null)
            {
                if (!IsPostBack)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "islem2iptal", "islem2iptal()", true);
                }
            }

            if (!IsPostBack)
            {
                cs.DroplistCRUD droplistelistele = new cs.DroplistCRUD();

                DataTable kategoridt = droplistelistele.kategoriliste();

                DropDownList1.DataValueField = "KategoriID";
                DropDownList1.DataTextField = "Ad";
                DropDownList1.DataSource = kategoridt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
     

                DataTable hammaddedt = droplistelistele.hammaddeliste();

                DropDownList2.DataValueField = "HammaddeID";
                DropDownList2.DataTextField = "Ad";
                DropDownList2.DataSource = hammaddedt;
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
            }

            if (!IsPostBack)
            {
                int[] kdvoran = { 8, 10, 18 };
                DropDownList3.Items.Add("Lütfen seçim yapın");
                for (int i = 0; i < kdvoran.Length; i++)
                {
                    DropDownList3.Items.Add(kdvoran[i].ToString());
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e) /*kayıt*/
        {
            cs.Urun yeniurun = new cs.Urun();
            cs.UrunCRUD yeniurunCRUD = new cs.UrunCRUD();

            yeniurun.Barkod = TextBox1.Text;
            yeniurun.Ad = TextBox2.Text;
            yeniurun.Kategori = Convert.ToInt16(DropDownList1.SelectedValue);
            yeniurun.Hammadde = Convert.ToInt16(DropDownList2.SelectedValue);
            yeniurun.Fiyat = Convert.ToInt16(TextBox3.Text);
            yeniurun.Stokadet = Convert.ToInt16(TextBox4.Text);
            yeniurun.Kdvoran = Convert.ToInt16(DropDownList3.SelectedValue);
            yeniurun.Kargokg = Convert.ToInt16(TextBox5.Text);

            yeniurun.Aciklama = TextBox6.Text;


            string urungorsel1 = FileUpload1.FileName;
            string urungorseltarih1 = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

            FileUpload1.SaveAs(Server.MapPath("img/urun_gorsel/" + urungorseltarih1 + "_" + urungorsel1));
            yeniurun.Gorsel1 = "img/urun_gorsel/" + urungorseltarih1 + "_" + urungorsel1;


            string urungorsel2 = FileUpload2.FileName;
            string urungorseltarih2 = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

            FileUpload2.SaveAs(Server.MapPath("img/urun_gorsel/" + urungorseltarih2 + "_" + urungorsel2));
            yeniurun.Gorsel2 = "img/urun_gorsel/" + urungorseltarih2 + "_" + urungorsel2;


            string urungorsel3 = FileUpload3.FileName;
            string urungorseltarih3 = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

            FileUpload3.SaveAs(Server.MapPath("img/urun_gorsel/" + urungorseltarih3 + "_" + urungorsel3));
            yeniurun.Gorsel3 = "img/urun_gorsel/" + urungorseltarih3 + "_" + urungorsel3;

            cs.Olcu yeniurunolcu = new cs.Olcu();
            cs.OlcuCRUD yeniurunolcuCRUD = new cs.OlcuCRUD();

            yeniurunolcu.Barkod = TextBox1.Text;

            if (TextBox7.Text=="")
            {
                yeniurunolcu.Genislik = 0;
            }
            else
            {
                yeniurunolcu.Genislik = Convert.ToInt16(TextBox7.Text);
            }

            if (TextBox8.Text=="")
            {
                yeniurunolcu.Uzunluk = 0;
            }
            else
            {
                yeniurunolcu.Uzunluk = Convert.ToInt16(TextBox8.Text);
            }

            if (TextBox9.Text=="")
            {
                yeniurunolcu.Yukseklik = 0;
            }
            else
            {
                yeniurunolcu.Yukseklik = Convert.ToInt16(TextBox9.Text);
            }

            if (TextBox10.Text=="")
            {
                yeniurunolcu.Kalinlik = 0;
            }
            else
            {
                yeniurunolcu.Kalinlik = Convert.ToInt16(TextBox10.Text);
            }

            if (TextBox11.Text=="")
            {
                yeniurunolcu.Yaricap = 0;
            }
            else
            {
                yeniurunolcu.Yaricap = Convert.ToInt16(TextBox11.Text);
            }
                          
            bool cevap = yeniurunCRUD.urunekle(yeniurun) && yeniurunolcuCRUD.olcuekle(yeniurunolcu);

            if (cevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "basarilikayit", "basarilikayit()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "basarisizkayit", "basarisizkayit()", true);
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e) /*temizle*/
        {

        }

        protected void yeni_kategori_Click(object sender, EventArgs e)
        {
            tumsayfa.Visible = false;
            yeni_hammadde_ekle.Visible = false;
            yeni_kategori_ekle.Visible = true;
        }

        protected void yk_kayit_button_Click(object sender, EventArgs e)
        {
            cs.Droplist ykategori = new cs.Droplist();
            cs.DroplistCRUD ykdplistCRUD = new cs.DroplistCRUD();

            ykategori.Kategoriad = yk_textbox1.Text;
            ykategori.Kategoriaciklama = yk_textbox2.Text;

            bool cevap = ykdplistCRUD.ykategoriekle(ykategori);

            if (cevap == true)
            {
                Response.Redirect("urun_ekle.aspx?kateeklendi=1");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "kategorieklenemedi", "kategorieklenemedi()", true);
            }            
        }

        protected void yk_iptal_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("urun_ekle.aspx?islem1iptal=1");
        }

        protected void yeni_hammadde_Click(object sender, EventArgs e)
        {
            tumsayfa.Visible = false;
            yeni_kategori_ekle.Visible = false;
            yeni_hammadde_ekle.Visible = true;
        }

        protected void yh_kayit_button_Click(object sender, EventArgs e)
        {
            cs.Droplist yhammadde = new cs.Droplist();
            cs.DroplistCRUD yhdplistCRUD = new cs.DroplistCRUD();

            yhammadde.Hammaddead = yh_textbox1.Text;
            yhammadde.Hammaddeaciklama = yh_textbox2.Text;

            bool cevap = yhdplistCRUD.yhammaddeekle(yhammadde);

            if (cevap == true)
            {
                Response.Redirect("urun_ekle.aspx?hmddeklendi=1");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "hammaddeeklenemedi", "hammaddeeklenemedi()", true);
            }
        }

        protected void yh_iptal_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("urun_ekle.aspx?islem2iptal=1");
        }       
    }
}