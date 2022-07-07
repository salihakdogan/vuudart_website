<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="gelen_mail.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.gelen_mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%vuudart_website.cs.GelenMailCRUD gelenmailler = new vuudart_website.cs.GelenMailCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = gelenmailler.glnmaillistele();%>
    
    <%for (int i = 0; i < dt.Rows.Count; i++)
      {%>

<div class="modal fade bd-example-modal-lg" id="gprm<%=dt.Rows[i][0] %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      
        <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">Mail detayı:</h5>
                           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">×</span>
                           </button>
                   </div>

               <div class="modal-body">                
               <div class="table-responsive">
				   <table class="mb-0 table table-striped">
																							       
                   <tr>
				   <td>Gönderen adres</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][1] %></td>
				   </tr>			  

                   <tr>
				   <td>Mail başlığı</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][2] %></td>
				   </tr>

                   <tr>
				   <td>Mail mesajı</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][3] %></td>
				   </tr>

                   <tr>
				   <td>Gönderilen tarih</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][4] %></td>
				   </tr>
      
                       <%Boolean yanitlandi = Convert.ToBoolean(dt.Rows[i][5]); %>

                       <%if (yanitlandi == false)
                         {%>

                               <tr>
				               <td>Yanıt bilgisi</td>
				               <td>:</td>
				               <td>Henüz yanıtlanmadı</td>
				               </tr>

                       <%}%>

                       <%if (yanitlandi == true)
                         {%>

                               <tr>
				               <td>Yanıt bilgisi</td>
				               <td>:</td>
				               <td>Yanıtlandı</td>
				               </tr>

                       <%}%>
                                   
				   </table>													
				</div>       
                </div>

                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">Kapat</button>
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
                                    <i class="pe-7s-mail icon-gradient bg-night-fade">
                                    </i>
                                </div>
                                <div>
                                    Gelen Mailler
                                    <div class="page-title-subheading">
                                        Bu sayfada gelen mailleri görüntüleyebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Mail kutusu</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Gelen mailler</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">GELEN MAİLLER LİSTESİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="maillistesi" class="mb-0 table table-striped" style="width:100%">
               
        <thead>
            <tr>
                <th>Gönderen Adres</th>
                <th>Konu Başlığı</th>
                <th>Mail Detayı</th>
                <th>Yanıt Bilgisi</th>                      
            </tr>
        </thead>
        <tbody>
            
       <%vuudart_website.cs.GelenMailCRUD gelenmailler = new vuudart_website.cs.GelenMailCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = gelenmailler.glnmaillistele();%> 
            
       <%for (int i = 0; i < dt.Rows.Count; i++)
         {%>    
            <tr>
                              
                <td><%=dt.Rows[i][1] %></td>
                <td><%=dt.Rows[i][2] %></td>
                
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-primary btn-sm btn-block" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">Mail Detayı</button></td>

                <%Session["yanitmailid"] = dt.Rows[i][0]; %>

                <% Boolean yanitlandi = Convert.ToBoolean(dt.Rows[i][5]); %>

                <%if (yanitlandi == false)
                  {%>

                    <td><a type="button" href="bireysel_mail.aspx?gonderenmail=<%=dt.Rows[i][1] %>&konubaslik=<%=dt.Rows[i][2] %>&mailid=<%=dt.Rows[i][0] %>" class="mb-2 mr-2 btn btn-outline-success btn-sm btn-block">Yanıtla  <i class="fa fa-solid fa-paper-plane"></i> </a></td>

                <%}else 
                  {%>
                                           
                    <td><button type="button" class="mb-2 mr-2 btn btn-outline-secondary btn-sm btn-block" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">Yanıtlandı <i class="fa fa-solid fa-check"></i> </button></td>
         
                <%}%>
               
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Gönderen Adres</th>
                <th>Konu Başlığı</th>
                <th>Mail Detayı</th>
                <th>Yanıt bilgisi</th>  
            </tr>
        </tfoot>
    </table>
			
       </div>
   </div>
       

    <script>

        $(document).ready(function () {
            $('maillistesi').DataTable();
        });
       
    </script>

</asp:Content>
