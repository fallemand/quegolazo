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
        /// autor: Flor
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
        /// autor: Flor
        /// </summary>
        protected void repiter_campeonatos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
            DAOCampeonato gestor = new DAOCampeonato();
            Campeonato c = gestor.buscarCampeonatoPorId(Convert.ToInt32(e.CommandArgument));
            Session["campeonato"] = c;
            if (e.CommandName == "GenerarFixture" && e.CommandArgument != "")
            {
                

                if (c.equipos.Count() < 3)
                {
                    string script = @"<script type='text/javascript'> alert('No se puede generar fixture ya que el campeonato tiene menos de 3 equipos registrados');</script>";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                }
                else
                {
                   
                    
                    GestorFixture gestorFixture = new GestorFixture();
                    List<Fecha> fechas = gestorFixture.generarFixtureTodosContraTodos(c.equipos, c.idTipoFixture);
                    Session["fechas"] = fechas;
                    Response.Redirect("Fixture.aspx");
                }

            }
            if (e.CommandName == "VerFixture" && e.CommandArgument != "")
            {
                Session["idCampeonato"] = Convert.ToInt32(e.CommandArgument);
                
                Response.Redirect("ConsultaFixture.aspx");
            }
            if (e.CommandName == "CargarResultados" && e.CommandArgument != "")
            {
                
                Response.Redirect("RegistrarResultados.aspx");
            }

        }



        /// <summary>
        /// Deshabilita el botón generar fixture en campeonatos ya diagramados
        /// autor: Flor
        /// </summary>
        protected void repiter_campeonatos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Button btnGenerarFixture = (Button)e.Item.FindControl("btnGenerarFixture");
                Button btnVerFixture = (Button)e.Item.FindControl("btnVerFixture");
                Button btnCargarResultados = (Button)e.Item.FindControl("btnCargarResultados");

                if (((Campeonato)e.Item.DataItem).idEstado == 2)//2=Diagramado
                {
                    btnGenerarFixture.Visible = false;
                    btnVerFixture.Visible = true;
                    btnCargarResultados.Visible = true;
                    
                }
                else
                
                {
                    btnGenerarFixture.Visible = true;
                    btnVerFixture.Visible = false;
                    btnCargarResultados.Visible = false;
                }

            }
        }
    }
}
