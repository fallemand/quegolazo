using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;
using Logica;
using AccesoADatos;
using Entidades;

namespace QueGolazo_.admin
{
    public partial class RegistrarEquipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarCampeonatos();
                ddlCampeonatos.Focus();
            }
        }



        // Carga los campeonatos 
        private void cargarCampeonatos()
        {
            DAOCampeonato gestor = new DAOCampeonato();
            ddlCampeonatos.DataSource = gestor.obtenerTodosSinDiagramacion();
            ddlCampeonatos.DataValueField = "idCampeonato";
            ddlCampeonatos.DataTextField = "nombre";
            ddlCampeonatos.DataBind();       
        }

        /// <summary>
        /// Oculta los paneles que muestran los mensajes de exito o fracaso.
        /// </summary>
        private void ocultarPaneles()
        {
            panelExito.Visible = false;
            panelFracaso.Visible = false;
            litError.Text = "";
            litExito.Text = "";
        }

        /// <summary>
        /// Limpia los campos de la pantalla
        /// </summary>
        private void limpiarCampos()
        {
            txtNombre.Text = "";
            txtUrlLogo.Text = "";
            txtDirectorTecnico.Text = "";
           txtColorDeCamisetaPrimario.Value = "";
           txtColorDeCamisetaSecundario.Value = "";
            txtDomicilio.Text = "";
            txtEmail.Text = "";
            txtNombreDelegado.Text = "";
            txtTelefono.Text = "";
        }

        /// <summary>
        /// Toma los datos de entrada y registra al Equipo y su delegado
        /// </summary>
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                //inicializamos los gestores para obtener datos de la BD
                DAOEquipos gestorEquipo = new DAOEquipos();
                ocultarPaneles();
                if (txtColorDeCamisetaPrimario.Value == txtColorDeCamisetaSecundario.Value)
                {
                    throw new Exception("Los colores de camiseta primario y secundario no pueden ser iguales.");
                }

                if (gestorEquipo.validarSiExisteEnCampeonato(txtNombre.Text, Int32.Parse(ddlCampeonatos.SelectedValue)))
                {  //existe un equipo con ese nombre para ese campeonato
                    throw new Exception("El nombre de equipo ya existe. Por favor, ingrese otro nombre.");
                }
                else//no existe un equipo con ese nombre para ese campeonato
                {

                        Equipo equipo = new Equipo()
                                                        {

                                                            nombre = txtNombre.Text,
                                                            idCampeonato = Int32.Parse(ddlCampeonatos.SelectedValue),
                                                            urlLogo = txtUrlLogo.Text,
                                                            colorDeCamisetaPrimario = txtColorDeCamisetaPrimario.Value,
                                                            colorDeCamisetaSecundario = txtColorDeCamisetaSecundario.Value,
                                                            directorTecnico = txtDirectorTecnico.Text,

                                                        };
                        Delegado delegado = new Delegado()
                                                        {

                                                            nombre = txtNombreDelegado.Text,
                                                            email = txtEmail.Text,
                                                            domicilio = txtDomicilio.Text,
                                                            telefono = txtTelefono.Text,
                                                        };

                      
                        gestorEquipo.registrarEquipo(equipo, delegado);
                        litExito.Text = "El Equipo <strong>'" + equipo.nombre + "'</strong> se registró con éxito!";
                        panelExito.Visible = true;
                        limpiarCampos();
                    }
                
              
            }
            catch (Exception ex) //mostramos cualquier tipo de error
            {
                litError.Text = ex.Message;
                panelFracaso.Visible = true;
            }
        }

       
    }
}