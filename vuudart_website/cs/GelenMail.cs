using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class GelenMail
    {
        string gonderenmail, konubaslik, mailmesaj;
        bool durum;
        DateTime gtarih;

        public string Gonderenmail { get => gonderenmail; set => gonderenmail = value; }
        public string Konubaslik { get => konubaslik; set => konubaslik = value; }
        public string Mailmesaj { get => mailmesaj; set => mailmesaj = value; }
        public bool Durum { get => durum; set => durum = value; }
        public DateTime Gtarih { get => gtarih; set => gtarih = value; }
    }
}