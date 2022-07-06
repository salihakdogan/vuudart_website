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

        public bool slidersil(string prmbarkod)
        {
            bool cevap = true; //silindi
            db.ac();
            SqlCommand silme = new SqlCommand("delete from Slider where Barkod=@1", db.baglanti);
            silme.Parameters.AddWithValue("@1", prmbarkod);
            int bilgi = silme.ExecuteNonQuery();

            if (bilgi == 0)
            {
                cevap = false; //silinemedi
            }

            db.kapat();
            return cevap;
        }

        public DataTable slidergoster(string prmbarkod) //güncelleme işlemi için
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select * from Slider where Barkod=@1", db.baglanti);
            goster.Parameters.AddWithValue("@1", prmbarkod);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public bool sliderguncelle(Slider slidergoster) //güncelleme işlemi için
        {
            bool cevap = true;
            db.ac();
            SqlCommand guncelle = new SqlCommand("update Slider set Baslik=@a, SliderGorsel=@b where Barkod=@c", db.baglanti);
         
            guncelle.Parameters.AddWithValue("@a", slidergoster.Baslik);
            guncelle.Parameters.AddWithValue("@b", slidergoster.Slidergorsel);
            guncelle.Parameters.AddWithValue("@c", slidergoster.Barkod);

            int donus = guncelle.ExecuteNonQuery();

            if (donus == 0)
            {
                cevap = false;
            }

            db.kapat();
            return cevap;
        }
    }
}