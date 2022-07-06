using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class slider_gorsel_liste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string silinecekprm = Request.QueryString["silprm"];

            if (silinecekprm != null)
            {
                vuudart_website.cs.SliderCRUD sil = new cs.SliderCRUD();

                bool cevap = sil.slidersil(silinecekprm);

                if (cevap == true)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "slidersilindi", "slidersilindi()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "slidersilinemedi", "slidersilinemedi()", true);
                }
            }
        }
    }
}