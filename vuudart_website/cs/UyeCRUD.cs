﻿using System;
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

            SqlCommand komut = new SqlCommand("insert into Uyeler values(@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yeniuye.Kullaniciad);
            komut.Parameters.AddWithValue("@2", yeniuye.Mail);
            komut.Parameters.AddWithValue("@3", yeniuye.Ad);
            komut.Parameters.AddWithValue("@4", yeniuye.Soyad);
            komut.Parameters.AddWithValue("@5", yeniuye.Sifre);   
            komut.Parameters.AddWithValue("@6", yeniuye.Tc);      
            komut.Parameters.AddWithValue("@7", yeniuye.Telefon);                   
            komut.Parameters.AddWithValue("@8", yeniuye.Ulke);
            komut.Parameters.AddWithValue("@9", yeniuye.Sehir);
            komut.Parameters.AddWithValue("@10", yeniuye.Postakod);
            komut.Parameters.AddWithValue("@11", yeniuye.Adres);
            komut.Parameters.AddWithValue("@12", yeniuye.Pfotograf);
            komut.Parameters.AddWithValue("@13", yeniuye.Dkod);
            komut.Parameters.AddWithValue("@14", yeniuye.Durum);
            komut.Parameters.AddWithValue("@15", yeniuye.Mailonay);
           

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
        
        public bool uyesil(string uyeprm)
        {
            bool cevap = true; //silindi
            db.ac();
            SqlCommand silme = new SqlCommand("delete from Uyeler where KullaniciAdi=@1", db.baglanti);
            silme.Parameters.AddWithValue("@1", uyeprm);
            int bilgi = silme.ExecuteNonQuery();

            if (bilgi == 0)
            {
                cevap = false; //silinemedi
            }

            db.kapat();
            return cevap;
        }

        public DataTable uyegoster(string mailprm) //güncelleme işlemi için
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select * from Uyeler where KullaniciAdi=@1", db.baglanti);
            goster.Parameters.AddWithValue("@1", mailprm);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public bool uyeguncelle(Uye uyegoster) //güncelleme işlemi için
        {
            bool cevap = true;
            db.ac();
            SqlCommand guncelle = new SqlCommand("update Uyeler set UyeMail=@a, Ad=@b, Soyad=@c, Sifre=@d, Tc=@e, Telefon=@f, Ulke=@g, Sehir=@h, PostaKod=@i, Adres=@j, Pfotograf=@k where KullaniciAdi=@l", db.baglanti);

            guncelle.Parameters.AddWithValue("@a", uyegoster.Mail);
            guncelle.Parameters.AddWithValue("@b", uyegoster.Ad);
            guncelle.Parameters.AddWithValue("@c", uyegoster.Soyad);
            guncelle.Parameters.AddWithValue("@d", uyegoster.Sifre);
            guncelle.Parameters.AddWithValue("@e", uyegoster.Tc);
            guncelle.Parameters.AddWithValue("@f", uyegoster.Telefon);
            guncelle.Parameters.AddWithValue("@g", uyegoster.Ulke);
            guncelle.Parameters.AddWithValue("@h", uyegoster.Sehir);
            guncelle.Parameters.AddWithValue("@i", uyegoster.Postakod);
            guncelle.Parameters.AddWithValue("@j", uyegoster.Adres);
            guncelle.Parameters.AddWithValue("@k", uyegoster.Pfotograf);
            guncelle.Parameters.AddWithValue("@l", uyegoster.Kullaniciad);

            int donus = guncelle.ExecuteNonQuery();

            if (donus == 0)
            {
                cevap = false;
            }

            db.kapat();
            return cevap;
        }

        public bool uyeeklesite(Uye yeniuye)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Uyeler (KullaniciAdi, UyeMail, Ad, Soyad, Sifre, DKod, Durum, MailOnay) values(@a, @b, @c, @d, @e, @f, @g, @h)", db.baglanti);

            komut.Parameters.AddWithValue("@a", yeniuye.Kullaniciad);
            komut.Parameters.AddWithValue("@b", yeniuye.Mail);
            komut.Parameters.AddWithValue("@c", yeniuye.Ad);
            komut.Parameters.AddWithValue("@d", yeniuye.Soyad);
            komut.Parameters.AddWithValue("@e", yeniuye.Sifre);
            komut.Parameters.AddWithValue("@f", yeniuye.Dkod);
            komut.Parameters.AddWithValue("@g", yeniuye.Durum);
            komut.Parameters.AddWithValue("@h", yeniuye.Mailonay);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }
        public bool uyegirissitemail(string pmail, string psfr)
        {
            bool sonuc;
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Uyeler where UyeMail=@a and Sifre=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);
            komut.Parameters.AddWithValue("@b", psfr);

            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                sonuc = false;
            }
            else
            {
                sonuc = true;
            }
            db.kapat();
            return sonuc;
        }

        public bool dogrulanmisuye(string pmail, string onay)
        {
            bool sonuc;
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Uyeler where UyeMail=@a and Durum=1", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);
            
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                sonuc = false;
            }
            else
            {
                sonuc = true;
            }
            db.kapat();
            return sonuc;
        }

        public DataTable dogrulanmamis(string pmail)
        {
            DataTable dt = new DataTable();
            
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Uyeler where UyeMail=@a and Durum=0", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);


            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public bool dogrula(string pmail, string pkod)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update Uyeler set Durum=1 where UyeMail=@a and DKod=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);
            komut.Parameters.AddWithValue("@b", pkod);

            int kayitsay = komut.ExecuteNonQuery();
            if (kayitsay == 0)
            {
                cevap = false;
            }
            else
            {
                cevap = true;
            }
            db.kapat();

            return cevap;

        }
    }
}