﻿<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="vuudart_website.sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- breadcrumb -->
	<div class="container" style="padding-top:100px;">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="default.aspx" class="stext-109 cl8 hov-cl1 trans-04">
				Anasayfa
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Sepet
			</span>
		</div>
	</div>
		
	   <%vuudart_website.cs.SepetCRUD sepeturunler = new vuudart_website.cs.SepetCRUD();
         vuudart_website.cs.UrunCRUD urundetayi = new vuudart_website.cs.UrunCRUD();
         System.Data.DataTable sepetdt = sepeturunler.uyesepetgoster(Session["uyemail"].ToString());%>

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" >
		<div class="container" style="padding-top:50px;">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Ürün Görseli</th>
									<th class="column-2">Ad</th>
									<th class="column-3">Fiyat</th>
									<th class="column-4">Adet</th>
									<th class="column-5">Toplam</th>
								</tr>

       <%for (int i = 0; i < sepetdt.Rows.Count; i++)
         {
			vuudart_website.cs.Urun urunbilgi = new vuudart_website.cs.Urun();
			urunbilgi = urundetayi.urundetay(sepetdt.Rows[i][1].ToString());%>

								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="<%="yonetici_arayuz/"+urunbilgi.Gorsel1 %>" alt="IMG">
										</div>
									</td>
									<td class="column-2"><%=urunbilgi.Ad %></td>
									<td class="column-3"><%=urunbilgi.Fiyat %> TL</td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="<%=sepetdt.Rows[i][2] %>">

											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
									</td>
									<td class="column-5"><%=Convert.ToInt16(urunbilgi.Fiyat) * Convert.ToInt16(sepetdt.Rows[i][2]) %> TL</td>
								</tr>

	   <%}%>

							</table>
						</div>

	   <%vuudart_website.cs.SepetCRUD sepet = new vuudart_website.cs.SepetCRUD();
         System.Data.DataTable dtsepet = new System.Data.DataTable();
         dtsepet = sepet.sepetfiyattoplami((Session["uyemail"]).ToString());%>

						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Kupon Kodu">
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Kodu Onayla
								</div>
							</div>

							<asp:Button ID="Button1" runat="server" Text="Sepeti Güncelle" class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10"/>

						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Toplam Sepet Tutarı
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									Toplam:
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2">
									<%=dtsepet.Rows[0][0] %> TL
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Adres bilgileri:
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
									There are no shipping methods available. Please double check your address, or contact us if you need any help.
								</p>
								
								<div class="p-t-15">
									<span class="stext-112 cl8">
										Calculate Shipping
									</span>

									<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
										<select class="js-select2" name="time">
											<option>Select a country...</option>
											<option>USA</option>
											<option>UK</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>

									<div class="bor8 bg0 m-b-12">
										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="State /  country">
									</div>

									<div class="bor8 bg0 m-b-22">
										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="Postcode / Zip">
									</div>
									
									<div class="flex-w">
										<div class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
											Toplam tutarı güncelle
										</div>
									</div>
										
								</div>
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Toplam:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									<%=dtsepet.Rows[0][0] %> TL
								</span>
							</div>
						</div>

						<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							Ödemeye Geç
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</asp:Content>
