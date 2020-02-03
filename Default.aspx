<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Boutique._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="lvCat" runat="server" DataSourceID="odsCat" OnItemCommand="lvCat_ItemCommand">
        <LayoutTemplate>

            <div class="container">
                <div class="row">
                    <%--Ce PlaceHolder sera remplacé par le contenu du ItemTemplate pour chaque enregistrement--%>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </div>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="col-xs-6 col-sm-4">
                <h3>
                    <asp:Label ID="labelNomComplet" runat="server" Text='<%# Eval("name") %>' /></h3>
                <asp:LinkButton ID="btnImgProd" CommandName="btnProd" CommandArgument='<%#Eval("Id")%>' Text="" runat="server"  >
                    <img src='<%#"data:image/"+Eval("MimeType")+";base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' width="200" height="200" id="imgCatParent" runat="server"></asp:LinkButton>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsCat" runat="server" SelectMethod="GetCategoriesParentImg" TypeName="DAL.DALCategory"></asp:ObjectDataSource>
    </asp:Content>
