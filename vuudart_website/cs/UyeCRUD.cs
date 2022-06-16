using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace vuudart_website.cs
{
    public class UyeCRUD
    {
        Db db = new Db();

        public bool uyeekle(Uye yeniuye)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Uyeler values(@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yeniuye.Ad);
            komut.Parameters.AddWithValue("@2", yeniuye.Soyad);
            komut.Parameters.AddWithValue("@3", yeniuye.Mail);
            komut.Parameters.AddWithValue("@4", yeniuye.Telefon);
            komut.Parameters.AddWithValue("@5", yeniuye.Sifre);
            komut.Parameters.AddWithValue("@6", yeniuye.Tc);
            komut.Parameters.AddWithValue("@7", yeniuye.Sirket);
            komut.Parameters.AddWithValue("@8", yeniuye.Ulke);
            komut.Parameters.AddWithValue("@9", yeniuye.Sehir);
            komut.Parameters.AddWithValue("@10", yeniuye.Postakod);
            komut.Parameters.AddWithValue("@11", yeniuye.Adres);
            komut.Parameters.AddWithValue("@12", yeniuye.Pfotograf);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable uyelerilistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from Uyeler", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }
    }
}