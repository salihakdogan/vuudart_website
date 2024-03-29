﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class Sorgular
    {
        Db db = new Db();

        public bool kadikullanimdami(string pkadi)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Uyeler where KullaniciAdi=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", pkadi);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool mailkullanimdami(string pmail)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Uyeler where UyeMail=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", pmail);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool telefonkullanimdami(string ptelefon)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Uyeler where Telefon=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", ptelefon);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }
        public bool tckullanimdami(string ptc)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Uyeler where Tc=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", ptc);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool barkodkullanimdami(string pbarkod)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Urunler where Barkod=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", pbarkod);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool ymailkullanimdami(string pmail)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Yoneticiler where Mail=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", pmail);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool ytelefonkullanimdami(string ptelefon)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Yoneticiler where Telefon=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", ptelefon);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }
        public bool ytckullanimdami(string ptc)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Yoneticiler where YoneticiTc=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", ptc);

            int kytsayi = Convert.ToInt16(komut.ExecuteScalar());

            if (kytsayi == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }
    }
}