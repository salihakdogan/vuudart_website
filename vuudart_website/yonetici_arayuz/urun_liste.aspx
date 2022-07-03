<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="urun_liste.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.urun_liste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <style>

        .gorsel1 {
	        height:245px;
	        width:360px;
	        float:left;
	        margin-right:5px;
	        margin-top:5px; 
	        margin-bottom:5px;
        }

        .gorsel2 {
	        height:120px;
	        width:180px;	     
	        float:left;
	        margin-bottom:5px;	
	        margin-top:5px;
	        margin-right:5px;
        }

        .gorsel3 {
	        height:120px;
	        width:180px;
	        float:left;
	        margin-bottom:5px;
	        margin-right:5px;	
        }

        .kanvas {
	        height:255px;
	        width:550px;
            float:left;
        }

   </style>

       <%vuudart_website.cs.UrunCRUD urunlerlistesi = new vuudart_website.cs.UrunCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = urunlerlistesi.tumurunlistele();%>
    
    <%for (int i = 0; i < dt.Rows.Count; i++)
      {%>

<div class="modal fade bd-example-modal-lg" id="gprm<%=dt.Rows[i][0] %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      
        <div class="modal-header">
                       <h5 class="modal-title" id="exampleModalLabel">Ürün detaylı bilgileri:</h5>
                           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">×</span>
                           </button>
                   </div>

               <div class="modal-body">                
               <div class="table-responsive">
				   <table class="mb-0 table table-striped">
																							
				   <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Ürün görselleri :" style="font-weight:bold;"></asp:Label>
                        <br>
                        
                        <div class="kanvas">

                        <div class="gorsel1">
                            <img alt="" src="<%=dt.Rows[i][5] %>" style="width:360px; height:245px;"/>
                        </div>
                            
                        <div class="gorsel2">
                            <img alt="" src="<%=dt.Rows[i][6] %>" style="width:180px; height:120px;"/>
                        </div>

                        <div class="gorsel3">
                            <img alt="" src="<%=dt.Rows[i][7] %>" style="width:180px; height:120px;"/>
                        </div> 
                                               
                        </div>

                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Barkod :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][0] %>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Ad :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][1] %>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Kategori :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][2] %>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Hammadde :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][3] %>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label8" runat="server" Text="Fiyat :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][8] %> tl
                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Stok :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][9] %> adet
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Text="KDV oranı :" style="font-weight:bold;"></asp:Label>
                        % <%=dt.Rows[i][10] %>
                    </td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Kargo ağırlık :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][11] %> kg
                    </td>
                </tr>
                
                      <%int genislik;
                        genislik = Convert.ToInt16(dt.Rows[i][12]);

                        if (genislik!=0)
                        {%>
                            <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label13" runat="server" Text="Genişlik :" style="font-weight:bold;"></asp:Label>
                                <%=dt.Rows[i][12] %> cm
                            </td>                       
                      <%}%>
                    
                      <%int uzunluk;
                      uzunluk = Convert.ToInt16(dt.Rows[i][13]);

                        if (uzunluk!=0)
                        {%>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="Uzunluk :" style="font-weight:bold;"></asp:Label>
                                <%=dt.Rows[i][13] %> cm
                            </td>
                            </tr>
                      <%}%>

                    
                      <%int yukseklik;
                        yukseklik = Convert.ToInt16(dt.Rows[i][14]);

                        if (yukseklik!=0)
                        {%>
                            <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label15" runat="server" Text="Yükseklik :" style="font-weight:bold;"></asp:Label>
                                <%=dt.Rows[i][14] %> cm
                            </td>
                      <%}%>
                    
                      <%int kalinlik;
                        kalinlik = Convert.ToInt16(dt.Rows[i][15]);

                        if (kalinlik!=0)
                        {%>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="Kalınlık :" style="font-weight:bold;"></asp:Label>
                                <%=dt.Rows[i][15] %> cm
                            </td>
                            </tr>
                      <%}%>
                    
                      <%int yaricap;
                        yaricap = Convert.ToInt16(dt.Rows[i][16]);

                        if (yaricap!=0)
                        {%>
                            <tr>
                            <td colspan="2">
                                <asp:Label ID="Label17" runat="server" Text="Yarıçap :" style="font-weight:bold;"></asp:Label>
                                <%=dt.Rows[i][16] %> cm
                            </td>
                            </tr>
                      <%}%>
                
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label12" runat="server" Text="Açıklama :" style="font-weight:bold;"></asp:Label>
                        <%=dt.Rows[i][4] %>
                    </td>
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
                                    <i class="pe-7s-users icon-gradient bg-mean-fruit">
                                    </i>
                                </div>
                                <div>
                                    Ürün Listeleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada ürün listeleme işlemlerini gerçekleştirebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ürün İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Ürün Listele</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
       <div class="card-body">

           <h5 class="card-title">ÜRÜNLER LİSTESİ</h5>
           <div class="position-relative form-group">
               
           </div>

           <table id="urunlerlistesi" class="mb-0 table table-striped" style="width:100%">
               
        <thead>
            <tr>
                <th>Görsel</th>
                <th>Barkod</th>
                <th>Ad</th>
                <th>Kategori</th>
                <th>Detaylı İncele</th>
            </tr>
        </thead>
        <tbody>
            
       <%vuudart_website.cs.UrunCRUD urunlerlistesi = new vuudart_website.cs.UrunCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = urunlerlistesi.tumurunlistele();%> 
            
       <%for (int i = 0; i < dt.Rows.Count; i++)
         {%>    
            <tr>
                
                <td><img alt="" src="<%=dt.Rows[i][5] %>" Height="40" Width="60"/></td>
                <td><%=dt.Rows[i][0] %></td>
                <td><%=dt.Rows[i][1] %></td>
                <td><%=dt.Rows[i][2] %></td>
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-primary btn-sm btn-block" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">İncele</button></td>
                
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Görsel</th>
                <th>Barkod</th>
                <th>Ad</th>
                <th>Kategori</th>
                <th>Detaylı İncele</th>
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
