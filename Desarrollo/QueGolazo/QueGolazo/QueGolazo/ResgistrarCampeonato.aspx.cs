using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;
namespace QueGolazo
{
    public partial class ResgistrarCampeonato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void eventoClick(object sender, EventArgs e) {

        }

        protected void btnCrearCampeonato_Click(object sender, EventArgs e)
        {

            GestorDeArchivos gestor = new GestorDeArchivos();
            try
            {
                if (fileUploader.HasFile)
                {
                    // Se verifica que la extensión sea de un formato válido
                    string ext = fileUploader.PostedFile.FileName;
                    ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower();
                    string[] formatos =
                      new string[] { "jpg", "jpeg", "bmp", "png", "gif" };
                    if (Array.IndexOf(formatos, ext) < 0)
                    { } //error de formato invalido
                    else
                        gestor.GuardarArchivo(fileUploader.PostedFile);
                }
                else
                { }// MensajeError("Seleccione un archivo del disco duro.");
            }
            catch (Exception ex)
            {
                { } //MensajeError(ex.Message);
            }
        }

    }
}