using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website
{
    public partial class hesap_dogrula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dogrulamayatasi"]!=null)
            {
                TextBox1.Text = Session["dogrulamayatasi"].ToString();
            }

            if (Session["kayitsonrasidogrulamayatasi"]!=null)
            {
                TextBox1.Text = Session["kayitsonrasidogrulamayatasi"].ToString();
            }          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cs.UyeCRUD onaylimi = new cs.UyeCRUD();

            DataTable dt = onaylimi.dogrulanmamis(TextBox1.Text);

            if (TextBox2.Text == Convert.ToString(dt.Rows[0][12]))
            {
                onaylimi.dogrula(TextBox1.Text, TextBox2.Text);
                ClientScript.RegisterStartupScript(this.GetType(), "dogrulamabasarili", "dogrulamabasarili()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "dogrulamabasarisiz", "dogrulamabasarisiz()", true);
            }
        }
    }
}