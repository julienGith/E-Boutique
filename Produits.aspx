<%@ Page Title="Produits" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produits.aspx.cs" Inherits="E_Boutique.Produits" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

            <asp:UpdatePanel ID="panProduit" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
            <ContentTemplate>

    <asp:ListView ID="ListView1" runat="server" DataSourceID="odsProdCat" DataKeyNames="Id" EnableViewState="true" OnItemCommand="ListView1_ItemCommand">
        <LayoutTemplate>

            <div>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="container">

                <div class="row">
                    <div class="col-sm-3">
                        <a href="Produit.aspx?idprod=<%# Eval("Id") %>">
                            <img src='<%#"data:image/"+Eval("MimeType")+";base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' width="125" height="125" id="imgProd1" runat="server" />'</a>
                    </div>
                    <div class="col-sm-9">
                        <a href="Produit.aspx?idprod=<%# Eval("Id") %>">
                            <h3>
                                <asp:Label ID="labelNomComplet" runat="server" Text='<%# Eval("name") %>' /></h3>
                        </a>
                        <asp:Label ID="label1" runat="server" Text='<%# Eval("ShortDescription") %>' />
                        <asp:Label ID="lblPric" runat="server" Text='Prix TTC : ' />
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:C}") %>' />
                        <asp:TextBox TextMode="Number" Text="1" ID="txtQte" runat="server" />
                        <asp:Button runat="server" Text="Ajouter au panier" ClientIDMode="Static" ID='btnAddToCart' CommandArgument='<%# Eval("Id") %>' CommandName="AddtoCart" />
                    </div>
                </div>

                <div>
                </div>
                <div></div>
            </div>

        </ItemTemplate>
    </asp:ListView>

</ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ListView1" EventName="ItemCommand" />
                    
            </Triggers>
        </asp:UpdatePanel>

    <asp:ObjectDataSource ID="odsProdCat" runat="server" SelectMethod="GetProductsByCategory" TypeName="DAL.DALProduct">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="idcat" QueryStringField="idcat" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

