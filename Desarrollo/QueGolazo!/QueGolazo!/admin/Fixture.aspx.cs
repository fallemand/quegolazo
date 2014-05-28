using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using AccesoADatos;
using Logica;
using Utils;

namespace QueGolazo_
{
    public partial class Fixture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                repiter_fechas.DataSource = (List<Fecha>)Session["fechas"];
                repiter_fechas.DataBind();
                cargarListaDeFechas(((List<Fecha>)Session["fechas"]).Count);
            }
        }

        private void cargarListaDeFechas(int cantidadDeFechas)
        {
            for (int i = 0; i < cantidadDeFechas; i++)
			{
			 ListItem nuevo = new ListItem();
             nuevo.Value= nuevo.Text = (i+1).ToString();
             ddlFechas.Items.Insert(i, nuevo);
			}
            ddlFechas.DataBind();
           
        }


        protected void repiter_fechas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
              
                Repeater repiter_partidos = (Repeater)e.Item.FindControl("repiter_partidos");
                repiter_partidos.DataSource = ((Fecha)e.Item.DataItem).partidos;
                repiter_partidos.DataBind();

            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Campeonato c = (Campeonato)Session["campeonato"];
                c.fixture = (List<Fecha>)Session["Fechas"];
                DAOFixture daoFixture = new DAOFixture();
                daoFixture.registrarFixtureParaUnCampeonato(c);
                DAOCampeonato daoCampeonato = new DAOCampeonato();
               daoCampeonato.cambiarEstadoDelCampeonato(new Estado() {idEstado =2},c.idCampeonato);
                litExito.Text = "El Fixture se registró con éxito!";
                panelExito.Visible = true;
                btnAceptar.Enabled = false;
                btnCancelar.Enabled = false;
                btnVolverAGenerar.Enabled = false;

            }
            catch (Exception ex) //mostramos el error
            {
                litError.Text = ex.Message;
                panelFracaso.Visible = true;
            }
        }

        protected void btnVolverAGenerar_Click(object sender, EventArgs e)
        {
            int idCampeonato = ((Campeonato)Session["campeonato"]).idCampeonato;
            GestorFixture gestor = new GestorFixture();
            DAOCampeonato daoCampeonato = new DAOCampeonato();
            Session["fechas"] = gestor.generarFixtureTodosContraTodos(daoCampeonato.obtenerEquiposDeUnCampeonato(idCampeonato), ((Campeonato)Session["campeonato"]).idTipoFixture);
            repiter_fechas.DataSource = (List<Fecha>)Session["fechas"];
            repiter_fechas.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["Fechas"] = null;
            Response.Redirect("Campeonatos.aspx");
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

        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri + "#Fecha" + ddlFechas.SelectedValue.ToString());
        }
    }
}