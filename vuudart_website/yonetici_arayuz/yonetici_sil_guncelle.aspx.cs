using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class yonetici_sil_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string silinecekprm = Request.QueryString["silprm"];

            if (silinecekprm != null)
            {
                vuudart_website.cs.YoneticiCRUD sil = new cs.YoneticiCRUD();

                bool cevap = sil.yoneticisil(silinecekprm);

                if (cevap == true)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "yoneticisilindi", "yoneticisilindi()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "yoneticisilinemedi", "yoneticisilinemedi()", true);
                }
            }
        }
    }
}