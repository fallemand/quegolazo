using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;
using Entidades;
namespace QueGolazo
{
    public partial class admin_torneo_mis_torneos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Usuario usuarioActual = (Usuario)Session["usuario"];
            if (validaDatosDeEntrada()) { 
            

            }
        }

        /// <summary>
        /// Valida si los datos introducidos del lado del cliente son válidos.
        /// <returns>True si son validos los datos, False si son inválidos.</returns>
        private bool validaDatosDeEntrada()
        {
            ValidacionDeTextos validador = new ValidacionDeTextos();
            return !validador.estaVacio(txtNickTorneo.Value) && !validador.estaVacio(txtNombreTorneo.Value);

        }

    }
}