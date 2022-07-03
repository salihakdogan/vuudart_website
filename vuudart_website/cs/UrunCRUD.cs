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

        public DataTable son3kategori() //son eklenen 3 kategoriyi on yuzdeki default aspx e listeler
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select top 3 * from Kategoriler Order By KategoriID desc", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public DataTable anasayfakateurungoster(string pkategori)
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select * from Urunler where Kategori = @1", db.baglanti);
            goster.Parameters.AddWithValue("@1", pkategori);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public DataTable son12urun() //son eklenen 12 urunu default aspx e listeler
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select top 12 Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod order by Barkod desc", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public DataTable endusuk4urun() //fiyatı en dusuk 4 urunu default aspx e listeler
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select top 4 Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap  from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod order by Fiyat", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public Urun urundetay(string prmbarkod)
        {
            Urun urun = new Urun();
            db.ac();

            SqlCommand komut = new SqlCommand("select Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod and Urunler.Barkod=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", prmbarkod);
            SqlDataReader dr = komut.ExecuteReader();

            while (dr.Read())
            {
                urun.Barkod = dr[0].ToString();
                urun.Ad = dr[1].ToString();
                urun.Kategoriad = dr[2].ToString();
                urun.Hammaddead = dr[3].ToString();
                urun.Aciklama = dr[4].ToString();
                urun.Gorsel1 = dr[5].ToString();
                urun.Gorsel2 = dr[6].ToString();
                urun.Gorsel3 = dr[7].ToString();
                urun.Fiyat = Convert.ToInt16(dr[8]);
                urun.Stokadet = Convert.ToInt16(dr[9]);
                urun.Kdvoran = Convert.ToInt16(dr[10]);
                urun.Kargokg = Convert.ToInt16(dr[11]);           
            }
            db.kapat();
            return urun;
        }

        public Olcu urundetayolcu(string prmbarkod)
        {
            Olcu olcu = new Olcu();
            db.ac();

            SqlCommand komut = new SqlCommand("select Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod and Urunler.Barkod=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", prmbarkod);
            SqlDataReader dr = komut.ExecuteReader();

            while (dr.Read())
            {
                olcu.Genislik = Convert.ToInt16(dr[12]);
                olcu.Uzunluk = Convert.ToInt16(dr[13]);
                olcu.Yukseklik = Convert.ToInt16(dr[14]);
                olcu.Kalinlik = Convert.ToInt16(dr[15]);
                olcu.Yaricap = Convert.ToInt16(dr[16]);
            }
            db.kapat();
            return olcu;
        }

        public DataTable ilgili4urun(string prmkategori) //barkod kategorisine göre ilgili fiyatı en azdan çoka göre 4 ürünü listeler
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select top 4 Urunler.Barkod,Urunler.Ad, Kategoriler.Ad as Kategori, Hammaddeler.Ad as Hammadde, Urunler.Aciklama, Gorsel1, Gorsel2, Gorsel3, Fiyat, StokAdet, KdvOran, KargoKg, Genislik, Uzunluk, Yukseklik, Kalinlik, Yaricap  from Urunler, Kategoriler, Hammaddeler, Olculer where Urunler.Kategori=Kategoriler.KategoriID and Urunler.Hammadde=Hammaddeler.HammaddeID and Urunler.Barkod=Olculer.Barkod and Kategoriler.Ad=@a order by Fiyat", db.baglanti);
            komut.Parameters.AddWithValue("@a", prmkategori);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }
    }
}