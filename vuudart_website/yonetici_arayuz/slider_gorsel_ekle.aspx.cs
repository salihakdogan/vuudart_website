using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class slider_gorsel_ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cs.DroplistCRUD droplistelistele = new cs.DroplistCRUD();

                DataTable kategoridt = droplistelistele.urunbarkodadliste();

                DropDownList1.DataValueField = "Barkod";
                DropDownList1.DataTextField = "BarkodAd";
                DropDownList1.DataSource = kategoridt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Lütfen seçim yapın", "0"));              
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cs.Slider yenislider = new cs.Slider();
            cs.SliderCRUD yenisliderCRUD = new cs.SliderCRUD();

            yenislider.Barkod = DropDownList1.SelectedValue;
            yenislider.Baslik = TextBox1.Text;
  
            FileUpload1.SaveAs(Server.MapPath("img/slider_gorsel/" + FileUpload1.FileName));
            yenislider.Slidergorsel = "yonetici_arayuz/img/slider_gorsel/" + FileUpload1.FileName;
            

            bool cevap = yenisliderCRUD.slidergorselekle(yenislider);

            if (cevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "sliderkayitbasarili", "sliderkayitbasarili()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "sliderkayitbasarisiz", "sliderkayitbasarisiz()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}