<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="urun_detay.aspx.cs" Inherits="vuudart_website.urun_detay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<!-- breadcrumb -->
	
	   <%vuudart_website.cs.UrunCRUD urundetayCRUD = new vuudart_website.cs.UrunCRUD();
         vuudart_website.cs.Urun urunbilgi = new vuudart_website.cs.Urun();
         urunbilgi = urundetayCRUD.urundetay(Request.QueryString[0]);%>	

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">

		<div class="container p-b-35">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="default.aspx" class="stext-109 cl8 hov-cl1 trans-04">
				Anasayfa
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="#" class="stext-109 cl8 hov-cl1 trans-04">
				<%=urunbilgi.Kategoriad %>
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				<%=urunbilgi.Ad %>
			</span>
		</div>
	</div>

		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="<%="yonetici_arayuz/"+urunbilgi.Gorsel1 %>">
									<div class="wrap-pic-w pos-relative">
										<img src="<%="yonetici_arayuz/"+urunbilgi.Gorsel1 %>" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="<%="yonetici_arayuz/"+urunbilgi.Gorsel1 %>">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="<%="yonetici_arayuz/"+urunbilgi.Gorsel2 %>">
									<div class="wrap-pic-w pos-relative">
										<img src="<%="yonetici_arayuz/"+urunbilgi.Gorsel2 %>" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="<%="yonetici_arayuz/"+urunbilgi.Gorsel2 %>">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="<%="yonetici_arayuz/"+urunbilgi.Gorsel3 %>">
									<div class="wrap-pic-w pos-relative">
										<img src="<%="yonetici_arayuz/"+urunbilgi.Gorsel3 %>" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="<%="yonetici_arayuz/"+urunbilgi.Gorsel3 %>">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							<%=urunbilgi.Ad %>
						</h4>

						<span class="mtext-106 cl2">
							<%=urunbilgi.Fiyat %> TL
						</span>

						<p class="stext-102 cl3 p-t-23">
							<%=urunbilgi.Aciklama %><br />
							Stok: <%=urunbilgi.Stokadet %><br />
							KDV oranı: %<%=urunbilgi.Kdvoran %><br />
							Barkod: <%=urunbilgi.Barkod %><br />
						</p>
						
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>

									<%if (Session["uyegirisi"]!=null)
                                      {%>
											
											
											
											<a href="sepet.aspx?prmurun=<%=urunbilgi.Barkod %>" class="btn flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
												Sepete Ekle
											</a>

                                    <%}else
                                      {%>
	                                        <a class="btn flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" runat="server" onserverclick="Button1_Click">
												Sepete Ekle
											</a>
											
									        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" Visible="false"/>

									<%}%>
								
								</div>
							</div>	
						</div>

						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Favorilere Ekle">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">Ürün Açıklaması</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">Detaylı Bilgi</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">İncelemeler (1)</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									<%=urunbilgi.Aciklama %>
								</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										
	   <%vuudart_website.cs.UrunCRUD urundetayCRUD0 = new vuudart_website.cs.UrunCRUD();
         vuudart_website.cs.Olcu urunbilgi0 = new vuudart_website.cs.Olcu();
         urunbilgi0 = urundetayCRUD0.urundetayolcu(Request.QueryString[0]);%>	


										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Kategori
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi.Kategoriad %>
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Hammadde
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi.Hammaddead %>
											</span>
										</li>

										<%if (urunbilgi0.Genislik != 0)
                                          {%>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Genişlik
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi0.Genislik %> cm
											</span>
										</li>

                                        <%}%>

										<%if (urunbilgi0.Uzunluk != 0)
                                          {%>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Uzunluk
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi0.Uzunluk %> cm
											</span>
										</li>

                                        <%}%>

										<%if (urunbilgi0.Yukseklik != 0)
                                          {%>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Yükseklik
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi0.Yukseklik %> cm
											</span>
										</li>

                                        <%}%>

										<%if (urunbilgi0.Kalinlik != 0)
                                          {%>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Kalınlık
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi0.Kalinlik %> cm
											</span>
										</li>

                                        <%}%>

										<%if (urunbilgi0.Yaricap != 0)
                                          {%>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Yarıçap
											</span>

											<span class="stext-102 cl6 size-206">
												<%=urunbilgi0.Yaricap %> cm
											</span>
										</li>

                                        <%}%>
																	
									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="images/avatar-01.jpg" alt="AVATAR">
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														Ariana Grande
													</span>

													<span class="fs-18 cl11">
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star-half"></i>
													</span>
												</div>

												<p class="stext-102 cl6">
													Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
												</p>
											</div>
										</div>
										
										<!-- Add review -->
										<form class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>

											<p class="stext-102 cl6">
												Your email address will not be published. Required fields are marked *
											</p>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													Your Rating
												</span>

												<span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
												</div>
											</div>

											<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Submit
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				Barkod: <%=urunbilgi.Barkod %>
			</span>

			<span class="stext-107 cl6 p-lr-25">
				Kategori: <%=urunbilgi.Kategoriad %>
			</span>
		</div>
	</section>


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					İlgili Ürünler
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">


       <%vuudart_website.cs.UrunCRUD ilgili4urun = new vuudart_website.cs.UrunCRUD();
		 System.Data.DataTable dt4urun = new System.Data.DataTable();
		 dt4urun = ilgili4urun.ilgili4urun(urunbilgi.Kategoriad);%>

					
	   <%for (int i = 0; i < dt4urun.Rows.Count; i++)
         {%>			
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="<%="yonetici_arayuz/"+dt4urun.Rows[i][5] %>" alt="IMG-PRODUCT">

								<a href="urun_detay.aspx?prmbarkod=<%=dt4urun.Rows[i][0] %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
									İNCELE
								</a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										<%=dt4urun.Rows[i][1] %>
									</a>

									<span class="stext-105 cl3">
										<%=dt4urun.Rows[i][8] %> TL
									</span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>
						</div>
					</div>
	   <%}%>

					
				</div>
			</div>
		</div>
	</section>

</asp:Content>
