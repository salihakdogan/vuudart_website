<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="uye_liste.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.uye_liste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <%vuudart_website.cs.UyeCRUD uyelerlistesi = new vuudart_website.cs.UyeCRUD();
         System.Data.DataTable dt = new System.Data.DataTable();
         dt = uyelerlistesi.uyelerilistele();%> 

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
				   <td><img alt="" src="<%=dt.Rows[i][11] %>" Height="75" Width="75"/></td>
				   </tr>

				   <tr>
				   <td>Kullanıcı adı</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][0] %></td>
				   </tr>

                   <tr>
				   <td>Mail</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][1] %></td>
				   </tr>

                   <tr>
				   <td>Ad</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][2] %></td>
				   </tr>

                   <tr>
				   <td>Soyad</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][3] %></td>
				   </tr>


                   <%string tc;
                     tc = Convert.ToString(dt.Rows[i][5]);

                     if (tc!="")
                     {%>
                          
                   <tr>
				   <td>TC kimlik numarası</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][5] %></td>
				   </tr>   

                   <%}%> 
                       

                   <%string telefon;
                     telefon = Convert.ToString(dt.Rows[i][6]);

                     if (telefon!="")
                     {%>
                          
                   <tr>
				   <td>Telefon numarası</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][6] %></td>
				   </tr>   

                   <%}%>


                   <%string ulke;
                     ulke = Convert.ToString(dt.Rows[i][7]);

                     if (ulke!="")
                     {%>
                          
                   <tr>
				   <td>Ülke</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][7] %></td>
				   </tr>   

                   <%}%>


                   <%string sehir;
                     sehir = Convert.ToString(dt.Rows[i][8]);

                     if (sehir!="")
                     {%>
                          
                   <tr>
				   <td>Şehir</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][8] %></td>
				   </tr>   

                   <%}%>


                   <%string postakod;
                     postakod = Convert.ToString(dt.Rows[i][9]);

                     if (postakod!="")
                     {%>
                          
                   <tr>
				   <td>Posta kodu</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][9] %></td>
				   </tr>   

                   <%}%>


                   <%string adres;
                     adres = Convert.ToString(dt.Rows[i][10]);

                     if (adres!="")
                     {%>
                          
                   <tr>
				   <td>Adres</td>
				   <td>:</td>
				   <td><%=dt.Rows[i][10] %></td>
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
                                    <i class="pe-7s-user icon-gradient bg-night-fade">
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
                <td><%=dt.Rows[i][2] %></td>
                <td><%=dt.Rows[i][3] %></td>
                <td><a href="bireysel_mail.aspx?uyemail=<%=dt.Rows[i][1] %>"><%=dt.Rows[i][1] %>  <i class="fa fa-solid fa-paper-plane"></i></a></td> 
                <td><button type="button" class="mb-2 mr-2 btn btn-outline-primary btn-sm btn-block" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">İncele</button></td>
                
            </tr>
       <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Kullanıcı adı</th>
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
