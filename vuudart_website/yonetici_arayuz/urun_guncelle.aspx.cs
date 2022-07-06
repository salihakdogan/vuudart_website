using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class urun_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int[] kdvoran = { 8, 10, 18 };
                DropDownList3.Items.Add("Lütfen seçim yapın");
                for (int i = 0; i < kdvoran.Length; i++)
                {
                    DropDownList3.Items.Add(kdvoran[i].ToString());
                }
            }

            if (!IsPostBack)
            {
                string barkodprm;

                barkodprm = Request.QueryString["prmbarkod"];
                vuudart_website.cs.UrunCRUD urunCRUD = new cs.UrunCRUD();
                DataTable urundt = urunCRUD.urungoster(barkodprm);

                TextBoxBarkod.Value = urundt.Rows[0][0].ToString();
                TextBox2.Text = urundt.Rows[0][1].ToString();
                DropDownList1.SelectedValue = urundt.Rows[0][2].ToString();
                DropDownList2.SelectedValue = urundt.Rows[0][3].ToString();
                TextBox3.Text = urundt.Rows[0][8].ToString();
                TextBox4.Text = urundt.Rows[0][9].ToString();
                DropDownList3.SelectedValue = urundt.Rows[0][10].ToString();
                TextBox5.Text = urundt.Rows[0][11].ToString();
                TextBox6.Text = urundt.Rows[0][4].ToString();
                TextBox7.Text = urundt.Rows[0][12].ToString();
                TextBox8.Text = urundt.Rows[0][13].ToString();
                TextBox9.Text = urundt.Rows[0][14].ToString();
                TextBox10.Text = urundt.Rows[0][15].ToString();
                TextBox11.Text = urundt.Rows[0][16].ToString();           
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
        }

        protected void Button1_Click(object sender, EventArgs e) /*güncelle*/
        {
            cs.UrunCRUD yenibilgiCRUD = new cs.UrunCRUD();
            cs.Urun yenibilgi = new cs.Urun();

            yenibilgi.Barkod = TextBoxBarkod.Value;
            yenibilgi.Ad = TextBox2.Text;
            yenibilgi.Kategori = Convert.ToInt16(DropDownList1.SelectedValue);
            yenibilgi.Hammadde = Convert.ToInt16(DropDownList2.SelectedValue);
            yenibilgi.Fiyat = Convert.ToInt16(TextBox3.Text);
            yenibilgi.Stokadet = Convert.ToInt16(TextBox4.Text);
            yenibilgi.Kdvoran = Convert.ToInt16(DropDownList3.SelectedValue);
            yenibilgi.Kargokg = Convert.ToInt16(TextBox5.Text);

            yenibilgi.Aciklama = TextBox6.Text;

            //gorsel 1
            string urungorsel1 = FileUpload1.FileName;
            string urungorseltarih1 = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

            if (FileUpload1.HasFile != false)
            {
                FileUpload1.SaveAs(Server.MapPath("img/urun_gorsel/" + urungorseltarih1 + "_" + urungorsel1));
                yenibilgi.Gorsel1 = "img/urun_gorsel/" + urungorseltarih1 + "_" + urungorsel1;
            }
            else
            {
                yenibilgi.Gorsel1 = "";
            }

            //gorsel 2
            string urungorsel2 = FileUpload2.FileName;
            string urungorseltarih2 = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

            if (FileUpload2.HasFile != false)
            {
                FileUpload2.SaveAs(Server.MapPath("img/urun_gorsel/" + urungorseltarih2 + "_" + urungorsel2));
                yenibilgi.Gorsel2 = "img/urun_gorsel/" + urungorseltarih2 + "_" + urungorsel2;
            }
            else
            {
                yenibilgi.Gorsel2 = "";
            }

            //gorsel3
            string urungorsel3 = FileUpload3.FileName;
            string urungorseltarih3 = System.DateTime.Now.ToString("MMddyyyy_HHmmss");

            if (FileUpload3.HasFile != false)
            {
                FileUpload3.SaveAs(Server.MapPath("img/urun_gorsel/" + urungorseltarih3 + "_" + urungorsel3));
                yenibilgi.Gorsel3 = "img/urun_gorsel/" + urungorseltarih3 + "_" + urungorsel3;
            }
            else
            {
                yenibilgi.Gorsel3 = "";
            }

            cs.Olcu yeniurunolcu = new cs.Olcu();
            cs.OlcuCRUD yeniurunolcuCRUD = new cs.OlcuCRUD();

            yeniurunolcu.Barkod = TextBoxBarkod.Value;

            if (TextBox7.Text == "")
            {
                yeniurunolcu.Genislik = 0;
            }
            else
            {
                yeniurunolcu.Genislik = Convert.ToInt16(TextBox7.Text);
            }

            if (TextBox8.Text == "")
            {
                yeniurunolcu.Uzunluk = 0;
            }
            else
            {
                yeniurunolcu.Uzunluk = Convert.ToInt16(TextBox8.Text);
            }

            if (TextBox9.Text == "")
            {
                yeniurunolcu.Yukseklik = 0;
            }
            else
            {
                yeniurunolcu.Yukseklik = Convert.ToInt16(TextBox9.Text);
            }

            if (TextBox10.Text == "")
            {
                yeniurunolcu.Kalinlik = 0;
            }
            else
            {
                yeniurunolcu.Kalinlik = Convert.ToInt16(TextBox10.Text);
            }

            if (TextBox11.Text == "")
            {
                yeniurunolcu.Yaricap = 0;
            }
            else
            {
                yeniurunolcu.Yaricap = Convert.ToInt16(TextBox11.Text);
            }

            bool cevap = yenibilgiCRUD.urunguncelle(yenibilgi) && yeniurunolcuCRUD.urunolcuguncelle(yeniurunolcu); //urunguncelle

            if (cevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "basariliguncelleme", "basariliguncelleme()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "basarisizguncelleme", "basarisizguncelleme()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e) /*temizle*/
        {

        }
    }
}