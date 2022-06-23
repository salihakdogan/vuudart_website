<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="urun_ekle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.urun_ekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="tumsayfa" runat="server">
    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-add-user icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Üye Ekleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada ürün ekleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ürün İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Ürün Ekle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
        
   <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">ÜRÜN BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
               <form>
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="Barkod * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Barkod alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label1" runat="server" Text="Ad * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ad alanı boş bırakılamaz!" ControlToValidate="TextBox2" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>

                   <div class="form-row">
                       


                       <div class="col-md-4">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label3" runat="server" Text="Kategori* "></asp:Label>
                               <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>
                            </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label7" runat="server" Text="Yeni kategori ekle "></asp:Label>
                               <asp:Button ID="yeni_kategori" runat="server" Text="+" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yeni_kategori_Click" ValidationGroup="yk_ekle"/>                   
                            </div>
                       </div>
                             


                       <div class="col-md-4">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label4" runat="server" Text="Hammadde * "></asp:Label>
                               <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label8" runat="server" Text="Yeni hammadde ekle "></asp:Label>
                               <asp:Button ID="yeni_hammadde" runat="server" Text="+" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yeni_hammadde_Click" ValidationGroup="yh_ekle" />                     
                            </div>
                       </div>
                   


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
                               <asp:Button ID="Button2" runat="server" Text="Formu temizle" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="Button2_Click" />
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

           </form>

       </div>

   </div>

</div>

    <div id="yeni_kategori_ekle" runat="server" visible="false">
    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-add-user icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Yeni Kategori Ekleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada yeni kategori ekleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ürün İşlemleri</a></li>
                                                <li class="breadcrumb-item"><a href="urun_ekle.aspx">Ürün Ekle</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Yeni Kategori Ekle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">EKLENECEK KATEGORİ BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
               <form>
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="yk_kateadi_label" runat="server" Text="Ad * "></asp:Label>
                               <asp:RequiredFieldValidator ID="yk_valid_1" runat="server" ErrorMessage="Kategori adı alanı boş bırakılamaz!" ControlToValidate="yk_textbox1" ForeColor="#FF5840" ValidationGroup="yk_ekle"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="yk_textbox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="yk_kateaciklama_label" runat="server" Text="Açıklama * "></asp:Label>
                               <asp:RequiredFieldValidator ID="yk_valid_2" runat="server" ErrorMessage="Kategori açıklaması alanı boş bırakılamaz!" ControlToValidate="yk_textbox2" ForeColor="#FF5840" ValidationGroup="yk_ekle"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="yk_textbox2" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
              
        </div>
                     
       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="yk_kayit_button" runat="server" Text="Kaydet" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yk_kayit_button_Click" ValidationGroup="yk_ekle"/>
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="yk_iptal_button" runat="server" Text="İptal" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="yk_iptal_button_Click"/>
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

           </form>

       </div>

   </div>


    </div>

    <div id="yeni_hammadde_ekle" runat="server" visible="false">
    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-add-user icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Yeni Hammadde Ekleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada yeni hammadde ekleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ürün İşlemleri</a></li>
                                                <li class="breadcrumb-item"><a href="urun_ekle.aspx">Ürün Ekle</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Yeni Hammadde Ekle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">EKLENECEK HAMMADDE BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
               <form>
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="yh_hammaddeadi_label" runat="server" Text="Ad * "></asp:Label>
                               <asp:RequiredFieldValidator ID="yh_valid1" runat="server" ErrorMessage="Hammadde adı alanı boş bırakılamaz!" ControlToValidate="yh_textbox1" ForeColor="#FF5840" ValidationGroup="yh_ekle"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="yh_textbox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="yh_hammaddeaciklama_label" runat="server" Text="Açıklama * "></asp:Label>
                               <asp:RequiredFieldValidator ID="yh_valid2" runat="server" ErrorMessage="Hammadde açıklaması alanı boş bırakılamaz!" ControlToValidate="yh_textbox2" ForeColor="#FF5840" ValidationGroup="yh_ekle"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="yh_textbox2" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
              
        </div>
                     
       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="yh_kayit_button" runat="server" Text="Kaydet" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yh_kayit_button_Click" ValidationGroup="yh_ekle"/>
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="yh_iptal_button" runat="server" Text="İptal" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="yh_iptal_button_Click"/>
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

           </form>

       </div>

   </div>


    </div>

</asp:Content>
