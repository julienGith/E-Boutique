using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.IO;
using BOL;
using DAL;

namespace E_Boutique
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         

        }

        protected void lvCat_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            DAL.DALCategory dALCategory = new DALCategory();
            int catParentID = int.Parse(e.CommandArgument.ToString());
            if (String.Equals(e.CommandName, "btnProd")&& dALCategory.GetCategoriesEnfantImgByParentID(catParentID).Count==0)
            {
                string url = "Produits.aspx?idcat=" + catParentID;
                Response.Redirect(url);
            }
            else
            {
                string url = "Categories.aspx?idCat=" + catParentID;
                Response.Redirect(url);
            }

        }





        // code pour afficher l'image
        //<ItemTemplate>
        //      <img src = '<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' id="imageControl" runat="server" />
        //    </ItemTemplate> 
    }
}