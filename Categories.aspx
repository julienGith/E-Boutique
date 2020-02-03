<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" MasterPageFile="~/Site.Master" Inherits="E_Boutique.Categories" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:ListView ID="lstvImgCatEnf" runat="server" DataSourceID="odsCatEnf">
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
                <a href='<%#"Produits.aspx?idcat=" + Eval("Id")%>'>
                    <img src='<%#"data:image/"+Eval("MimeType")+";base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' width="200" height="200" id="imgCatEnf" runat="server"></a>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsCatEnf" runat="server" SelectMethod="GetCategoriesEnfantImgByParentID" TypeName="DAL.DALCategory">
        <SelectParameters>
            <asp:QueryStringParameter Name="parentid" DefaultValue="" QueryStringField="idCat" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>