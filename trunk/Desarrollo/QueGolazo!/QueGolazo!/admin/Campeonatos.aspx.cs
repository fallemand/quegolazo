using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;
using Utils;
using AccesoADatos;

namespace QueGolazo_
{
    public partial class Campeonatos : System.Web.UI.Page
    {
        /// <summary>
        /// Se carga la página
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)//true: primera vez que se carga la página
            {
                DAOCampeonato gestor = new DAOCampeonato();
                repiter_campeonatos.DataSource = gestor.obtenerTodos();
                repiter_campeonatos.DataBind();
            }
        }


        /// <summary>
        /// Método para llamar al método generar fixture
        /// </summary>
        protected void repiter_campeonatos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DAOCampeonato gestor = new DAOCampeonato();
            if (e.CommandName == "GenerarFixture" && e.CommandArgument != "")
            {
                Campeonato c = gestor.buscarCampeonatoPorId(Convert.ToInt32(e.CommandArgument));
                if (c.equipos.Count() < 3)
                {
                    string script = @"<script type='text/javascript'> alert('No se puede generar fixture ya que el campeonato tiene menos de 3 equipos registrados');</script>";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                }
                else
                {
                    //c.fixture  = GestorCampeonatos.generarFixtureTodosContraTodos(c.equipos, c.idTipoFixture);
                    //TextBox txtCantidad = (TextBox)e.Item.FindControl("txtCantidad");
                    Session["campeonato"] = c;
                    GestorFixture gestorFixture = new GestorFixture();
                    List<Fecha> fechas = gestorFixture.generarFixtureTodosContraTodos(c.equipos, c.idTipoFixture);
                    Session["fechas"] = fechas;
                    Response.Redirect("Fixture.aspx");
                }

            }
        }

        /// <summary>
        /// Deshabilita el botón generar fixture en campeonatos ya diagramados
        /// </summary>
        protected void repiter_campeonatos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Button btnGenerarFixture = (Button)e.Item.FindControl("btnGenerarFixture");

                if (((Campeonato)e.Item.DataItem).idEstado == 2)//2=Diagramado
                {
                    btnGenerarFixture.Enabled = false;
                }
               

            }
        }
    }
}