using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class UrunCRUD
    {
        Db db = new Db();

        public bool urunekle(Urun yeniurun)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Urunler values(@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yeniurun.Barkod);
            komut.Parameters.AddWithValue("@2", yeniurun.Ad);
            komut.Parameters.AddWithValue("@3", yeniurun.Kategori);
            komut.Parameters.AddWithValue("@4", yeniurun.Hammadde);
            komut.Parameters.AddWithValue("@5", yeniurun.Aciklama);
            komut.Parameters.AddWithValue("@6", yeniurun.Gorsel1);
            komut.Parameters.AddWithValue("@7", yeniurun.Gorsel2);
            komut.Parameters.AddWithValue("@8", yeniurun.Gorsel3);
            komut.Parameters.AddWithValue("@9", yeniurun.Fiyat);
            komut.Parameters.AddWithValue("@10", yeniurun.Stokadet);
            komut.Parameters.AddWithValue("@11", yeniurun.Kdvoran);
            komut.Parameters.AddWithValue("@12", yeniurun.Kargokg);

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