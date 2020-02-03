using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using BOL;
using DAL;

namespace E_Boutique
{
    /// <summary>
    /// Description résumée de WSEBoutique
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Pour autoriser l'appel de ce service Web depuis un script à l'aide d'ASP.NET AJAX, supprimez les marques de commentaire de la ligne suivante. 
    [System.Web.Script.Services.ScriptService]
    public class WSEBoutique : System.Web.Services.WebService
    {
        
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
            
        }

        [WebMethod]
        public string[] GetProductsByName(string prefixText, int count)
        {
            DAL.DALProduct dALProduct = new DALProduct();
            return dALProduct.GetLstProductsByName(prefixText,count);
        }

    }
}
