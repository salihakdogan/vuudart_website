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

                if (Request.QueryString["prmazalturun"] != null)
                {
                    string prmazalturun = Request.QueryString["prmazalturun"].ToString();

                    if (Convert.ToInt16(Request.QueryString["prmurunadet"]) != 1)
                    {
                        cs.SepetCRUD azalt = new cs.SepetCRUD();                      
                        bool click = azalt.sepetadetazalt(prmazalturun, Session["uyemail"].ToString());
                        Response.Redirect("sepet.aspx");
                    }

                    if (Convert.ToInt16(Request.QueryString["prmurunadet"]) == 1)
                    {
                        int silurun = Convert.ToInt16(Request.QueryString["prmurunadet"]);

                        if (silurun == 1)
                        {
                            cs.SepetCRUD sil = new cs.SepetCRUD();
                            bool click0 = sil.sepeturunsil(prmazalturun, Session["uyemail"].ToString());
                            Response.Redirect("sepet.aspx");
                        }
                    }
                }

                if (Request.QueryString["prmarttirurun"] != null)
                {
                    cs.SepetCRUD arttir = new cs.SepetCRUD();

                    string prmarttirurun = Request.QueryString["prmarttirurun"].ToString();
                    bool click = arttir.sepetadetarttir(prmarttirurun, Session["uyemail"].ToString());
                    Response.Redirect("sepet.aspx");
                }

                if (Request.QueryString["prmsilurun"] != null)
                {
                    cs.SepetCRUD sil = new cs.SepetCRUD();

                    string prmsilurun = Request.QueryString["prmsilurun"].ToString();
                    bool click1 = sil.sepeturunsil(prmsilurun, Session["uyemail"].ToString());
                    Response.Redirect("sepet.aspx");
                }
            }    
        }
    }
}