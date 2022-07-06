<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="uye_sil_guncelle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.uye_sil_guncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <%vuudart_website.cs.UyeCRUD uyelerlistesi = new vuudart_website.cs.UyeCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = uyelerlistesi.uyelerilistele();%> 

       <%for (int i = 0; i < dt.Rows.Count; i++)
		 {%>

    <div class="modal fade" id="silonay<%=dt.Rows[i][0] %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">

                   <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">Üye silinecek</h5>                     
                   </div>

               <div class="modal-body text-center font-18">
				   <h3 class="padding-top-30 mb-30 weight-500"><%=dt.Rows[i][0] %> kullanıcı adlı üyeyi</h3>
					  <h4 class="padding-top-30 mb-30 weight-500">silmek istediğinize emin misiniz?</h4>
						   <div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
							   
				           </div>
			   </div>

                <div class="modal-footer">                    
                               <div>
								   						   
									<a href="uye_sil_guncelle.aspx?silprm=<%=dt.Rows[i][0] %>">
								    <button type="button" class="btn btn-success border-radius-100  confirmation-btn"><i class="fa fa-check"></i> Sil</button>
									</a>
                                   
								    <button type="button" class="btn btn-danger border-radius-100  confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i> İptal</button>
									
							   </div>
                </div>
                </div>

                   </div>
               </div>
              							
	   <%}%>

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
                                    Üye Silme / Güncelleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada üye silme ve güncelleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Üye İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Üye Sil / Güncelle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

   <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">ÜYELER LİSTESİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="uyelerlistesi" class="mb-0 table table-striped" style="width:100%">
               
        <thead>
            <tr>
                <th>Kullanıcı adı</th>
                <th>Ad</th>
                <th>Soyad</th>
                <th>Mail</th>
                <th>Sil</th>
                <th>Güncelle</th>
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
                <td><%=dt.Rows[i][2] %></td>
                <td><%=dt.Rows[i][3] %></td>
                <td><%=dt.Rows[i][1] %></td>
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-danger btn-sm btn-block" data-toggle="modal" data-target="#silonay<%=dt.Rows[i][0] %>">Sil</button></td>
                <td><a href="uye_guncelle.aspx?prmkadi=<%=dt.Rows[i][0] %>"><button type="button" class="mb-2 mr-2 btn btn-outline-success btn-sm btn-block">Güncelle</button></a></td>

            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Kullanıcı adı</th>
                <th>Ad</th>
                <th>Soyad</th>
                <th>Mail</th>
                <th>Sil</th>
                <th>Güncelle</th>
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
