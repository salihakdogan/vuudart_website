using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class Uye
    {
        string kullaniciad, mail, ad, soyad, sifre, tc, telefon, ulke, sehir, postakod, adres, pfotograf, dkod;        
        int durum;

        public string Kullaniciad { get => kullaniciad; set => kullaniciad = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Soyad { get => soyad; set => soyad = value; }
        public string Sifre { get => sifre; set => sifre = value; }
        public string Tc { get => tc; set => tc = value; }
        public string Telefon { get => telefon; set => telefon = value; }
        public string Ulke { get => ulke; set => ulke = value; }
        public string Sehir { get => sehir; set => sehir = value; }
        public string Postakod { get => postakod; set => postakod = value; }
        public string Adres { get => adres; set => adres = value; }
        public string Pfotograf { get => pfotograf; set => pfotograf = value; }
        public string Dkod { get => dkod; set => dkod = value; }
        public int Durum { get => durum; set => durum = value; }
    }
}