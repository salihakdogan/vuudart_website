using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class SorgularCRUD
    {
        Db db = new Db();
        public bool mailkullanimdami(string pmail) /*mail kullanimda mi? sorgusu*/
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

        public bool telefonkullanimdami(string ptelefon) /*mail kullanimda mi? sorgusu*/
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
        public bool tckullanimdami(string ptc) /*mail kullanimda mi? sorgusu*/
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
    }
}