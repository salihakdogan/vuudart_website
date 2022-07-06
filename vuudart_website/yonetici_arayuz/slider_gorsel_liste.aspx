<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="slider_gorsel_liste.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.slider_gorsel_liste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%vuudart_website.cs.SliderCRUD sliderlistesi = new vuudart_website.cs.SliderCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = sliderlistesi.sliderlistele();%>

    <%for (int i = 0; i < dt.Rows.Count; i++)
		 {%>

    <div class="modal fade" id="silonay<%=dt.Rows[i][0] %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">

                   <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">Slider görseli silinecek</h5>                     
                   </div>

               <div class="modal-body text-center font-18">
				   <h3 class="padding-top-30 mb-30 weight-500"><%=dt.Rows[i][0] %> / <%=dt.Rows[i][3] %> barkodlu ürüne ait</h3>
					  <h4 class="padding-top-30 mb-30 weight-500">slider görselini silmek istediğinize emin misiniz?</h4>
						   <div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
							   
				           </div>
			   </div>

                <div class="modal-footer">                    
                               <div>
								   						   
									<a href="slider_gorsel_liste.aspx?silprm=<%=dt.Rows[i][0] %>">
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
                                    <i class="pe-7s-user icon-gradient bg-night-fade">
                                    </i>
                                </div>
                                <div>
                                    Slider Görselleri Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada slider görsellerini listeleme,silme ve güncelleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Site Arayüzü İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Slider Görselleri</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

   <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">SLİDER GÖRSELLERİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="sliderlistesi" class="mb-0 table table-striped" style="width:100%">
               
        <thead>
            <tr>
                <th>Görsel</th>
                <th>Ürün Barkod Numarası</th>
                <th>Başlık</th>               
                <th>Sil</th>
                <th>Güncelle</th>
            </tr>
        </thead>
        <tbody>
            
       <%vuudart_website.cs.SliderCRUD sliderlistesi = new vuudart_website.cs.SliderCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = sliderlistesi.sliderlistele();%> 
            
       <%for (int i = 0; i < dt.Rows.Count; i++)
         {%>    
            <tr>
                
                <td><img alt="" src="<%=dt.Rows[i][2] %>" style="width:240px; height:116px;"  /></td>
                <td><%=dt.Rows[i][0] %> / <%=dt.Rows[i][3] %></td>
                <td><%=dt.Rows[i][1] %></td>
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-danger btn-sm btn-block" data-toggle="modal" data-target="#silonay<%=dt.Rows[i][0] %>">Sil</button></td>
                <td><a href="slider_guncelle.aspx?prmbarkod=<%=dt.Rows[i][0] %>"><button type="button" class="mb-2 mr-2 btn btn-outline-success btn-sm btn-block">Güncelle</button></td>
                
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Görsel</th>
                <th>Ürün Barkod Numarası</th>
                <th>Başlık</th>               
                <th>Sil</th>
                <th>Güncelle</th>
            </tr>
        </tfoot>
    </table>
			
       </div>
   </div>
       

    <script>

        $(document).ready(function () {
            $('#sliderlistesi').DataTable();
        });
       
    </script>

</asp:Content>
