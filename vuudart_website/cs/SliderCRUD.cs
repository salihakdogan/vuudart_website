using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace vuudart_website.cs
{
    public class SliderCRUD
    {
        Db db = new Db();
        public DataTable sliderlistele()
        {
            DataTable dt = new DataTable();
            SqlCommand komut = new SqlCommand("select Slider.Barkod,Baslik,SliderGorsel,Urunler.Ad,Kategoriler.Ad as Kategori, Fiyat,StokAdet from Slider,Urunler,Kategoriler where Urunler.Barkod = Slider.Barkod and Urunler.Kategori =Kategoriler.KategoriID", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public bool slidergorselekle(Slider yeniurun)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Slider values(@1,@2,@3)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yeniurun.Barkod);
            komut.Parameters.AddWithValue("@2", yeniurun.Baslik);
            komut.Parameters.AddWithValue("@3", yeniurun.Slidergorsel);

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