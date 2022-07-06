using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website
{
    public partial class yonetici_giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string güvenlicikis = Request.QueryString["cikisyapildi"];
            if (güvenlicikis == "1")
            {
                Session.Abandon();
                Session.RemoveAll();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cs.YoneticiCRUD ygirisbilgi = new cs.YoneticiCRUD();

            cs.Sifreleme sifreleme = new cs.Sifreleme();
            string encryptedsifre = sifreleme.Encrypt(TextBox2.Text);

            bool cevap = ygirisbilgi.yoneticigiris(TextBox1.Text, encryptedsifre);

            if (cevap)
            {                
                Session["yoneticigiris"] = TextBox1.Text;
                Response.Redirect("yonetici_arayuz/index.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "girisyapilamadi", "girisyapilamadi()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}