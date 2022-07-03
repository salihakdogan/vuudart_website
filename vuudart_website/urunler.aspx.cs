using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website
{
    public partial class urunler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cs.DroplistCRUD droplistelistele = new cs.DroplistCRUD();

                DataTable kategoridt = droplistelistele.kategoriliste();

                DropDownList1.DataValueField = "KategoriID";
                DropDownList1.DataTextField = "Ad";
                DropDownList1.DataSource = kategoridt;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Kategoriler", "0"));
                DropDownList1.Items.Insert(1, new ListItem("Tüm Ürünler", "1"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}