﻿<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="slider_gorsel_ekle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.slider_gorsel_ekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="tumsayfaform">
    
    <div id="tumsayfa" runat="server">
    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-paint icon-gradient bg-grow-early">
                                    </i>
                                </div>
                                <div>
                                    Slider Görseli Ekleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada slider görseli ekleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Site Arayüzü İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Slider Görsel Ekle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
        
   <div class="main-card mb-3 card">
       
       <div class="card-body">

         <h5 class="card-title">GÖRSEL EKLEME TALİMATLARI</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Butona tıklayıp talimatları okuyabilirsiniz.)</h7></p>
           </div>

           <div id="exampleAccordion" data-children=".item">
                                                
                                                <div class="item">
                                                    <button type="button" aria-expanded="false" aria-controls="exampleAccordion2" data-toggle="collapse" href="#collapseExample2" class="mb-2 mr-2 btn-transition btn btn-outline-primary">Talimatları okuyun ↓</button>
                                                    <div data-parent="#exampleAccordion" id="collapseExample2" class="collapse" style="">
                                                        
                                                       
                                                        <div class="form-row">

                                                                   <div class="col-md-12">

                                                                       <div style="height:auto; width:auto;">
                                                                       <asp:Image ID="Image1" ImageUrl="img/slider_gorsel/slider_talimat.png" runat="server" style="max-width:100%; height:auto;"/>
                                                                           </div>
                                                                   </div>

                                                               </div>                                                        
                                                    </div>
                                                </div>
                                            </div>

       </div>
       
     
       <div class="card-body">
           
           <h5 class="card-title">EKLENECEK GÖRSEL VE ÜRÜN BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>

          
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label1" runat="server" Text="Ürün barkod numarası* "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ürün alanı boş bırakılamaz!" ControlToValidate="DropDownList1" InitialValue="0" ForeColor="#FF5840" Display="Dynamic" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>                     
                               <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>     
                         
                           </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="Başlık * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Başlık alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840" Display="Dynamic" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>                   
                           </div>
                       </div>
                   
                   </div>

                   <div class="form-row">
                       
                       <div class="col-md-4"></div>

                       <div class="col-md-4">
                           <div class="position-relative form-group">
                               <div class="position-relative form-group">
                           <asp:Label ID="Label10" runat="server" Text="Görsel * "></asp:Label>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Resim alanı boş bırakılamaz!" ControlToValidate="FileUpload1" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>                           
                           <asp:FileUpload ID="FileUpload1" runat="server" class="form-control-file"/>
                           <div class="position-relative form-group">
                           <small class="form-text text-muted">Sayfa düzenini bozmaması için görsel 1920 piksel genişliğinde ve 930 piksel yüksekliğinde olmalıdır!</small>
                           </div>
                           </div>
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

        </form>

</asp:Content>
