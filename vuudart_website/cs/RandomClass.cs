using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace vuudart_website.cs
{
    public class RandomClass
    {
        Random rnd;
        public RandomClass()
        {
            rnd = new Random();
        }

        // rastgele sayı üret 
        public int RastgeleSayi(int min, int max)
        {
            return rnd.Next(min, max);
        }

        //rastgele harf üretme
        public string RasteleHarf(int boyut, bool kucukHarf)
        {
            string harfler = "";
            int sayi, min = 65;
            char harf;

            if (kucukHarf)
            {
                min = 97;
            }

            for (int i = 0; i < boyut; i++)
            {
                sayi = rnd.Next(min, min + 25); //sayi değişkenine rastgele bir sayı atar.
                harf = Convert.ToChar(sayi);//rastgele bir harf üretir
                harfler += harf;
            }
            return harfler;
        }

        //şifre üretme
        public string sifreUret() //bir harf, bir sayı örüntüsü olmak üzere 6 karakterli bir kod oluşturur
        {

            Random rnd = new Random();
            StringBuilder builder = new StringBuilder();
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            return builder.ToString();
        }

        public string kodUret11() //bir harf, bir sayı örüntüsü olmak üzere 11 karakterli bir kod oluşturur
        {

            Random rnd = new Random();
            StringBuilder builder = new StringBuilder();
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            builder.Append(rnd.Next(1, 9));
            builder.Append(RasteleHarf(1, false));
            return builder.ToString();
        }
    }
}