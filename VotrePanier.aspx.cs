using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Boutique
{
    public partial class Panier1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ChargePanier();
            if (IsPostBack)
            {
                string argument = Request["__EVENTARGUMENT"];
                if (this.Request["__EVENTARGUMENT"]== "suppr")
                {
                    RemoveProduct(int.Parse(Request.Params["__EVENTTARGET"]));
                }

            }

        }
        HttpContext context = HttpContext.Current;
        HashSet<Panier.Ligne> produits = new HashSet<Panier.Ligne>();
        private void RemoveProduct(int id)
        {
            Panier panier = context.Session["panier"] as Panier;
            panier.Update(id, -1);
            Response.Redirect("~/VotrePanier");
          
        }

        private void ChargePanier()
        {
            StringBuilder stringbuilder = new StringBuilder();
            Panier panier = context.Session["panier"] as Panier;
            if (context.Session["panier"] != null)
            {
                produits = panier.Select(panier);
                stringbuilder.Append("<table runat =\"server\" class=\"table table-hover\"><thead><tr><th>Désignation</th><th> Quantité </th ><th>Prix</th><th>Total</th></tr></thead><tbody>");
                foreach (var item in produits)
                {
                    stringbuilder.Append("<tr><td>" + item.NomProduit + "</td><td>" + item.Quantite + "</td><td>" + item.Prix + "</td><td>" + item.TotalLigne + "</td><td><input type=\"button\" id="+item.IdProduit.ToString()+ " runat=\"server\" value=\"Supprimer\" onclick=\"javascript:__doPostBack('"+item.IdProduit+"','suppr')\" CommandArgument="+item.IdProduit.ToString()+"></td></tr>");
                }
                stringbuilder.Append("<tr><td></td><td></td><td></td><td>" + panier.TotalPanier + "</td></tbody></table>");
                tabPanier.InnerHtml = stringbuilder.ToString();

            }

        }

    }
}