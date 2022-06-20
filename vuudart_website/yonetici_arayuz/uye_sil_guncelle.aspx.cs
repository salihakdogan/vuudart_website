using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website.yonetici_arayuz
{
    public partial class uye_sil_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string silinecekprm = Request.QueryString["silprm"];

            if (silinecekprm != null)
            {
                vuudart_website.cs.UyeCRUD sil = new cs.UyeCRUD();

                bool cevap = sil.uyesil(silinecekprm);

                if (cevap == true)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "uyesilindi", "uyesilindi()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "uyesilinemedi", "uyesilinemedi()", true);
                }
            }
        }
    }
}