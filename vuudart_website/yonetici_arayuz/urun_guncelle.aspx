<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="urun_guncelle.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.urun_guncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="tumsayfaform">
    
    <div id="tumsayfa" runat="server">
    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-box1 icon-gradient bg-plum-plate">
                                    </i>
                                </div>
                                <div>
                                    Ürün Güncelleme Ekranı
                                    <div class="page-title-subheading">
                                        Bu sayfada seçilen ürünün bilgilerini güncelleyebilirsin.
                                        <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.aspx">Anasayfa</a></li>   
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Ürün İşlemleri</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Ürün Güncelle</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
        
   <div class="main-card mb-3 card">
       
       <div class="card-body">
           
           <h5 class="card-title">ÜRÜN BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>

          
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label1" runat="server" Text="Barkod * "></asp:Label>
                               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Barkod alanı boş bırakılamaz!" ControlToValidate="TextBox1" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>        
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>--%>
                               <input id="TextBoxBarkod" class="form-control" disabled="disabled" runat="server" value="">
                            </div>
                       </div>
                             
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label2" runat="server" Text="Ad * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ad alanı boş bırakılamaz!" ControlToValidate="TextBox2" ForeColor="#FF5840" Display="Dynamic" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                           </div>
                       </div>
                   
                   </div>

                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label3" runat="server" Text="Kategori* "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Kategori seçim alanı boş bırakılamaz!" ControlToValidate="DropDownList1" InitialValue="0" ForeColor="#FF5840" Display="Dynamic" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                         <div class="input-group">
                               <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>
                         <%--<div class="input-group-append">
                              <asp:Button ID="yeni_kategori" runat="server" Text="Yeni Ekle +" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yeni_kategori_Click" ValidationGroup="yk_ekle" Visible="false"/>
                              <button class="btn btn-outline-success" runat="server" type="button" onserverclick="yeni_kategori_Click" ValidationGroup="yk_ekle" style="font-size:13px;"><i class="fa fa-plus"></i> Yeni ekle</button>
                         </div>--%>
                         </div>
                           </div>
                       </div>

                     
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label4" runat="server" Text="Hammadde * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Hammadde seçim alanı boş bırakılamaz!" ControlToValidate="DropDownList2" InitialValue="0" ForeColor="#FF5840" Display="Dynamic" ValidationGroup="yu_kayit" ></asp:RequiredFieldValidator>
                         <div class="input-group">
                               <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>
                         <%--<div class="input-group-append">
                               <asp:Button ID="yeni_hammadde" runat="server" Text="Yeni Ekle +" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="yeni_hammadde_Click" ValidationGroup="yh_ekle" Visible="false"/>  
                               <button class="btn btn-outline-success" runat="server" type="button" onserverclick="yeni_hammadde_Click" ValidationGroup="yh_ekle" style="font-size:13px;"><i class="fa fa-plus"></i> Yeni ekle</button>                            
                         </div>--%>
                         </div>
                           </div>
                       </div>
                      
                   </div>
    
        </div>

       <div class="card-body">
           
           <h5 class="card-title">ÜRÜN FİYAT VE STOK BİLGİLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olan alanlar.)</h7></p>
           </div>
                             
                   
                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label5" runat="server" Text="Fiyat * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Fiyat alanı boş bırakılamaz!" ControlToValidate="TextBox3" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox3" runat="server" class="form-control" type="number" ValidationGroup="yu_kayit"></asp:TextBox>                                
                                        <div class="input-group-append"><span class="input-group-text">Tl</span></div>                                       
                                    </div>      
                           </div>               
                       </div>
                             
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label6" runat="server" Text="Stok * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Stok alanı boş bırakılamaz!" ControlToValidate="TextBox4" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox4" runat="server" class="form-control" type="number"></asp:TextBox>
                                        <div class="input-group-append"><span class="input-group-text">adet</span></div>                                       
                                    </div>      
                           </div>               
                       </div>
                   
                   </div>

                   <div class="form-row">
                       
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label7" runat="server" Text="KDV oranı * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="KDV oranı alanı boş bırakılamaz!" ControlToValidate="DropDownList3" ForeColor="#FF5840" InitialValue="Lütfen seçim yapın" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text">%</span></div>
                                        <asp:DropDownList ID="DropDownList3" runat="server" class="form-control"></asp:DropDownList>
                                    </div>      
                           </div>               
                       </div>

                     
                       <div class="col-md-6">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label8" runat="server" Text="Kargo ağırlık * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Kargo ağırlık alanı boş bırakılamaz!" ControlToValidate="TextBox5" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox5" runat="server" class="form-control" type="number"></asp:TextBox>
                                        <div class="input-group-append"><span class="input-group-text">kg</span></div>                                       
                                    </div>      
                           </div>               
                       </div>

                      
                      
                   </div>
    
        </div>
               
       <div class="card-body">
           
           <h5 class="card-title">ÜRÜN AÇIKLAMA VE RESİMLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması kısmen zorunlu olan alanlar.)</h7></p>
           </div>
               
                   
                   <div class="form-row">
                       
                       <div class="col-md-12">
                           <div class="position-relative form-group">
                               <asp:Label ID="Label9" runat="server" Text="Açıklama * "></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Açıklama alanı boş bırakılamaz!" ControlToValidate="TextBox6" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>
                               <asp:TextBox ID="TextBox6" runat="server" class="form-control" TextMode="MultiLine" Height="214px"></asp:TextBox>
                            </div>
                       </div>

                   </div>

                   <div class="form-row">

                <% string barkodprm;

                barkodprm = Request.QueryString["prmbarkod"];
                vuudart_website.cs.UrunCRUD urunCRUD = new vuudart_website.cs.UrunCRUD();
                System.Data.DataTable urundt = urunCRUD.urungoster(barkodprm);

                string Gorsel1 = urundt.Rows[0][5].ToString();
                string Gorsel2 = urundt.Rows[0][6].ToString();
                string Gorsel3 = urundt.Rows[0][7].ToString();%>



                       <div class="col-md-6" style="height:auto; width:auto;">
                           <asp:Label ID="Label18" runat="server" Text="Güncellenecek Görseller * "></asp:Label>
                           
                                   
                           <div id="gorseller" style="float:left; margin: auto; width: 100%;">

                           <div id="gorsel1" style="float:left; width:130px; height:250px; outline-style: solid; outline-color: #D9D9D9; outline-width: thin; position:relative; background-color: #E2E6E8;">
                                <img id="Gorsel1" src="<%=Gorsel1%>" style="width:100%; height:auto; margin:0; position:absolute; top:50%; -ms-transform:translateY(-50%); transform:translateY(-50%);" />
                           </div>
                           
                           <div id="gorsel2" style="float:left; width:130px; height:250px; outline-style: solid; outline-color: #D9D9D9; outline-width: thin; position:relative; background-color: #E2E6E8;">
                                <img id="Gorsel2" src="<%=Gorsel2%>" style="width:100%; height:auto; margin:0; position:absolute; top:50%; -ms-transform:translateY(-50%); transform:translateY(-50%);" />
                           </div>

                           <div id="gorsel3" style="float:left; width:130px; height:250px; outline-style: solid; outline-color: #D9D9D9; outline-width: thin; position:relative; background-color: #E2E6E8;">
                                <img id="Gorsel3" src="<%=Gorsel3%>" style="width:100%; height:auto; margin:0; position:absolute; top:50%; -ms-transform:translateY(-50%); transform:translateY(-50%);" />
                           </div>

                           </div>
                                                                         
                       </div>

                       <div class="col-md-6">

                           <div class="position-relative form-group">
                           <asp:Label ID="Label10" runat="server" Text="Görsel 1 * "></asp:Label>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="En az 1 adet resim seçilmelidir!" ControlToValidate="FileUpload1" ForeColor="#FF5840" ValidationGroup="yu_kayit"></asp:RequiredFieldValidator>                           
                           <asp:FileUpload ID="FileUpload1" runat="server" class="form-control-file"/>
                           </div>

                           <div class="position-relative form-group">
                           <asp:Label ID="Label11" runat="server" Text="Görsel 2"></asp:Label>                       
                           <asp:FileUpload ID="FileUpload2" runat="server" class="form-control-file"/>
                           </div>

                           <div class="position-relative form-group">
                           <asp:Label ID="Label12" runat="server" Text="Görsel 3"></asp:Label>                          
                           <asp:FileUpload ID="FileUpload3" runat="server" class="form-control-file"/>
                           
                           <div class="position-relative form-group">
                           <small class="form-text text-muted">Görsel boyutu 1mb dan fazla olamaz.</small>
                           </div>

                           </div>

                       </div>
                                                                                                                              
                   </div>
                             
        </div>

       <div class="card-body">
           
           <h5 class="card-title">ÜRÜN ÖLÇÜLERİ</h5>
           <div class="position-relative form-group">
               <p style="color:#406bd0"><h7 class="">(Doldurulması zorunlu olmayan alanlar.)</h7></p>
           </div>
           
                                              <div id="exampleAccordion" data-children=".item">
                                                
                                                <div class="item">
                                                    <button type="button" aria-expanded="false" aria-controls="exampleAccordion2" data-toggle="collapse" href="#collapseExample2" class="mb-2 mr-2 btn-transition btn btn-outline-primary">Ürün ölçüsü ekle +</button>
                                                    <div data-parent="#exampleAccordion" id="collapseExample2" class="collapse" style="">
                                                        
                                                        <div class="form-row">
                       
                                                                   <div class="col-md-4">
                                                                       <div class="position-relative form-group">
                                                                           <asp:Label ID="Label13" runat="server" Text="Genişlik"></asp:Label>
                                                                                <div class="input-group">
                                                                                    <asp:TextBox ID="TextBox7" runat="server" class="form-control" type="number"></asp:TextBox>                                
                                                                                    <div class="input-group-append"><span class="input-group-text">cm</span></div>                                       
                                                                                </div>      
                                                                       </div>               
                                                                   </div>
                             
                                                                   <div class="col-md-4">
                                                                       <div class="position-relative form-group">
                                                                           <asp:Label ID="Label14" runat="server" Text="Uzunluk"></asp:Label>
                                                                                <div class="input-group">
                                                                                    <asp:TextBox ID="TextBox8" runat="server" class="form-control" type="number"></asp:TextBox>                                
                                                                                    <div class="input-group-append"><span class="input-group-text">cm</span></div>                                       
                                                                                </div>      
                                                                       </div>               
                                                                   </div>

                                                                   <div class="col-md-4">
                                                                       <div class="position-relative form-group">
                                                                           <asp:Label ID="Label15" runat="server" Text="Yükseklik"></asp:Label>
                                                                                <div class="input-group">
                                                                                    <asp:TextBox ID="TextBox9" runat="server" class="form-control" type="number"></asp:TextBox>                                
                                                                                    <div class="input-group-append"><span class="input-group-text">cm</span></div>                                       
                                                                                </div>      
                                                                       </div>               
                                                                   </div>
                   
                                                               </div>

                                                               <div class="form-row">

                                                                   <div class="col md-2"></div>

                                                                   <div class="col-md-4">
                                                                       <div class="position-relative form-group">
                                                                           <asp:Label ID="Label16" runat="server" Text="Kalınlık"></asp:Label>
                                                                                <div class="input-group">
                                                                                    <asp:TextBox ID="TextBox10" runat="server" class="form-control" type="number"></asp:TextBox>                                
                                                                                    <div class="input-group-append"><span class="input-group-text">cm</span></div>                                       
                                                                                </div>      
                                                                       </div>               
                                                                   </div>

                                                                   <div class="col-md-4">
                                                                       <div class="position-relative form-group">
                                                                           <asp:Label ID="Label17" runat="server" Text="Yarıçap"></asp:Label>
                                                                                <div class="input-group">
                                                                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control" type="number"></asp:TextBox>                                
                                                                                    <div class="input-group-append"><span class="input-group-text">cm</span></div>                                       
                                                                                </div>      
                                                                       </div>               
                                                                   </div>

                                                                   <div class="col md-2"></div>

                                                               </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                            

       <div class="card-body">

                   <div class="form-row">

                       <div class="col-md-4"></div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button1" runat="server" Text="Bilgileri kaydet" CssClass="mb-2 mr-2 btn btn-success btn-block" OnClick="Button1_Click" ValidationGroup="yu_kayit" />
                           </div>
                       </div>

                       <div class="col-md-2">
                           <div class="position-relative form-group">
                               <asp:Button ID="Button2" runat="server" Text="Formu temizle" CssClass="mb-2 mr-2 btn btn-danger btn-block" OnClick="Button2_Click" />
                           </div>
                       </div>

                       <div class="col-md-4"></div>

                   </div>

       </div>

   </div>

</div>

    </form>

</asp:Content>
