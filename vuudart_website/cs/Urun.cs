using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class Urun
    {
        string barkod, ad, aciklama, gorsel1, gorsel2, gorsel3;
        int kategori, hammadde, fiyat, stokadet, kdvoran, kargokg;
        string kategoriad, hammaddead;

        public string Barkod { get => barkod; set => barkod = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Aciklama { get => aciklama; set => aciklama = value; }
        public string Gorsel1 { get => gorsel1; set => gorsel1 = value; }
        public string Gorsel2 { get => gorsel2; set => gorsel2 = value; }
        public string Gorsel3 { get => gorsel3; set => gorsel3 = value; }
        public int Kategori { get => kategori; set => kategori = value; }
        public int Hammadde { get => hammadde; set => hammadde = value; }
        public int Fiyat { get => fiyat; set => fiyat = value; }
        public int Stokadet { get => stokadet; set => stokadet = value; }
        public int Kdvoran { get => kdvoran; set => kdvoran = value; }
        public int Kargokg { get => kargokg; set => kargokg = value; }
        public string Kategoriad { get => kategoriad; set => kategoriad = value; }
        public string Hammaddead { get => hammaddead; set => hammaddead = value; }
    }
}