<%@ Page Title="" Language="C#" MasterPageFile="~/yonetici_arayuz/yonetici.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="vuudart_website.yonetici_arayuz.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-home icon-gradient bg-malibu-beach">
                                    </i>
                                </div>
                                <div>
                                    Anasayfa
                                    <div class="page-title-subheading">
                                        Yönetici arayüzünü kullanırken lütfen dikkatli olun.
                                        <%--<ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                                                <li class="breadcrumb-item"><a href="javascript:void(0);">Library</a></li>
                                                <li class="active breadcrumb-item" aria-current="page">Data</li>
                                        </ol>--%>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>

    <div class="main-card mb-3 card">
        <div class="card-body">
            <i class="pe-7s-info"></i> Yönetici arayüzüne hoş geldin yapabileceğin işlemler kısaca şunlardır.
        </div>
    </div>

    <div class="form-row">

        <div class="col-md-6">

        <div class="card-border mb-3 card card-body border-warning">
        <h5 class="card-title"><i class="pe-7s-mail"></i> MAİL KUTUSU</h5>
        Bireysel ve toplu mail gönderme işlemlerini, gönderilen ve gelen mailleri görüntüleme işlemlerini gerçekleştirebilirsin.</div>
        
        </div>

        <div class="col-md-6">

        <div class="card-border mb-3 card card-body border-info">
        <h5 class="card-title"><i class="pe-7s-user"></i> ÜYE İŞLEMLERİ</h5>
        Üye ekleme, silme, görüntüleme ve güncelleme işlemlerini gerçekleştirebilirsin.</div>
        
        </div>

    </div>


    <div class="form-row">

        <div class="col-md-6">

        <div class="card-border mb-3 card card-body border-secondary">
        <h5 class="card-title"><i class="pe-7s-box1"></i> ÜRÜN İŞLEMLERİ</h5>
        Ürün ekleme, silme, görüntüleme ve güncelleme işlemlerini gerçekleştirebilirsin.</div>
        
        </div>

        <div class="col-md-6">

        <div class="card-border mb-3 card card-body border-primary">
        <h5 class="card-title"><i class="pe-7s-magic-wand"></i> YÖNETİCİ İŞLEMLERİ</h5>
        Yönetici ekleme, silme, görüntüleme ve güncelleme işlemlerini gerçekleştirebilirsin.</div>
        
        </div>

    </div>

    <div class="form-row">

        <div class="col-md-3">
       
        </div>

        <div class="col-md-6">

        <div class="card-border mb-3 card card-body border-danger">
        <h5 class="card-title"><i class="pe-7s-paint"></i> SLİDER İŞLEMLERİ</h5>
        Slider ekleme, silme, görüntüleme ve güncelleme işlemlerini gerçekleştirebilirsin.</div>
        
        </div>

        <div class="col-md-3">   
        
        </div>

    </div>

    

</asp:Content>
