using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vuudart_website.cs
{
    public class GonderilenMail
    {
        int tur, gonderilentur;
        string gonderilen, konubaslik, mailmesaj, gonderenunvan;
        bool durum;
        DateTime gtarih;

        public int Tur { get => tur; set => tur = value; }
        public int Gonderilentur { get => gonderilentur; set => gonderilentur = value; }
        public string Gonderilen { get => gonderilen; set => gonderilen = value; }
        public string Konubaslik { get => konubaslik; set => konubaslik = value; }
        public string Mailmesaj { get => mailmesaj; set => mailmesaj = value; }
        public string Gonderenunvan { get => gonderenunvan; set => gonderenunvan = value; }
        public bool Durum { get => durum; set => durum = value; }
        public DateTime Gtarih { get => gtarih; set => gtarih = value; }
    }
}