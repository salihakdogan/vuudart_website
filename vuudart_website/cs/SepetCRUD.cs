using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class SepetCRUD
    {
        Db db = new Db();

        public bool sepeteekle(string pbarkod, string pmail)
        {
            bool sonuc = false;
            int cevap;

            db.ac();
            //ürün daha önceden eklenmiş mi
            SqlCommand komutara = new SqlCommand("select count(*) from Sepet where UrunBarkod=@bk and UyeMail=@ml", db.baglanti);
            komutara.Parameters.AddWithValue("@ml", pmail);
            komutara.Parameters.AddWithValue("@bk", pbarkod);

            int kaysay = Convert.ToInt16(komutara.ExecuteScalar());

            if (kaysay == 0)//hayır ise
            {
                SqlCommand komut = new SqlCommand("insert into Sepet values(@a, @b, @c, @d, @e)", db.baglanti);

                komut.Parameters.AddWithValue("@a", pbarkod);
                komut.Parameters.AddWithValue("@b", 1);
                komut.Parameters.AddWithValue("@c", pmail);
                komut.Parameters.AddWithValue("@d", 0);
                komut.Parameters.AddWithValue("@e", System.DateTime.Now);


                cevap = komut.ExecuteNonQuery();
                if (cevap == 1)
                {
                    sonuc = true;
                }
            }
            else
            {
                SqlCommand adetarttir = new SqlCommand("update Sepet set UrunAdet=UrunAdet+1 where UyeMail=@a and UrunBarkod=@b", db.baglanti);

                adetarttir.Parameters.AddWithValue("@a", pmail);
                adetarttir.Parameters.AddWithValue("@b", pbarkod);

                cevap = adetarttir.ExecuteNonQuery();

                if (cevap == 1)
                {
                    sonuc = true;
                }
            }
            db.kapat();
            return sonuc;
        }

        public DataTable uyesepetgoster(string pmail)
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Sepet where Durum=0 and UyeMail=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);

            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public int sepetadeturun(string pmail)
        {
            int cesitadet;

            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Sepet where Durum=0 and UyeMail=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);
            cesitadet = Convert.ToInt16(komut.ExecuteScalar());

            db.kapat();
            return cesitadet;
        }

        public DataTable sepetfiyattoplami(string pmail)
        {
            DataTable dt = new DataTable();

            db.ac();

            SqlCommand komut = new SqlCommand("select sum(Fiyat*UrunAdet) from Sepet,Urunler  where Sepet.UrunBarkod = Urunler.Barkod and UyeMail = @a", db.baglanti);
            komut.Parameters.AddWithValue("@a", pmail);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);

            return dt;
        }

        public bool sepetadetarttir(string pbarkod, string pmail)
        {
            bool sonuc = false;
            int cevap;

            db.ac();
            
            SqlCommand adetarttir = new SqlCommand("update Sepet set UrunAdet=UrunAdet+1 where UyeMail=@a and UrunBarkod=@b", db.baglanti);

            adetarttir.Parameters.AddWithValue("@a", pmail);
            adetarttir.Parameters.AddWithValue("@b", pbarkod);

            cevap = adetarttir.ExecuteNonQuery();

            if (cevap == 1)
            {
                sonuc = true;
            }
            
            db.kapat();
            return sonuc;
        }

        public bool sepetadetazalt(string pbarkod, string pmail)
        {
            bool sonuc = false;
            int cevap;

            db.ac();

            SqlCommand adetarttir = new SqlCommand("update Sepet set UrunAdet=UrunAdet-1 where UyeMail=@a and UrunBarkod=@b", db.baglanti);

            adetarttir.Parameters.AddWithValue("@a", pmail);
            adetarttir.Parameters.AddWithValue("@b", pbarkod);

            cevap = adetarttir.ExecuteNonQuery();

            if (cevap == 1)
            {
                sonuc = true;
            }

            db.kapat();
            return sonuc;
        }
    }
}