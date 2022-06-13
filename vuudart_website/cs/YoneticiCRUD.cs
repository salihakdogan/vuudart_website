using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class YoneticiCRUD
    {
        Db db = new Db();

        public bool yoneticigiris(string ymail, string ysfr)
        {
            bool sonuc;
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from Yoneticiler where Mail=@a and Sifre=@b", db.baglanti);

            komut.Parameters.AddWithValue("@a", ymail);
            komut.Parameters.AddWithValue("@b", ysfr);

            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                sonuc = false;
            }
            else
            {
                sonuc = true;
            }
            db.kapat();

            return sonuc;
        }
    }
}