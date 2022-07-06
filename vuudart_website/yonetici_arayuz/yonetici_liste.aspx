<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="yonetici_liste.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.yonetici_liste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%vuudart_website.cs.YoneticiCRUD yoneticilerlistesi = new vuudart_website.cs.YoneticiCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = yoneticilerlistesi.tumyoneticilistele();%> 

       <%for (int i = 0; i < dt.Rows.Count; i++)
		 {%>
           <div class="modal fade" id="gprm<%=dt.Rows[i][0] %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">

                   <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">Üye detaylı bilgileri:</h5>
                           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">×</span>
                           </button>
                   </div>

               <div class="modal-body">                
               <div class="table-responsive">
				   <table class="mb-0 table table-striped">
																							
				   <tr>
				   <td>Profil fotoğrafı</td>
				   <td>:</td>
				   <td><img class="rounded-circle" alt="" src="<%=dt.Rows[i][6] %>" Height="75" Width="75"/></td>
				   </tr>
      
                   <tr>
				   <td>Ad</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][1] %></td>
				   </tr>

                   <tr>
				   <td>Soyad</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][2] %></td>
				   </tr>

                   <tr>
				   <td>Mail</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][3] %></td>
				   </tr>
                 
                   <tr>
				   <td>Telefon</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][4] %></td>
				   </tr>
                   
                   <tr>
				   <td>Ünvan</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][5] %></td>
				   </tr>
                                                                               
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
                                    <i class="pe-7s-magic-wand icon-gradient bg-night-fade">
                                    </i>
                                </div>
                                <div>
                                    Yönetici Listeleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada yönetici listeleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Yönetici İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Yönetici Listele</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">YÖNETİCİLER LİSTESİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="yoneticilerlistesi" class="mb-0 table table-striped" style="width:100%">
               
        <thead>
            <tr>
                <th>Profil Fotoğrafı</th>
                <th>Ad</th>
                <th>Mail</th>
                <th>Ünvan</th>
                <th>Detaylı İncele</th>
            </tr>
        </thead>
        <tbody>
            
       <%vuudart_website.cs.YoneticiCRUD yoneticilerlistesi = new vuudart_website.cs.YoneticiCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = yoneticilerlistesi.tumyoneticilistele();%> 
            
       <%for (int i = 0; i < dt.Rows.Count; i++)
         {%>    
            <tr>
                
                <td> <img class="rounded-circle" alt="" src="<%=dt.Rows[i][6] %>" width="70" height="70"/></td>
                <td><%=dt.Rows[i][1] %> <%=dt.Rows[i][2] %></td>
                <td><%=dt.Rows[i][3] %></td>
                <td><%=dt.Rows[i][5] %></td>
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-primary btn-sm btn-block" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">İncele</button></td>
                
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Profil Fotoğrafı</th>
                <th>Ad</th>
                <th>Mail</th>
                <th>Ünvan</th>
                <th>Detaylı İncele</th>
            </tr>
        </tfoot>
    </table>
			
       </div>
   </div>
       

    <script>

        $(document).ready(function () {
            $('#yoneticilerlistesi').DataTable();
        });
       
    </script>

</asp:Content>
