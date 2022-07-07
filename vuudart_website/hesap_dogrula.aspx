<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="hesap_dogrula.aspx.cs" Inherits="vuudart_website.hesap_dogrula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="icerik">

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('yonetici_arayuz/img/banner_gorsel/banner1.jpg');">
		<h2 class="ltext-105 cl0 txt-center" style="color:#383838;">
			Hesap Doğrula
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">

				<%--hesap doğrula--%>
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="margin-left:auto; margin-right:auto;">
					
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Hesap Doğrula
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox1" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Mail adresi"></asp:TextBox>
							<i class="fa fa-at how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>
						
							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="" runat="server" ErrorMessage="* Mail adresi alanı boş geçilemez!" ControlToValidate="TextBox1" ValidationGroup="giris" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox2" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Doğrulama kodu"></asp:TextBox>
							<i class="fa fa-key how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="" runat="server" ErrorMessage="* Doğrulama kodu alanı boş geçilemez!" ControlToValidate="TextBox2" ValidationGroup="dogrula" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<asp:Button ID="Button1" runat="server" Text="Doğrula" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" OnClick="Button1_Click" ValidationGroup="dogrula"/>

						<h5 class="block1-info stext-102 trans-04 p-t-30" >
								  - Siteye kayıt olduğunuz mail adresini ve gelen doğrulama kodunu giriniz.
								</h5>
						<h5 class="block1-info stext-102 trans-04 p-t-20">
								  - Doğrulama kodunuz spam / gereksiz mail klasörlerine düşmüş olabilir.
								</h5>
						<h5 class="block1-info stext-102 trans-04 p-t-20">
								  - Mail almadıysanız lütfen destek ile iletişime geçin.
								</h5>
					
				</div>
				
			</div>
		</div>
	</section>	

	</form>

</asp:Content>
