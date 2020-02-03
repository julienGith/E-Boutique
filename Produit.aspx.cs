using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Boutique
{
    public partial class Produit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lstvProduit_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            DAL.DALProduct dALProduct = new DAL.DALProduct();
            if (Session["panier"] == null)
            {
                Panier panier = new Panier();
                Session.Add("panier", panier);
            }
            else
            {
                if (String.Equals(e.CommandName, "AddtoCart"))
                {
                    Panier panier = Session["panier"] as Panier;
                    TextBox btnQte = e.Item.FindControl("txtQte") as TextBox;
                    Label lblPrice = e.Item.FindControl("lblPrice") as Label;
                    Label labelNomComplet = e.Item.FindControl("labelNomComplet") as Label;
                    decimal prix = dALProduct.GetProductByID(int.Parse(e.CommandArgument.ToString())).Price;
                    Panier.Ligne ligne = new Panier.Ligne
                    {
                        IdProduit = int.Parse(e.CommandArgument.ToString()),
                        Quantite = int.Parse(btnQte.Text),
                        Prix = prix,
                        NomProduit = labelNomComplet.Text
                    };
                    panier.Add(ligne);
                }
            }

        }
    }
}