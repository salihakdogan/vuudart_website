using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class GelenMailCRUD
    {
        Db db = new Db();

        public bool gelenmail(GelenMail gelenmail)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into GelenMail values(@1,@2,@3,@4,@5)", db.baglanti);

            komut.Parameters.AddWithValue("@1", gelenmail.Gonderenmail);
            komut.Parameters.AddWithValue("@2", gelenmail.Konubaslik);
            komut.Parameters.AddWithValue("@3", gelenmail.Mailmesaj);
            komut.Parameters.AddWithValue("@4", gelenmail.Gtarih);
            komut.Parameters.AddWithValue("@5", gelenmail.Durum);
            
            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable glnmaillistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from GelenMail", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }
    }
}