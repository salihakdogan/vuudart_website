using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class DroplistCRUD
    {
        Db db = new Db();

        public bool ykategoriekle(Droplist yenikategori)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Kategoriler values (@1,@2)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yenikategori.Kategoriad);
            komut.Parameters.AddWithValue("@2", yenikategori.Kategoriaciklama);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable kategoriliste()
        {
            DataTable dt = new DataTable();

            db.ac();
            SqlCommand komut1 = new SqlCommand("select distinct KategoriID, Ad from Kategoriler", db.baglanti);
            SqlDataAdapter adp1 = new SqlDataAdapter(komut1);
            adp1.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool yhammaddeekle(Droplist yenihammadde)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Hammaddeler values (@1,@2)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yenihammadde.Hammaddead);
            komut.Parameters.AddWithValue("@2", yenihammadde.Hammaddeaciklama);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable hammaddeliste()
        {
            DataTable dt = new DataTable();

            db.ac();
            SqlCommand komut1 = new SqlCommand("select distinct HammaddeID, Ad from Hammaddeler", db.baglanti);
            SqlDataAdapter adp1 = new SqlDataAdapter(komut1);
            adp1.Fill(dt);
            db.kapat();
            return dt;
        }

        public DataTable urunbarkodadliste()
        {
            DataTable dt = new DataTable();

            db.ac();
            SqlCommand komut1 = new SqlCommand("select Barkod,Ad,Gorsel1 from Urunler", db.baglanti);
            SqlDataAdapter adp1 = new SqlDataAdapter(komut1);
            adp1.Fill(dt);
            db.kapat();
            return dt;
        }

    }
}