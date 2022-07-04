using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website
{
    public partial class sepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["prmurun"] != null)
                {
                    string prmurun = Request.QueryString["prmurun"];
                    cs.SepetCRUD sepeteeklenenurun = new cs.SepetCRUD();
                    sepeteeklenenurun.sepeteekle(prmurun, Session["uyemail"].ToString());
                    Response.Redirect("sepet.aspx");
                }              
            }    
        }

        protected void adet_azalt_Click(object sender, EventArgs e)
        {
            cs.DroplistCRUD azalt = new cs.DroplistCRUD();

        }

        protected void adet_arttir_Click(object sender, EventArgs e)
        {
            cs.DroplistCRUD arttir = new cs.DroplistCRUD();
        }
    }
}