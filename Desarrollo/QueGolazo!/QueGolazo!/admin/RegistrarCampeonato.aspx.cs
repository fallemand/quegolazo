using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;
using AccesoADatos;
using Utils;

namespace QueGolazo_.admin
{
    public partial class RegistrarCampeonato : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                cargarDropDownLists();
                txtNombre.Focus();
            }
        }
        /// <summary>
        /// Carga los DropdownList del formulario.
        /// </summary>
        private void cargarDropDownLists()
        {
            //inicializamos los gestores para obtener datos de la BD
            DAOSuperficies gestorSuperficies = new DAOSuperficies();
            DAOTamañosDeCancha gestorTamañosCancha = new DAOTamañosDeCancha();

            GestorDropDownLists.cargarDropDownList(gestorSuperficies.obtenerTodos(), ddlSuperficieDeCancha, "idSuperficieDeCancha", "nombre");
            GestorDropDownLists.cargarDropDownList(gestorTamañosCancha.obtenerTodos(), ddlTamañoCancha, "idTamañoCancha", "nombre");
         }

        /// <summary>
        ///Capta los datos del nuevo equipo y llama al método que lo registra.
        /// </summary>
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            ocultarPaneles();
            registrarCampeonato();
        }
      
        /// <summary>
        /// Realiza el registro de los datos de un nuevo campeonato introducidos en el formulario a la base de datos.
        /// </summary>
        private void registrarCampeonato()
        {
            try
            {
                //inicializamos los gestores para obtener datos de la BD
                DAOCampeonato gestor = new DAOCampeonato();
               DAOTamañosDeCancha gestorTamañosDeCancha = new DAOTamañosDeCancha();

                Campeonato campeonatoExistente = gestor.buscarCampeonatoPorNombre(txtNombre.Text);
                TamañoCancha tamaño = gestorTamañosDeCancha.obtenerTamañoPorId(int.Parse(ddlTamañoCancha.SelectedValue));
                //verificamos primero si paso todas las validaciones del lado del cliente y si no existe un campeonato registrado con ese nombre
                if (campeonatoExistente == null && validaTamañoCancha(tamaño))
                {
                    Campeonato nuevoCampeonato = new Campeonato();
                    extraerDatosDelCampeonato(nuevoCampeonato);

                   gestor.registrarCampeonato(nuevoCampeonato);
                    mostrarPanelExito("El campeonato <strong>'" + nuevoCampeonato.nombre + "'</strong> se registró con éxito!");
                    limpiarFormulario();
                    txtNombre.Focus();
                }
                else
                {
                    //si el campeonato ya existia
                    if (campeonatoExistente != null)
                    {
                        mostrarPanelFracaso("El campeonato <strong>" + campeonatoExistente.nombre + "</strong> ya se encuentra registrado, intenta con otro nombre.");
                    }
                    //si la cantidad de jugadores ingresada es incorrecta
                    else {

                        mostrarPanelFracaso("La cantidad de jugadores que ingreso debe ser mayor o igual a <strong>" + tamaño.cantidadDeJugadores + "</strong>,o bien cero si la cantidad es ilimitada.");
                        txtCantidadMaximaJugadores.Focus();
                    }
                }
            }
            catch (Exception ex)
            {
                mostrarPanelFracaso(ex.Message);
            }
        }

        /// <summary>
        /// Valida si el tamaño de cancha ingresado por el usuario es el correcto. Debe ser mayor al numero de jugadores que pueden jugar en la cancha.
        /// </summary>
        /// <returns>True si la cantidad es correcta, false si no lo es.</returns>
        private bool validaTamañoCancha(TamañoCancha tamañoElegido)
        {
            int cantidadIngresada = int.Parse(txtCantidadMaximaJugadores.Text);
            if (cantidadIngresada == 0)
                return true;
            else
                return cantidadIngresada >= tamañoElegido.cantidadDeJugadores;
        }

        /// <summary>
        /// Oculta los paneles que muestran los mensajes de exito o fracaso.
        /// </summary>
        private void ocultarPaneles()
        {
            panelExito.Visible = false;
            panelFracaso.Visible = false;
        }

        /// <summary>
        /// Habilita el panel de exito y deshabilita el panel de fracaso.
        /// </summary>
        /// <param name="mensaje">Mensaje a mostrar en el panel.</param>
        private void mostrarPanelExito(string mensaje){
            litExito.Text = mensaje;
            panelExito.Visible = true;
            panelFracaso.Visible = false;
        }

        /// <summary>
        /// Habilita el panel de fraaso y deshabilita el panel de exito.
        /// </summary>
        /// <param name="mensaje">Mensaje a mostrar en el panel.</param>
        private void mostrarPanelFracaso(string mensaje)
        {
            litError.Text = mensaje;
            panelExito.Visible = false;
            panelFracaso.Visible = true;
        }


        /// <summary>
        /// Extrae los datos del formulario y los setea en el objeto que se pasa por parametro.
        /// </summary>
        /// <param name="nuevoCampeonato">El objeto Campeonato donde se van a procesar los datos extraidos del formulario.</param>
        private void extraerDatosDelCampeonato(Campeonato nuevoCampeonato)
        {
            nuevoCampeonato.nombre = txtNombre.Text;
            nuevoCampeonato.descripcion = txtDescripcion.Text;
            nuevoCampeonato.idTamañoCancha = int.Parse(ddlTamañoCancha.SelectedValue);
            nuevoCampeonato.cantidaMaximaJugadores = int.Parse(txtCantidadMaximaJugadores.Text);
            nuevoCampeonato.idSuperficieDeCancha = int.Parse(ddlSuperficieDeCancha.SelectedValue);
            nuevoCampeonato.urlLogo = txtUrlLogo.Text;
            if (cbIdaYVuelta.Checked)
                nuevoCampeonato.idTipoFixture = 2;
            else
                nuevoCampeonato.idTipoFixture = 1;
            nuevoCampeonato.idEstado = 1; //TODO se crea con el estado "Registrado", luego (en otra historia) debe cambiarse este numero por una entidad o ennumerado
        }

        /// <summary>
        /// Limpia los controles de texto del formulario.
        /// </summary>
        private void limpiarFormulario() {
            txtNombre.Text = string.Empty;
            txtUrlLogo.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtCantidadMaximaJugadores.Text = string.Empty;
        }
    }
}