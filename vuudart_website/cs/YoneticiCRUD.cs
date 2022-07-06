using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class YoneticiCRUD
    {
        Db db = new Db();

        public bool yoneticigiris(string ymail, string ysfr)
        {
            bool sonuc;
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select * from Yoneticiler where Mail=@a and Sifre=@b", db.baglanti);

            komut.Parameters.AddWithValue("@a", ymail);
            komut.Parameters.AddWithValue("@b", ysfr);

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

        public bool yoneticiekle(Yonetici yeniyonetici)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into Yoneticiler values(@1,@2,@3,@4,@5,@6,@7,@8)", db.baglanti);

            komut.Parameters.AddWithValue("@1", yeniyonetici.Yoneticitc);
            komut.Parameters.AddWithValue("@2", yeniyonetici.Ad);
            komut.Parameters.AddWithValue("@3", yeniyonetici.Soyad);
            komut.Parameters.AddWithValue("@4", yeniyonetici.Mail);
            komut.Parameters.AddWithValue("@5", yeniyonetici.Sifre);
            komut.Parameters.AddWithValue("@6", yeniyonetici.Telefon);
            komut.Parameters.AddWithValue("@7", yeniyonetici.Unvan);
            komut.Parameters.AddWithValue("@8", yeniyonetici.Pfotograf);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable tumyoneticilistele()
        {
            DataTable dt = new DataTable();
            db.ac();

            SqlCommand komut = new SqlCommand("select YoneticiTc, Ad, Soyad, Mail, Telefon, Unvanlar.Unvan, Pfotograf from Yoneticiler, Unvanlar where Yoneticiler.Unvan = Unvanlar.UnvanId ", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);

            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public bool yoneticisil(string yoneticiprm)
        {
            bool cevap = true; //silindi
            db.ac();
            SqlCommand silme = new SqlCommand("delete from Yoneticiler where YoneticiTc=@1", db.baglanti);
            silme.Parameters.AddWithValue("@1", yoneticiprm);
            int bilgi = silme.ExecuteNonQuery();

            if (bilgi == 0)
            {
                cevap = false; //silinemedi
            }

            db.kapat();
            return cevap;
        }

        public DataTable yoneticigoster(string tcprm)
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select * from Yoneticiler where YoneticiTc=@a", db.baglanti);
            goster.Parameters.AddWithValue("@a", tcprm);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }

        public bool yoneticiguncelle(Yonetici yoneticigoster) //güncelleme işlemi için
        {
            bool cevap = true;
            db.ac();
            SqlCommand guncelle = new SqlCommand("update Yoneticiler set Ad=@a, Soyad=@b, Mail=@c, Sifre=@d, Telefon=@e, Unvan=@f, Pfotograf=@g where YoneticiTc=@h", db.baglanti);

            guncelle.Parameters.AddWithValue("@a", yoneticigoster.Ad);
            guncelle.Parameters.AddWithValue("@b", yoneticigoster.Soyad);
            guncelle.Parameters.AddWithValue("@c", yoneticigoster.Mail);
            guncelle.Parameters.AddWithValue("@d", yoneticigoster.Sifre);
            guncelle.Parameters.AddWithValue("@e", yoneticigoster.Telefon);
            guncelle.Parameters.AddWithValue("@f", yoneticigoster.Unvan);
            guncelle.Parameters.AddWithValue("@g", yoneticigoster.Pfotograf);
            guncelle.Parameters.AddWithValue("@h", yoneticigoster.Yoneticitc);
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