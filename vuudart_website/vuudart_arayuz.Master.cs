﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vuudart_website
{
    public partial class vuudart_arayuz : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("default.aspx");
        }
    }
}