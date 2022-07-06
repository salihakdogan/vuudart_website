<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="bireysel_mail.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.bireysel_mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-mail icon-gradient bg-grow-early">
                                    </i>
                                </div>
                                <div>
                                    Bireysel Mail Gönderme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada bireysel mail gönderme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Mail kutusu</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Bireysel mail gönder</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
        
   <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="page-title-icon"><i class="pe-7s-mail-open-file icon-gradient bg-premium-dark"></i></h5>
           <div class="position-relative form-group">
               
           </div>
                         
                   <div class="form-row">      

                       <div class="col-md-2"></div>

                       <div class="col-md-8">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label1" runat="server" Text="Mail gönderilecek adres * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mail gönderilecek adres boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Mail adresi yanlış veya formatı hatalı!" ControlToValidate="TextBox1" ForeColor="#FF5840" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                       <div class="col-md-2"></div> 

                   </div>
              
                   <div class="form-row">      

                       <div class="col-md-2"></div>

                       <div class="col-md-8">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="Mail konusu * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mail boş bırakılamaz!" ControlToValidate="TextBox2" ForeColor="#FF5840"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                            </div>
                       </div>
                       <div class="col-md-2"></div> 

                   </div>

                   <div class="form-row">

                       <div class="col-md-2"></div>

                       <div class="col-md-8">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label3" runat="server" Text="Mail içeriği * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Mail içeriği boş bırakılamaz!" ControlToValidate="TextBox3" ForeColor="#FF5840" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox3" runat="server" class="form-control" Height="200px" TextMode="MultiLine"></asp:TextBox>
                           </div>
                       </div>
                       <div class="col-md-2"></div>
                   
                   </div>
           
        </div>
               
       

       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button1" runat="server" Text="Mail gönder" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="Button1_Click" />
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button2" runat="server" Text="Temizle" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="Button2_Click" ValidationGroup="temizle" />
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

       </div>

   </div>

</asp:Content>
