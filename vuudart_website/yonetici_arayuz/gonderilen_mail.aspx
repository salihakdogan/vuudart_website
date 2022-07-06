<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="gonderilen_mail.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.gonderilen_mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%vuudart_website.cs.GonderilenMailCRUD gidenmailler = new vuudart_website.cs.GonderilenMailCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = gidenmailler.gndmaillistele();%>
    
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
				   <td>Gönderen yönetici</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][6] %></td>
				   </tr>

				   <tr>
				   <td>Gönderilen adres</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][3] %></td>
				   </tr>

                   <tr>
				   <td>Mail başlığı</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][4] %></td>
				   </tr>

                   <tr>
				   <td>Mail mesajı</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][5] %></td>
				   </tr>

                   <tr>
				   <td>Gönderilen tarih</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][7] %></td>
				   </tr>


                    <%int mailtur = Convert.ToUInt16(dt.Rows[i][1]); %>

                    <%if (mailtur == 0)
                      {%>
                        
                        <%Boolean okundu = Convert.ToBoolean(dt.Rows[i][8]); %>

                        <%if (okundu == false)
                          {%>

                               <tr>
				               <td>Okundu bilgisi</td>
				               <td>:</td>
				               <td>Henüz okunmadı</td>
				               </tr>

                        <%}%>

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
                                    Gönderilen Mailler
                                    <div class="page-title-subheading">
                                        Bu sayfada gönderilen mailleri görüntüleyebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Mail kutusu</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Gönderilen mailler</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">GÖNDERİLEN MAİLLER LİSTESİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="urunlerlistesi" class="mb-0 table table-striped" style="width:100%">
               
        <thead>
            <tr>
                <th>Mail Türü</th>
                <th>Gönderen Yetkili</th>
                <th>Gönderilen Adres</th>
                <th>Mail Başlığı</th>        
                <th>Mail Detayı</th>
            </tr>
        </thead>
        <tbody>
            
       <%vuudart_website.cs.GonderilenMailCRUD gidenmailler = new vuudart_website.cs.GonderilenMailCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = gidenmailler.gndmaillistele();%> 
            
       <%for (int i = 0; i < dt.Rows.Count; i++)
         {%>    
            <tr>
                 
                <%int mailtur = Convert.ToUInt16(dt.Rows[i][1]); %>

                <%if (mailtur == 0)
                  {%>
                        <td>Bireysel Mail</td>
                <%}%>

                <%if (mailtur == 1)
                  {%>
                        <td>Toplu Mail</td>
                <%}%>

                <td><%=dt.Rows[i][6] %></td>
                <td><%=dt.Rows[i][3] %></td>
                <td><%=dt.Rows[i][4] %></td>
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-primary btn-sm btn-block" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">Mail Detayı</button></td>
                
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Mail Türü</th>
                <th>Gönderen Yetkili</th>
                <th>Gönderilen Adres</th>
                <th>Mail Başlığı</th>        
                <th>Mail Detayı</th>
            </tr>
        </tfoot>
    </table>
			
       </div>
   </div>
       

    <script>

        $(document).ready(function () {
            $('#urunlerlistesi').DataTable();
        });
       
    </script>

</asp:Content>
