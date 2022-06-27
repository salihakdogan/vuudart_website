using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class OlcuCRUD
    {
        Db db = new Db();

        public bool olcuekle(Olcu yeniurunolcu)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Olculer values(@1,@2,@3,@4,@5,@6)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yeniurunolcu.Barkod);
            komut.Parameters.AddWithValue("@2", yeniurunolcu.Genislik);
            komut.Parameters.AddWithValue("@3", yeniurunolcu.Uzunluk);
            komut.Parameters.AddWithValue("@4", yeniurunolcu.Yukseklik);
            komut.Parameters.AddWithValue("@5", yeniurunolcu.Kalinlik);
            komut.Parameters.AddWithValue("@6", yeniurunolcu.Yaricap);
            
            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }
    }
}