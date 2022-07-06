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

        public DataTable yoneticigoster(string mailprm)
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select YoneticiTc, Ad, Soyad, Mail, Sifre, Telefon, Unvanlar.Unvan, Pfotograf from Yoneticiler,Unvanlar where Yoneticiler.Unvan=Unvanlar.UnvanId and Mail=@1", db.baglanti);
            goster.Parameters.AddWithValue("@1", mailprm);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
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
    }
}