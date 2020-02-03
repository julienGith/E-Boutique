using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;


namespace E_Boutique
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ChargeMenu();


        }
        private void ChargeMenu()
        {
            StringBuilder stringBuilder = new StringBuilder();
            Category category = new Category();
            DAL.DALCategory dALCategory = new DALCategory();
            HashSet<Category> catparents = new HashSet<Category>();
            catparents = dALCategory.GetCategoryParent();
            HashSet<Category> catenfants = new HashSet<Category>();
            string caret = string.Empty;
            string classMP = string.Empty;
            string classMPDT = string.Empty;

            foreach (Category item in catparents)
            {

                catenfants = dALCategory.GetCategoryByParentId(item.Id);
                if (catenfants.Count - 1 > 0)
                {
                    caret = "caret";
                    classMP = "dropdown-toggle";
                    classMPDT = "dropdown";

                }
                else
                {
                    caret = string.Empty;
                    classMP = string.Empty;
                    classMPDT = string.Empty;
                }
                stringBuilder.Append($"<li class='dropdown'><a runat='server' class='{classMP}' data-toggle='{classMPDT}' href=\"Produits.aspx?idcat=" + item.Id + "\">" + item.Name + $"<span class='{caret}'></span></a>");
                if (catenfants.Count - 1 > 0)
                {

                    stringBuilder.Append("<ul class='dropdown-menu'>");
                    foreach (var i in catenfants)
                    {
                        stringBuilder.Append("<li class='dropdown-item'><a runat='server'href=\"Produits.aspx?idcat=" + i.Id + "\">" + i.Name + "</a></li>");
                    }

                    stringBuilder.Append("</ul>");
                }

            }
            //stringBuilder.Append("<li class='dropdown'><a runat=\"server\" href=\"~/ VotrePanier\">Panier</a></li>");
            listcatp.InnerHtml = stringBuilder.ToString();
        }
    }
}
