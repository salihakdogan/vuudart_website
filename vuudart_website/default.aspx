<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="vuudart_website._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	   <%vuudart_website.cs.SliderCRUD sliderurunler = new vuudart_website.cs.SliderCRUD();
		 System.Data.DataTable dtslider = new System.Data.DataTable();
		 dtslider = sliderurunler.sliderlistele();%>

    <!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				
	   <%for (int i = 0; i <dtslider.Rows.Count; i++)
		 {%>				
				<div class="item-slick1" style="background-image: url(<%=dtslider.Rows[i][2]%>);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									<%=dtslider.Rows[i][1]%>
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="font-size:40px;">
									<%=dtslider.Rows[i][3]%>
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
								<a href="urun_detay.aspx?prmbarkod=<%=dtslider.Rows[i][0] %>" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									İncele
								</a>
							</div>
						</div>
					</div>
				</div>
	   <%}%>
			</div>
		</div>
		
	</section>


	<!-- Banner -->
	<div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			<div class="row">

	   <%vuudart_website.cs.UrunCRUD son3kate = new vuudart_website.cs.UrunCRUD();
		 System.Data.DataTable dtkate = new System.Data.DataTable();
		 dtkate = son3kate.son3kategori();%>				

	   <%for (int i = 0; i <dtkate.Rows.Count; i++)
		 {%>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="images/banner-01.png" alt="IMG-BANNER">

						<a href="urunler.aspx?kategoriprm=<%=dtkate.Rows[i][0] %>" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									<%=dtkate.Rows[i][1] %>
								</span>

								<span class="block1-info stext-102 trans-04">
									<%=dtkate.Rows[i][2] %>
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">

								<div class="block1-link stext-101 cl0 trans-09">
									İNCELE
								</div>

							</div>
						</a>
					</div>
				</div>

	   <%}%>

			</div>
		</div>
	</div>


	<!-- Son eklenenler -->
	<section class="bg0 p-t-23 p-b-10">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					ÜRÜNLERİ İNCELE
				</h3>
			</div>

			<div class="flex-w flex-sb-m p-b-20">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						Son Eklenenler
					</button>

				</div>

			</div>

			<div class="row isotope-grid">
		
	   <%vuudart_website.cs.UrunCRUD son12liste = new vuudart_website.cs.UrunCRUD();
         System.Data.DataTable dtliste = new System.Data.DataTable();
         dtliste = son12liste.son12urun();%>
	   
	   <%for (int i = 0; i <dtliste.Rows.Count; i++)
         {%>
			
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					
					<!-- Block2 -->
					<div class="block2">
						
						<div class="block2-pic hov-img0" style="width:275px; height:412px; outline-style: solid; outline-color: #D9D9D9; outline-width: thin; position:relative; background-color: #E2E6E8;">
														
							<img src="<%="yonetici_arayuz/"+dtliste.Rows[i][5] %>" alt="IMG-PRODUCT" style="width:100%; height:auto; margin:0; position:absolute; top:50%; -ms-transform:translateY(-50%); transform:translateY(-50%);"/>					
							
							<a href="urun_detay.aspx?prmbarkod=<%=dtliste.Rows[i][0] %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								İNCELE
							</a>
						</div>
							
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="urun_detay.aspx?prmbarkod=<%=dtliste.Rows[i][0] %>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%=dtliste.Rows[i][1] %>
								</a>

								<span class="stext-105 cl3">
									<%=dtliste.Rows[i][8] %> TL
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
	</section>

	<!-- En düşük fiyat -->
	<section class="bg0 p-t-23 p-b-10">
		<div class="container">
			

			<div class="flex-w flex-sb-m p-b-20">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						En düşük fiyat
					</button>

				</div>

			</div>

			<div class="row isotope-grid">


	   <%vuudart_website.cs.UrunCRUD endusuk4liste = new vuudart_website.cs.UrunCRUD();
         System.Data.DataTable dtliste0 = new System.Data.DataTable();
         dtliste0 = endusuk4liste.endusuk4urun();%>
	   
	   <%for (int i = 0; i <dtliste0.Rows.Count; i++)
         {%>
			
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					
					<!-- Block2 -->
					<div class="block2">
						
						<div class="kanvas">
						<div class="block2-pic hov-img0" style="width:275px; height:412px; outline-style: solid; outline-color: #D9D9D9; outline-width: thin; position:relative; background-color: #E2E6E8;">

							<img src="<%="yonetici_arayuz/"+dtliste0.Rows[i][5] %>" alt="IMG-PRODUCT" style="width:100%; height:auto; margin:0; position:absolute; top:50%; -ms-transform:translateY(-50%); transform:translateY(-50%);"/>					

							<a href="urun_detay.aspx?prmbarkod=<%=dtliste0.Rows[i][0] %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								İNCELE
							</a>
						</div>
						</div>	

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="urun_detay.aspx?prmbarkod=<%=dtliste0.Rows[i][0] %>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%=dtliste0.Rows[i][1] %>
								</a>

								<span class="stext-105 cl3">
									<%=dtliste0.Rows[i][8] %> TL
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
	</section>

	<!-- Çok satanlar -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			

			<div class="flex-w flex-sb-m p-b-20">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						Çok Satanlar
					</button>

				</div>

			</div>

			<div class="row isotope-grid">


	   <%--<%vuudart_website.cs.UrunCRUD endusuk4liste = new vuudart_website.cs.UrunCRUD();
         System.Data.DataTable dtliste0 = new System.Data.DataTable();
         dtliste0 = endusuk4liste.endusuk4urun();%>--%>
	   
	   <%for (int i = 0; i <dtliste0.Rows.Count; i++)
         {%>
			
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					
					<!-- Block2 -->
					<div class="block2">
						
						<div class="kanvas">
						   <div class="block2-pic hov-img0" style="width:275px; height:412px; outline-style: solid; outline-color: #D9D9D9; outline-width: thin; position:relative; background-color: #E2E6E8;">

							<img src="<%="yonetici_arayuz/"+dtliste0.Rows[i][5] %>" alt="IMG-PRODUCT" style="width:100%; height:auto; margin:0; position:absolute; top:50%; -ms-transform:translateY(-50%); transform:translateY(-50%);"/>					

							<a href="urun_detay.aspx?prmbarkod=<%=dtliste0.Rows[i][0] %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								İNCELE
							</a>
						</div>
						</div>	

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="urun_detay.aspx?prmbarkod=<%=dtliste0.Rows[i][0] %>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%=dtliste0.Rows[i][1] %>
								</a>

								<span class="stext-105 cl3">
									<%=dtliste0.Rows[i][8] %> TL
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

			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="urunler.aspx" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Tüm Ürünler
				</a>
			</div>
		</div>
	</section>

</asp:Content>
