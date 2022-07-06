<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="yonetici_ekle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.yonetici_ekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="tumsayfaform">

        <div id="tumsayfa" runat="server">

    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-magic-wand icon-gradient bg-grow-early">
                                    </i>
                                </div>
                                <div>
                                    Yönetici Ekleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada yönetici ekleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Yönetici İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Yönetici Ekle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
        
    <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">YÖNETİCİ BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
               
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="TC kimlik numarası * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tc kimlik numarası alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control" MaxLength="11"></asp:TextBox>
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
                               <asp:TextBox ID="TextBox5" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Şifre en az 6 en fazla 18 karakter içerebilir. En az bir küçük, bir büyük, bir özel karakter içermelidir." ValidationExpression='^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{6,16}$' ControlToValidate="TextBox5" Display="Dynamic" ForeColor="#FF5840"></asp:RegularExpressionValidator>

                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label6" runat="server" Text="Şifre tekrarı * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Şifre tekrarı alanı boş bırakılamaz!" ControlToValidate="TextBox6" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler uyuşmuyor!" ForeColor="#FF5840" ControlToCompare="TextBox5" ControlToValidate="TextBox6" Display="Dynamic"></asp:CompareValidator>
                               <asp:TextBox ID="TextBox6" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
         
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label7" runat="server" Text="Telefon numarası * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Telefon alanı boş bırakılamaz!" ControlToValidate="TextBox7" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox7" runat="server" class="form-control" MaxLength="11" ></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label8" runat="server" Text="Ünvan * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Ünvan seçim alanı boş bırakılamaz!" ControlToValidate="DropDownList1" InitialValue="0" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                         <div class="input-group">
                               <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>
                         <div class="input-group-append">
                              <asp:Button ID="yeni_unvan" runat="server" Text="Yeni Ekle +" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yeni_unvan_Click" ValidationGroup="yk_ekle" Visible="false"/>
                              <button class="btn btn-outline-success" runat="server" type="button" onserverclick="yeni_unvan_Click" ValidationGroup="yu_ekle" style="font-size:13px;"><i class="fa fa-plus"></i> Yeni ekle</button>
                         </div>
                         </div>
                           </div>
                       </div>
                               
                   </div>

                   <div class="form-row">

                     <div class="col-md-4"></div>

                    <div class="col-md-4">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label9" runat="server" Text="Profil fotoğrafı"></asp:Label>
                               <asp:FileUpload ID="FileUpload1" runat="server" class="form-control-file" />
                           </div>
                       </div>

                    <div class="col-md-4"></div>

                   </div>
                    
        </div>
               
       

       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button1" runat="server" Text="Bilgileri kaydet" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="Button1_Click" />
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button2" runat="server" Text="Formu temizle" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="Button2_Click" ValidationGroup="temizle" />
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

       </div>

   </div>

        </div>

    <div id="yeni_unvan_ekle" runat="server" visible="false">
    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-add-user icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Yeni Ünvan Ekleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada yeni ünvan ekleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Yönetici İşlemleri</a></li>
                                                <li class="breadcrumb-item"><a href="yonetici_ekle.aspx">Yönetici Ekle</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Yeni ünvan Ekle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">EKLENECEK ÜNVAN BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="yu_unvan_label" runat="server" Text="Ünvan * "></asp:Label>
                               <asp:RequiredFieldValidator ID="yk_valid_1" runat="server" ErrorMessage="Ünvan alanı boş bırakılamaz!" ControlToValidate="yu_textbox1" ForeColor="#FF5840" ValidationGroup="yu_ekle"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="yu_textbox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="yu_unvanaciklama_label" runat="server" Text="Açıklama * "></asp:Label>
                               <asp:RequiredFieldValidator ID="yk_valid_2" runat="server" ErrorMessage="Ünvan açıklaması alanı boş bırakılamaz!" ControlToValidate="yu_textbox2" ForeColor="#FF5840" ValidationGroup="yu_ekle"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="yu_textbox2" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
              
        </div>
                     
       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="yu_kayit_button" runat="server" Text="Kaydet" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yu_kayit_button_Click" ValidationGroup="yu_ekle"/>
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="yu_iptal_button" runat="server" Text="İptal" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="yu_iptal_button_Click"/>
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

       </div>

   </div>


    </div>

    </form>

</asp:Content>
