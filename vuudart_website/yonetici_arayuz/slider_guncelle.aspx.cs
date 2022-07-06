using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class slider_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string barkodprm;
                barkodprm = Request.QueryString["prmbarkod"];
                cs.SliderCRUD sliderCRUD = new cs.SliderCRUD();
                DataTable sliderdt = sliderCRUD.slidergoster(barkodprm);

                TextBoxBarkod.Value = sliderdt.Rows[0][0].ToString();
                TextBox1.Text = sliderdt.Rows[0][1].ToString();
                Image2.ImageUrl = sliderdt.Rows[0][2].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cs.SliderCRUD yenibilgiCRUD = new cs.SliderCRUD();
            cs.Slider yenibilgi = new cs.Slider();

            yenibilgi.Barkod = TextBoxBarkod.Value;
            yenibilgi.Baslik = TextBox1.Text;
           
            FileUpload1.SaveAs(Server.MapPath("img/slider_gorsel/" + FileUpload1.FileName));
            yenibilgi.Slidergorsel = "img/slider_gorsel/" + FileUpload1.FileName;

            bool cevap = yenibilgiCRUD.sliderguncelle(yenibilgi);

            if (cevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "basariliguncelleme", "basariliguncelleme()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "basarisizguncelleme", "basarisizguncelleme()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}