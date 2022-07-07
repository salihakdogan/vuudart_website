using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;

namespace vuudart_website
{
    public partial class iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            vuudart_website.cs.GelenMail glnmail = new vuudart_website.cs.GelenMail();
            vuudart_website.cs.GelenMailCRUD glnmailCRUD = new vuudart_website.cs.GelenMailCRUD();

            glnmail.Gonderenmail = TextBox1.Text;
            glnmail.Konubaslik = TextBox2.Text;
            glnmail.Mailmesaj = TextBox3.Text;
            glnmail.Gtarih = DateTime.Now;
            glnmail.Durum = Convert.ToBoolean(0);         

            bool cevap = glnmailCRUD.gelenmail(glnmail);

            if (cevap == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailgonderildi", "mailgonderildi()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mailgonderilemedi", "mailgonderilemedi()", true);
            }

            cs.GonderilenMail gndmail = new cs.GonderilenMail();
            cs.GonderilenMailCRUD gndmailCRUD = new cs.GonderilenMailCRUD();        
        }
    }
}