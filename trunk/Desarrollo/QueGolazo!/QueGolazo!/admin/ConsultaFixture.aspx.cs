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
            {//Se carga el repeater de Fechas
                DAOFixture gestorFixture = new DAOFixture();
                //GestorFixture gestorFixture = new GestorFixture();
                List<Fecha> Fechas = gestorFixture.obtenerFixtureDeUnCampeonato(Int32.Parse(Session["idCampeonato"].ToString()));
                Session["Fechas"] = gestorFixture.obtenerFixtureDeUnCampeonato(Int32.Parse(Session["idCampeonato"].ToString()));
                repiter_fechas.DataSource = (List<Fecha>)Session["Fechas"];
                repiter_fechas.DataBind();
                cargarListaDeFechas(((List<Fecha>)Session["Fechas"]).Count);
            }
        }

        //Se carga el combo de fechas
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

        //se cargan los partidos de las fechas 
        protected void repiter_fechas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Repeater repiter_partidos = (Repeater)e.Item.FindControl("repiter_partidos");
                repiter_partidos.DataSource = ((Fecha)e.Item.DataItem).partidos;
                repiter_partidos.DataBind();

            }
        }

        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri + "#Fecha" + ddlFechas.SelectedValue.ToString());
        }
    }
}