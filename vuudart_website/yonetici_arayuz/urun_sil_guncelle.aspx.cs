using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class urun_sil_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string silinecekprm = Request.QueryString["silprm"];

            if (silinecekprm != null)
            {
                vuudart_website.cs.UrunCRUD sil = new cs.UrunCRUD();

                bool cevap = sil.urunsil(silinecekprm);

                if (cevap == true)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "urunsilindi", "urunsilindi()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "urunsilinemedi", "urunsilinemedi()", true);
                }
            }
        }
    }
}