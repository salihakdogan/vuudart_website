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
        HttpCookie kukiyonetici = new HttpCookie("vuudartyoneticigiris");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["vuudartyoneticigiris"] != null)
                {
                    kukiyonetici = Request.Cookies["vuudartyoneticigiris"];
                    TextBox1.Text = kukiyonetici["yoneticigiris"].ToString();
                }
            }


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

                if (CheckBox1.Checked)
                {
                    kukiyonetici["yoneticigiris"] = TextBox1.Text;

                    kukiyonetici.Expires = DateTime.Now.AddDays(10);
                    Response.Cookies.Add(kukiyonetici);
                }
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