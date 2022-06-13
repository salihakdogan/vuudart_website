<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yonetici_giris.aspx.cs" Inherits="vuudart_website.yonetici_giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>VuudArt - Yönetici Arayüzü Giriş Ekranı</title>
    
    <link rel="apple-touch-icon" sizes="180x180" href="yonetici_arayuz/logo/vuudart180x180.png">
	<link rel="icon" type="image/png" sizes="32x32" href="yonetici_arayuz/logo/vuudart32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="yonetici_arayuz/logo/vuudart16x16.png">
    
    <link href="yonetici_arayuz/giris_ekran.css" rel="stylesheet" />
    <link href="yonetici_arayuz/main.css" rel="stylesheet" />

</head>

<body>
    
    <form id="form1" runat="server">
        
       <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">

           <div class="app-main">
     
                 <div class="app-main__inner">

         <div class="col-md-6 ortahizala">

         <div id="girishatali" runat="server" visible="false">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 <strong>Giriş yapılamadı!</strong> E-mail adresiniz ya da şifreniz hatalı!
                 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
                 </button>
             </div>
         </div>

         </div>

         <div class="col-md-6 ortahizala">
                  
             <div class="main-card mb-3 card card-shadow-secondary border mb-3 card card-body border-secondary">
                        
               <div class="card-body">
                 
                   <asp:Image ID="Image1" runat="server" ImageUrl="yonetici_arayuz/logo/vuudart-giris_ekran_logo.png" Height="70" Width="120" CssClass="imagehizala"/>
                   
                   <div class="col-md-8 ortahizala">
                   <div class="texthizala" style="color:#406bd0">Yönetici Arayüzü Giriş Ekranı</div>
                   </div>
                    
                   <div class="col-md-8 ortahizala">
                           <div class="position-relative form-group">
                               
                               <asp:Label ID="Label2" runat="server" Text="E-mail * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="E-mail alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               
                               <div class="input-group">
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                               <div class="input-group-append"><span class="input-group-text"><i class="pe-7s-mail icon-gradient bg-premium-dark"></i></span></div>
                               </div>

                            </div>
                       </div>

                   <div class="col-md-8 ortahizala">
                           <div class="position-relative form-group">
                               
                               <asp:Label ID="Label1" runat="server" Text="Şifre * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Şifre alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               
                               <div class="input-group">
                               <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                               <div class="input-group-append"><span class="input-group-text"><i class="pe-7s-lock icon-gradient bg-premium-dark"></i></span></div>
                               </div>

                            </div>
                       </div>

                   <div class="col-md-8 ortahizala">
                           <div class="position-relative form-group">
                               <asp:CheckBox ID="CheckBox1" runat="server" Text="Giriş bilgilerini kaydet" class="custom-checkbox"/>
                            </div>
                       </div>

               </div>

               <div class="card-body">
  
                   <div class="col-md-8 ortahizala">                   

                      <div class="row">
                           <div class="col-6">
                               <div class="position-relative form-group">
                                   <asp:Button ID="Button1" runat="server" Text="Giriş" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="Button1_Click"/>
                               </div>
                           </div>

                           <div class="col-6">
                               <div class="position-relative form-group">
                                   <asp:Button ID="Button2" runat="server" Text="Formu temizle" CssClass="mb-2 mr-2 btn btn-alternate btn-block" OnClick="Button2_Click"/>
                               </div>
                           </div>
                       </div>               

                   </div>
 
              </div>

             </div>

         </div>
           
               </div>

           </div>

       </div>

    </form>
    
</body>

    <script type="text/javascript" src="yonetici_arayuz/assets/scripts/main.js"></script>

</html>
