using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class Olcu
    {
        string barkod;
        int genislik, uzunluk, yukseklik, kalinlik, yaricap;

        public string Barkod { get => barkod; set => barkod = value; }
        public int Genislik { get => genislik; set => genislik = value; }
        public int Uzunluk { get => uzunluk; set => uzunluk = value; }
        public int Yukseklik { get => yukseklik; set => yukseklik = value; }
        public int Kalinlik { get => kalinlik; set => kalinlik = value; }
        public int Yaricap { get => yaricap; set => yaricap = value; }
    }
}