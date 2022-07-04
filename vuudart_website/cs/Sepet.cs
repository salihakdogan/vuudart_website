using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class Sepet
    {
        string sepetid, urunbarkod, urunadet, uyemail;
        bool durum;
        DateTime eklemetarih;

        public string Sepetid { get => sepetid; set => sepetid = value; }
        public string Urunbarkod { get => urunbarkod; set => urunbarkod = value; }
        public string Urunadet { get => urunadet; set => urunadet = value; }
        public string Uyemail { get => uyemail; set => uyemail = value; }
        public bool Durum { get => durum; set => durum = value; }
        public DateTime Eklemetarih { get => eklemetarih; set => eklemetarih = value; }
    }
}