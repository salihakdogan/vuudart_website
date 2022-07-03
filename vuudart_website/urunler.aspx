<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="vuudart_website.urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
	<div class="bg0 m-t-23 p-b-140">
		<div class="container" style="padding-top:100px;">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					
					<a href="urunler.aspx" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						Tüm Ürünler
					</a>

		            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" AutoPostBack="True"></asp:DropDownList>
				
				</div>
					</div>
			</div>

			<div class="row isotope-grid">
				
	   <%if (DropDownList1.SelectedItem.Text == "Kategoriler")
         {%>

			   <%vuudart_website.cs.UrunCRUD tumurunler = new vuudart_website.cs.UrunCRUD();
                 System.Data.DataTable dturunler = new System.Data.DataTable();
				 dturunler = tumurunler.tumurunlistele();%>
				
				
			   <%for (int i = 0; i < dturunler.Rows.Count; i++)
                 {%>

				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="<%="yonetici_arayuz/"+dturunler.Rows[i][5] %>" alt="IMG-PRODUCT">

							<a href="urun_detay.aspx?prmbarkod=<%=dturunler.Rows[i][0] %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								İNCELE
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%=dturunler.Rows[i][1] %>
								</a>

								<span class="stext-105 cl3">
									<%=dturunler.Rows[i][8] %> TL
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
       <%}
         else
         {%>
			   <%vuudart_website.cs.UrunCRUD kategoriurunler = new vuudart_website.cs.UrunCRUD();
                 System.Data.DataTable dtkateurunler= new System.Data.DataTable();
				 dtkateurunler = kategoriurunler.kateurungoster(DropDownList1.SelectedItem.Text);%>

			   <%for (int i = 0; i < dtkateurunler.Rows.Count; i++)
                 {%>


				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="<%="yonetici_arayuz/"+dtkateurunler.Rows[i][5] %>" alt="IMG-PRODUCT">

							<a href="urun_detay.aspx?prmbarkod=<%=dtkateurunler.Rows[i][0] %>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								İNCELE
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%=dtkateurunler.Rows[i][1] %>
								</a>

								<span class="stext-105 cl3">
									<%=dtkateurunler.Rows[i][8] %> TL
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
       <%}%>  
	   		
			</div>

		</div>
	</div>

</asp:Content>
