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

                DropDownList1.DataValueField = "Ad";
                DropDownList1.DataTextField = "Ad";
                DropDownList1.DataSource = kategoridt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
     

                DataTable hammaddedt = droplistelistele.hammaddeliste();

                DropDownList2.DataValueField = "Ad";
                DropDownList2.DataTextField = "Ad";
                DropDownList2.DataSource = hammaddedt;
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
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