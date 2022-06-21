<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="urun_ekle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.urun_ekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">

    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-add-user icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Ürün Ekleme Ekranı
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
           
           <h5 class="card-title">ÜRÜNÜN GENEL BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
               
               
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="Barkod * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kullanıcı adı alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label1" runat="server" Text="Ürün adı * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mail alanı boş bırakılamaz!" ControlToValidate="TextBox2" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mail adresi yanlış veya formatı hatalı!" ControlToValidate="TextBox2" ForeColor="#FF5840" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                               <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="ornek@mail.com"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>

                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label3" runat="server" Text="Kategori * "></asp:Label>
<%--                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ad alanı boş bırakılamaz!" ControlToValidate="TextBox3" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                               <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>
                            </div>                      
                               <asp:Button ID="Button3" runat="server" Text="+ Yeni kategori ekle" CssClass="mb-2 mr-2 btn btn-outline-success btn-sm btn-block" data-toggle="modal" data-target="#yeni_kategori"/>                      
                       </div>
                                 
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label4" runat="server" Text="Hammadde * "></asp:Label>
<%--                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ad alanı boş bırakılamaz!" ControlToValidate="TextBox3" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                               <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>
                            </div>                      
                               <asp:Button ID="Button4" runat="server" Text="+ Yeni hammadde ekle" CssClass="mb-2 mr-2 btn btn-outline-success btn-sm btn-block"/>                      
                       </div>
                       
                   </div>
                    
        </div>
               
       <div class="card-body">

           <h5 class="card-title">FİYAT VE KARGO BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olmayan alanlar.)</h7></p>
           </div>             
                                                                        
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label7" runat="server" Text="Stok adet *"></asp:Label>
                               <asp:TextBox ID="TextBox7" runat="server" class="form-control" MaxLength="11"></asp:TextBox>
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label8" runat="server" Text="Fiyat *"></asp:Label>
                               <asp:TextBox ID="TextBox8" runat="server" class="form-control" MaxLength="11" placeholder="05xxxxxxxxx"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>
                   
                   <div class="form-row">                 
                       
                        <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label9" runat="server" Text="KDV oranı *"></asp:Label>
                               <asp:TextBox ID="TextBox9" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>

                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label10" runat="server" Text="Kargo kg *"></asp:Label>
                               <asp:TextBox ID="TextBox10" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>

                                                           
                   </div>
                                         
       </div>

       <div class="card-body">

           <h5 class="card-title">GÖRSEL VE AÇIKLAMA</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olmayan alanlar.)</h7></p>
           </div>             
                                                                        
                   <div class="form-row">

                       <div class="col-md-12">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label5" runat="server" Text="Açıklama"></asp:Label>
                               <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                                   
                   </div>
                   
                   
                   
                   

                   <div class="form-row">

                       <div class="col-md-12">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label20" runat="server" Text="Ürün Fotoğrafı"></asp:Label>
                               <asp:FileUpload ID="FileUpload2" runat="server" class="form-control-file" />
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

          

       </div>

   </div>
   
        </form>

</asp:Content>
