using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Entidades;
using AccesoADatos;

namespace QueGolazo_.admin
{
    public partial class ConsultaFixture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DAOFixture gestorFixture = new DAOFixture();//Se crea el gestor de fixture  
                DAOCampeonato gestorCampeonato = new DAOCampeonato(); //Se crea el gestor de campeonato
                List<Fecha> fechas = gestorFixture.obtenerFixtureDeUnCampeonato(Int32.Parse(Session["idCampeonato"].ToString()));
                Session["Fechas"] = gestorFixture.obtenerFixtureDeUnCampeonato(Int32.Parse(Session["idCampeonato"].ToString()));
                
                Campeonato campeonato = gestorCampeonato.buscarCampeonatoPorId(Int32.Parse(Session["idCampeonato"].ToString()));
                lblNombreCampeonato.Text = campeonato.nombre;

                repiter_fechas.DataSource = (List<Fecha>)Session["Fechas"];
                repiter_fechas.DataBind();
                cargarListaDeFechas(((List<Fecha>)Session["Fechas"]).Count);
            }
        }

        /// <summary>
        /// Carga los DropdownList De Fechas.
        /// autor: Flor
        /// </summary>
        private void cargarListaDeFechas(int cantidadDeFechas)
        {
            for (int i = 0; i < cantidadDeFechas; i++)
            {
                ListItem nuevo = new ListItem();
                nuevo.Value = nuevo.Text = (i + 1).ToString();
                ddlFechas.Items.Insert(i, nuevo);
            }
            ddlFechas.DataBind();

        }

        /// <summary>
        /// Carga los partidos de cada Fecha.
        /// autor: Flor
        /// </summary>
        protected void repiter_fechas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Repeater repiter_partidos = (Repeater)e.Item.FindControl("repiter_partidos");
                repiter_partidos.DataSource = ((Fecha)e.Item.DataItem).partidos;
                repiter_partidos.DataBind();

            }
        }

        /// <summary>
        /// Evento de cambio en la fecha selecccionada en el ddl.
        /// autor: Flor
        /// </summary>
        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri + "#Fecha" + ddlFechas.SelectedValue.ToString());
        }

        /// <summary>
        /// Metodo para volver a la pantalla Campeonatos
        /// autor: Flor
        /// </summary>
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Session["Fechas"] = null;
            Response.Redirect("Campeonatos.aspx");
        }
    }
}