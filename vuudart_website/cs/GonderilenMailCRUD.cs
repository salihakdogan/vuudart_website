using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class GonderilenMailCRUD
    {
        Db db = new Db();

        public bool gondermail(GonderilenMail gondermail)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into GonderilenMail values(@1,@2,@3,@4,@5,@6,@7,@8)", db.baglanti);

            komut.Parameters.AddWithValue("@1", gondermail.Tur);
            komut.Parameters.AddWithValue("@2", gondermail.Gonderilentur);
            komut.Parameters.AddWithValue("@3", gondermail.Gonderilen);
            komut.Parameters.AddWithValue("@4", gondermail.Konubaslik);
            komut.Parameters.AddWithValue("@5", gondermail.Mailmesaj);
            komut.Parameters.AddWithValue("@6", gondermail.Gonderenunvan);
            komut.Parameters.AddWithValue("@7", gondermail.Gtarih);
            komut.Parameters.AddWithValue("@8", gondermail.Durum);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable gndmaillistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from GonderilenMail", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public DataTable onaymaillistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from Uyeler where MailOnay = 1", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public DataTable yetkilimaillistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from Yoneticiler", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }
    }
}