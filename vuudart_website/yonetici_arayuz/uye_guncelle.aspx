<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="uye_guncelle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.uye_guncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-user icon-gradient bg-plum-plate">
                                    </i>
                                </div>
                                <div>
                                    Üye Güncelleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada seçilen üyenin bilgilerini güncelleyebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Üye İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Üye Güncelle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
        
   <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">ÜYE BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
               <%--<form>--%>
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="Kullanıcı adı * "></asp:Label>
                               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kullanıcı adı alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>--%>
                               <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control" Enabled="false"></asp:TextBox>--%>
                               <input id="TextBoxKadi" class="form-control" disabled="disabled" runat="server" value="">
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label1" runat="server" Text="Mail * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mail alanı boş bırakılamaz!" ControlToValidate="TextBox2" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mail adresi yanlış veya formatı hatalı!" ControlToValidate="TextBox2" ForeColor="#FF5840" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                               <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="ornek@mail.com"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>

                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label3" runat="server" Text="Ad * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ad alanı boş bırakılamaz!" ControlToValidate="TextBox3" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label4" runat="server" Text="Soyad * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Soyad alanı boş bırakılamaz!" ControlToValidate="TextBox4" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>

                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label5" runat="server" Text="Şifre * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Şifre alanı boş bırakılamaz!" ControlToValidate="TextBox5" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler uyuşmuyor!" ForeColor="#FF5840" ControlToCompare="TextBox6" ControlToValidate="TextBox5" Display="Dynamic"></asp:CompareValidator>
                               <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Şifre en az 6 en fazla 18 karakter içerebilir. En az bir küçük, bir büyük, bir özel karakter içermelidir." ValidationExpression='^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{6,16}$' ControlToValidate="TextBox5" Display="Dynamic" ForeColor="#FF5840"></asp:RegularExpressionValidator>

                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label6" runat="server" Text="Şifre tekrarı * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Şifre tekrarı alanı boş bırakılamaz!" ControlToValidate="TextBox6" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
         
        </div>
               
       <div class="card-body">

           <h5 class="card-title">SİPARİŞ BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olmayan alanlar.)</h7></p>
           </div>             
                                                                        
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label7" runat="server" Text="TC Kimlik Numarası"></asp:Label>
                               <asp:TextBox ID="TextBox7" runat="server" class="form-control" MaxLength="11"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label8" runat="server" Text="Telefon numarası"></asp:Label>
                               <asp:TextBox ID="TextBox8" runat="server" class="form-control" MaxLength="11" placeholder="05xxxxxxxxx"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
                   
                   <div class="form-row">                 
                       
                        <div class="col-md-4">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label9" runat="server" Text="Ülke"></asp:Label>
                               <asp:TextBox ID="TextBox9" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>

                       <div class="col-md-4">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label10" runat="server" Text="Şehir"></asp:Label>
                               <asp:TextBox ID="TextBox10" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>

                       <div class="col-md-4">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label11" runat="server" Text="Posta Kodu"></asp:Label>
                               <asp:TextBox ID="TextBox11" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                                                           
                   </div>
                   
                   <div class="form-row">
                       
                       <div class="col-md-12">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label12" runat="server" Text="Adres"></asp:Label>
                               <asp:TextBox ID="TextBox12" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div>
                       </div>
                             
                   </div>

                   <div class="form-row">

                       <div class="col-md-12">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label13" runat="server" Text="Profil Fotoğrafı"></asp:Label>
                               <asp:FileUpload ID="FileUpload1" runat="server" class="form-control-file" />
                               <small class="form-text text-muted">Maksimum 3mb büyüklüğünde ve 150px x 150px genişliğinde görsel yükleyebilirsin.</small>
                            </div>
                       </div>

                   </div>

               
       </div>

       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button1" runat="server" Text="Bilgileri güncelle" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="Button1_Click" />
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button2" runat="server" Text="Yeni bilgileri sil" CssClass="mb-2 mr-2 btn btn-info btn-block" OnClick="Button2_Click" />
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

           <%--</form>--%>

       </div>

   </div>

</asp:Content>
