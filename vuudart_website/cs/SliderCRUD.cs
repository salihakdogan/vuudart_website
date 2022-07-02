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
    }
}