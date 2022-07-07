<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="vuudart_website.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			İletişim
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					<form>
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Bize mail gönderin
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox1" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Mail adresiniz"></asp:TextBox>
							<%--<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email" placeholder="Mail adresiniz">--%>
							<img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox2" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Konu başlığınız"></asp:TextBox>
							<%--<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email" placeholder="Mail adresiniz">--%>
							<img class="how-pos4 pointer-none" src="images/icons/icon-heart-01.png" alt="ICON">
						</div>

						<div class="bor8 m-b-30">
							<%--<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="Size nasıl yardımcı olabiliriz?"></textarea>--%>
							<asp:TextBox ID="TextBox3" runat="server" class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" placeholder="Size nasıl yardımcı olabiliriz?" TextMode="MultiLine" ></asp:TextBox>
						</div>

							<asp:Button ID="Button1" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" runat="server" Text="Gönder" OnClick="Button1_Click" />
						<%--<button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							Gönder
						</button>--%>
					</form>
				</div>

				<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Adres
							</span>

							<p class="stext-115 cl6 size-213 p-t-18">
								Coza Store Center 8th floor, 379 Hudson St, New York, NY 10018 US
							</p>
						</div>
					</div>

					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Arayın
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								+1 800 1236879
							</p>
						</div>
					</div>

					<div class="flex-w w-full">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Destek
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								vuudart@vuudart.site
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	

</asp:Content>
