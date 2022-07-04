<%@ Page Title="" Language="C#" MasterPageFile="~/vuudart_arayuz.Master" AutoEventWireup="true" CodeBehind="giris_kayit.aspx.cs" Inherits="vuudart_website.giris_kayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
	<form id="icerik">

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Giriş Yap / Kayıt Ol
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">

				<%--giriş yap--%>
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Giriş Yap
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox1" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Mail adresi"></asp:TextBox>
							<i class="fa fa-at how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>
						
							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="" runat="server" ErrorMessage="* Kullanıcı adı veya mail alanı boş geçilemez!" ControlToValidate="TextBox1" ValidationGroup="giris" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox2" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Şifre" TextMode="Password"></asp:TextBox>
							<i class="fa fa-unlock-alt how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="" runat="server" ErrorMessage="* Şifre alanı boş geçilemez!" ControlToValidate="TextBox2" ValidationGroup="giris" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<asp:Button ID="Button1" runat="server" Text="Giriş yap" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" OnClick="Button1_Click" ValidationGroup="giris"/>
					
				</div>


				<%--kayıt ol--%>
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Kayıt ol
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox3" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Kullanıcı Adı"></asp:TextBox>
							<i class="fa fa-at how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="" runat="server" ErrorMessage="* Kullanıcı adı alanı boş geçilemez!" ControlToValidate="TextBox3" ValidationGroup="kayit" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox4" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Mail"></asp:TextBox>
							<i class="fa fa-envelope how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="" runat="server" ErrorMessage="* Mail alanı boş geçilemez!" ControlToValidate="TextBox4" ValidationGroup="kayit" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* Mail adresi yanlış veya formatı hatalı!" ControlToValidate="TextBox4" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox5" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Ad"></asp:TextBox>
							<i class="fa fa-check how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" class="" runat="server" ErrorMessage="* Ad alanı boş geçilemez!" ControlToValidate="TextBox5" ValidationGroup="kayit" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox6" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Soyad"></asp:TextBox>
							<i class="fa fa-check how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator6" class="" runat="server" ErrorMessage="* Soyad alanı boş geçilemez!" ControlToValidate="TextBox6" ValidationGroup="kayit" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox7" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Şifre" TextMode="Password"></asp:TextBox>
							<i class="fa fa-unlock-alt how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator7" class="" runat="server" ErrorMessage="* Şifre alanı boş geçilemez!" ControlToValidate="TextBox7" ValidationGroup="kayit" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="* Şifre en az 6 en fazla 18 karakter içerebilir. En az bir küçük, bir büyük, bir özel karakter içermelidir." ValidationExpression='^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{6,16}$' ControlToValidate="TextBox7" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RegularExpressionValidator>
							</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<asp:TextBox ID="TextBox8" runat="server" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="Şifre tekrarı" TextMode="Password"></asp:TextBox>
							<i class="fa fa-unlock-alt how-pos4 pointer-none" aria-hidden="true" alt="ICON"></i>
						</div>

							<div class="m-b-20">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator8" class="" runat="server" ErrorMessage="* Şifre tekrarı alanı boş geçilemez!" ControlToValidate="TextBox8" ValidationGroup="kayit" Display="Dynamic" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small"></asp:RequiredFieldValidator>
								<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler uyuşmuyor!" ForeColor="#6f81e7" Font-Italic="False" Font-Size="Small" ControlToCompare="TextBox7" ControlToValidate="TextBox8" Display="Dynamic"></asp:CompareValidator>
							</div>

						<asp:Button ID="Button2" runat="server" Text="Kayıt ol" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" OnClick="Button2_Click" ValidationGroup="kayit"/>
					
				</div>
			</div>
		</div>
	</section>	

	</form>
	
</asp:Content>
