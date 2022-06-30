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

        //public DataTable urunolcugoster(string barkodprm) //güncelleme işlemi için
        //{
        //    DataTable gdt = new DataTable();
        //    db.ac();

        //    SqlCommand goster = new SqlCommand("select Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod and Urunler.Barkod=@1", db.baglanti);
        //    goster.Parameters.AddWithValue("@1", barkodprm);
        //    SqlDataAdapter adp = new SqlDataAdapter(goster);
        //    adp.Fill(gdt);

        //    db.kapat();
        //    return gdt;
        //}

        public bool urunolcuguncelle(Olcu olcugoster)
        {
            bool cevap = true;
            db.ac();
            SqlCommand guncelle = new SqlCommand("update Olculer set Genislik=@a, Uzunluk=@b, Yukseklik=@c, Kalinlik=@d, Yaricap=@e where Barkod=@f", db.baglanti);

            guncelle.Parameters.AddWithValue("@a", olcugoster.Genislik);
            guncelle.Parameters.AddWithValue("@b", olcugoster.Uzunluk);
            guncelle.Parameters.AddWithValue("@c", olcugoster.Yukseklik);
            guncelle.Parameters.AddWithValue("@d", olcugoster.Kalinlik);
            guncelle.Parameters.AddWithValue("@e", olcugoster.Yaricap);
            guncelle.Parameters.AddWithValue("@f", olcugoster.Barkod);

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