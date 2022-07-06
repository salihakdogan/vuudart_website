<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="vuudart_website.sepet" %>
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
									<th class="" style="text-align:center; background: #EEEEEE;">Ürün Görseli</th>
									<th class="" style="text-align:center; background: #EEEEEE;">Ad</th>
									<th class="" style="text-align:center; background: #EEEEEE; width:100px;">Fiyat</th>
									<th class="" style="text-align:center; background: #EEEEEE; width:100px;">KDV</th>
									<th class="" style="text-align:center; background: #EEEEEE;">Adet</th>									
								</tr>							

       <%for (int i = 0; i < sepetdt.Rows.Count; i++)
         {
			vuudart_website.cs.Urun urunbilgi = new vuudart_website.cs.Urun();
			urunbilgi = urundetayi.urundetay(sepetdt.Rows[i][1].ToString());%>

								<tr>
									<td class="" style="">
										<a href="urun_detay.aspx?prmbarkod=<%=urunbilgi.Barkod %>">
											<div class="how-itemcart1" style="margin:auto;">
												<img src="<%="yonetici_arayuz/"+urunbilgi.Gorsel1 %>" alt="IMG">
											</div>
										</a>										
										
									</td>

									<%double urunkdvadettutar = (Convert.ToDouble(urunbilgi.Fiyat) * Convert.ToDouble(urunbilgi.Kdvoran)) / 100; %>

									<%double toplamfiyaturun = (Convert.ToDouble(urunbilgi.Fiyat) * Convert.ToInt16(sepetdt.Rows[i][2])); %>

									<%double toplamkdvurun = (Convert.ToDouble(sepetdt.Rows[i][2]) * urunkdvadettutar);  %>

									<td class="" style="text-align:center;">
										<a href="urun_detay.aspx?prmbarkod=<%=urunbilgi.Barkod %>">
											<%=urunbilgi.Ad %>
										</a>
									</td>
									
									<td class="" style="text-align:center;"><%=urunbilgi.Fiyat %> TL <br />
										<div style="font-size:12px; opacity:0.6"><%=toplamfiyaturun %> TL</div>
									</td>
									
									<td class="" style="width:160px; text-align:center;"><%=urunkdvadettutar %> TL <br />								
										<div style="font-size:12px; opacity:0.6;"><%=toplamkdvurun %> TL</div>
									</td>	
																																									
									<td>								
											<div class="wrap-num-product flex-w m-l-auto m-r-0" style="margin-top:40px; margin-left:auto; margin-right:10px;">
											
												<a href="sepet.aspx?prmazalturun=<%=Session["azaltılacakurun"] =  urunbilgi.Barkod %>&prmurunadet=<%=sepetdt.Rows[i][2] %>" role="button" class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"><%--1 azalt--%>
													<i class="fs-16 zmdi zmdi-minus"></i>
												</a>
											
												<input disabled class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="<%=sepetdt.Rows[i][2] %>">										

												<a href="sepet.aspx?prmarttirurun=<%=Session["arttirilacakurun"] =  urunbilgi.Barkod %>" role="button" class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"><%--1 arttir--%>
													<i class="fs-16 zmdi zmdi-plus"></i>
												</a>
											
											</div>
										
											<div style="margin:auto; text-align:center; margin-top:10px; margin-right:20px; margin-bottom:15px;">
											<a href="sepet.aspx?prmsilurun=<%=Session["silinecekurun"] =  urunbilgi.Barkod %>" role="button" class="mtext-104 cl3"><%--sil--%>
													<i class="zmdi zmdi-close"></i> Ürünü sil
												</a>
											</div>
									</td>
									
								</tr>
																					
	   <%}%>

							</table>
						</div>

	   <%vuudart_website.cs.SepetCRUD sepet = new vuudart_website.cs.SepetCRUD();
         System.Data.DataTable sepeturunfiyattoplami = new System.Data.DataTable();
         sepeturunfiyattoplami = sepet.sepeturunfiyattoplami((Session["uyemail"]).ToString());
     
         System.Data.DataTable sepetkdvfiyattoplami = new System.Data.DataTable();
		 sepetkdvfiyattoplami = sepet.sepetkdvfiyattoplami((Session["uyemail"]).ToString());
		   	 
		 System.Data.DataTable sepetfiyattoplami = new System.Data.DataTable();
         sepetfiyattoplami = sepet.sepetfiyattoplami((Session["uyemail"]).ToString());%>

						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Kupon Kodu">
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Kodu Onayla
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Sepet Özeti
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">

									

									Ürün fiyat toplam: 
								</span>
							</div>

							<div class="size-209" style="float:left; margin:auto; padding-left:30px">
								<span class="mtext-110 cl2">
									<%=Math.Round(Convert.ToDouble(sepeturunfiyattoplami.Rows[0][0]),2) %>TL
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">

									

									Ürün KDV fiyat toplam: 
								</span>
							</div>

							<div class="size-209" style="float:left; margin:auto; padding-left:30px">
								<span class="mtext-110 cl2">
									<%=Math.Round(Convert.ToDouble(sepetkdvfiyattoplami.Rows[0][0]),2) %>TL
								</span>
							</div>
						</div>
					
						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Genel toplam:
								</span>
							</div>

							<div class="size-209 p-t-1" style="float:left; margin:auto; padding-left:30px">
								<span class="mtext-110 cl2">
								   <%=Math.Round(Convert.ToDouble(sepetfiyattoplami.Rows[0][0]),2) %>TL
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
