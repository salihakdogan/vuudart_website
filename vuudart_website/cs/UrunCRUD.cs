using System;
using System.Collections.Generic;
using System.Data;
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
        public DataTable urunlerilistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from Urunler", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public DataTable tumurunlistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public bool urunsil(string urunprm)
        {
            bool cevap = true; //silindi
            db.ac();
            SqlCommand silme = new SqlCommand("delete from Urunler where Barkod=@1", db.baglanti);
            silme.Parameters.AddWithValue("@1", urunprm);
            int bilgi = silme.ExecuteNonQuery();

            if (bilgi == 0)
            {
                cevap = false; //silinemedi
            }

            db.kapat();
            return cevap;
        }

        public DataTable urungoster(string barkodprm) //güncelleme işlemi için
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select Urunler.Barkod, Ad, Kategori, Hammadde, Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap  from Urunler, Olculer where Olculer.Barkod = Urunler.Barkod and Urunler.Barkod=@1", db.baglanti);
            goster.Parameters.AddWithValue("@1", barkodprm);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public bool urunguncelle(Urun urungoster) //güncelleme işlemi için
        {
            bool cevap = true;
            db.ac();
            SqlCommand guncelle = new SqlCommand("update Urunler set Ad=@a, Kategori=@b, Hammadde=@c, Aciklama=@d, Gorsel1=@e, Gorsel2=@f, Gorsel3=@g, Fiyat=@h, StokAdet=@i, KdvOran=@j, KargoKg=@k where Barkod=@l", db.baglanti);

            guncelle.Parameters.AddWithValue("@a", urungoster.Ad);
            guncelle.Parameters.AddWithValue("@b", urungoster.Kategori);
            guncelle.Parameters.AddWithValue("@c", urungoster.Hammadde);
            guncelle.Parameters.AddWithValue("@d", urungoster.Aciklama);
            guncelle.Parameters.AddWithValue("@e", urungoster.Gorsel1);
            guncelle.Parameters.AddWithValue("@f", urungoster.Gorsel2);
            guncelle.Parameters.AddWithValue("@g", urungoster.Gorsel3);
            guncelle.Parameters.AddWithValue("@h", urungoster.Fiyat);
            guncelle.Parameters.AddWithValue("@i", urungoster.Stokadet);
            guncelle.Parameters.AddWithValue("@j", urungoster.Kdvoran);
            guncelle.Parameters.AddWithValue("@k", urungoster.Kargokg);
            guncelle.Parameters.AddWithValue("@l", urungoster.Barkod);

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