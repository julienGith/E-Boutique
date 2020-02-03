<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Produit.aspx.cs" Inherits="E_Boutique.Produit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="lstvProduit" runat="server" DataSourceID="odsSelectProd"  DataKeyNames="Id" EnableViewState="true" OnItemCommand="lstvProduit_ItemCommand"  >
        <LayoutTemplate>

            <div>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
                <div class="container">
                    <h3><asp:Label ID="labelNomComplet" runat="server" Text='<%# Eval("name") %>' /></h3>
                    <div class="row">
                        <div class="col-sm-3">   
                        <img src='<%#"data:image/"+Eval("MimeType")+";base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' width="250" height="250" id="imgProd2" runat="server" />'
                        </div>
                            <div class="col-sm-9">
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("FullDescription") %>' /><br />
                            <asp:Label ID="lblPric" runat="server" Text='Prix TTC : '/>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:C}") %>'/>
                                <asp:TextBox  TextMode="Number" Text="1" id="txtQte" runat="server"/>
                                <asp:Button runat="server" Text="Ajouter au panier" ClientIDMode="Static" ID='btnAddToCart' CommandArgument='<%# Eval("Id") %>' CommandName="AddtoCart"/>
                            </div>
                        </div>
                    <asp:Label ID="label1" runat="server" Text='<%# Eval("ShortDescription") %>' />
                    <div>
                        
                    </div>
                    <div></div>
                </div>
            
        </ItemTemplate>
    </asp:ListView>

    
        <asp:ObjectDataSource ID="odsSelectProd" runat="server" SelectMethod="GetProductByID" TypeName="DAL.DALProduct" >
        <SelectParameters>
            <asp:QueryStringParameter Name="idprod" QueryStringField="idprod" DefaultValue="" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>
