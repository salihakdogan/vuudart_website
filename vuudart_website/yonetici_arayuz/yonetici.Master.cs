using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace vuudart_website.yonetici_arayuz
{
    public partial class yonetici : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yoneticigiris"] == null)
            {
                Response.Redirect("../yonetici_giris.aspx");
            }
            else if (Session["yoneticigiris"] != null)
            {
                cs.YoneticiCRUD yonetici = new cs.YoneticiCRUD();
                DataTable dt = new DataTable();

                dt = yonetici.yoneticibilgigoster(Session["yoneticigiris"].ToString());

                y_adlabel.Text = dt.Rows[0][1].ToString();
                y_soyadlabel.Text = dt.Rows[0][2].ToString();
                y_unvanlabel.Text = dt.Rows[0][6].ToString();
                y_pfotograf.ImageUrl = dt.Rows[0][7].ToString();

                Session["yoneticiad"] = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2].ToString();
                Session["yoneticiunvan"] = dt.Rows[0][6].ToString();
            }
        }
    }
}