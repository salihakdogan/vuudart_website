using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class Yonetici
    {
        string yoneticitc, ad, soyad, mail, sifre, telefon, pfotograf;
        int unvan;

        public string Yoneticitc { get => yoneticitc; set => yoneticitc = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Soyad { get => soyad; set => soyad = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Sifre { get => sifre; set => sifre = value; }
        public string Telefon { get => telefon; set => telefon = value; }
        public string Pfotograf { get => pfotograf; set => pfotograf = value; }
        public int Unvan { get => unvan; set => unvan = value; }
    }
}