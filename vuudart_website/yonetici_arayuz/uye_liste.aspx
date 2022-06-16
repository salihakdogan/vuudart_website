<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="uye_liste.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.uye_liste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-users icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Üye Listeleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada üye listeleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Üye İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Üye Listele</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
    
   <div id="kayitbasarili" runat="server" visible="false">
       <div class="alert alert-warning alert-dismissible fade show" role="alert">
           <strong>Holy guacamole!</strong> You should check in on some of those fields below.
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
               <span aria-hidden="true">&times;</span>
           </button>
       </div>
   </div>

   <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">ÜYELER LİSTESİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="uyelerlistesi" class="table table-striped table-bordered" style="width:100%">
               
        <thead>
            <tr>
                <th>Ad</th>
                <th>Soyad</th>
                <th>Mail</th>
                <th>Detaylı incele</th>
            </tr>
        </thead>
        <tbody>
            
       <%vuudart_website.cs.UyeCRUD uyelerlistesi = new vuudart_website.cs.UyeCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = uyelerlistesi.uyelerilistele();%> 
            
       <%for (int i = 0; i < dt.Rows.Count; i++)
         {%>    
            <tr>
                
                <td><%=dt.Rows[i][0] %></td>
                <td><%=dt.Rows[i][1] %></td>
                <td><%=dt.Rows[i][2] %></td>
                <td></td>
                
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Ad</th>
                <th>Soyad</th>
                <th>Mail</th>
                <th>Detaylı incele</th>
            </tr>
        </tfoot>
    </table>
					
       </div>
   </div>
   
    <script>

        $(document).ready(function () {
            $('#uyelerlistesi').DataTable();
        });
       
    </script>

</asp:Content>
