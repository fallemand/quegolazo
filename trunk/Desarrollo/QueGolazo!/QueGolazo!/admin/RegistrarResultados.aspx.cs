using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using AccesoADatos;
using Entidades;

namespace QueGolazo_.admin
{
    public partial class RegistrarResultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarFechas();
                ddlFechas.Focus();
            }
        }

        private void cargarFechas()
        {
            DAOFixture gestor = new DAOFixture();
            ((Campeonato)Session["campeonato"]).fixture = gestor.obtenerFixtureDeUnCampeonato(((Campeonato)Session["campeonato"]).idCampeonato);
            ddlFechas.DataSource = ((Campeonato)Session["campeonato"]).fixture ;
            ddlFechas.DataValueField = "numeroDeFecha";
            ddlFechas.DataTextField = "numeroDeFecha";
            ddlFechas.DataBind();


            Fecha fecha = buscarFecha(Int32.Parse(ddlFechas.SelectedValue));
            repiter_partidos.DataSource = fecha.partidos;
            repiter_partidos.DataBind();
        }

        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Fecha fecha= buscarFecha(Int32.Parse(ddlFechas.SelectedValue));
            repiter_partidos.DataSource = fecha.partidos;
            repiter_partidos.DataBind();
        }

        private Fecha buscarFecha(Int32 nroFecha)
        {
            Fecha fecha= new Fecha();
            foreach (Fecha f in ((Campeonato)Session["campeonato"]).fixture)
            {
                if (f.numeroDeFecha == nroFecha)
                {
                    fecha = f;
                    break;
                }
            }
            return fecha;
        
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in repiter_partidos.Items)
	        {
                try
                {
                    
                    int idCampeonato = ((Campeonato)Session["campeonato"]).idCampeonato;
                    int idFecha = int.Parse(ddlFechas.SelectedValue);
                    string valor = ((Label)item.FindControl("idPartido")).Text;
                    int idPartido = (int)Session["idPartidoActual"];
                    Partido partidoParaActualizar = obtenerPartido(idPartido, idFecha, idCampeonato);
                    partidoParaActualizar.golesLocal = int.Parse(((Label)item.FindControl("txtGolesLocal")).Text);
                    partidoParaActualizar.golesVisitante = int.Parse(((Label)item.FindControl("txtGolesVisitante")).Text);
                   DAOEstado daoestado = new DAOEstado();
                   partidoParaActualizar.estado = daoestado.obtenerUnEstadoPorNombreYAmbito(Estado.enumAmbito.PARTIDO.ToString(), Estado.enumNombre.JUGADO.ToString());
                   DAOPartido daoPartido = new DAOPartido();
                   daoPartido.actualizarUnPartido(partidoParaActualizar);
                }
                catch (Exception)
                {
                    
                }
		
           
            }
           
        }

        private Partido obtenerPartido(long idPartido, int idFecha, int idCampeonato)
        {
            Partido respuesta = null;
            List<Fecha> fechas = ((Campeonato)Session["campeonato"]).fixture;
            bool encontro = false;
            foreach (Fecha fecha in fechas)
            {
                foreach (Partido partido in fecha.partidos)
                {
                    if (partido.idPartido == idPartido && partido.idCampeonato == idCampeonato && partido.idFecha == idFecha)
                        respuesta = partido;
                        encontro = true;
                    break;
                }
                if (encontro)
                    break;
            }
            return respuesta;
        }


        

    }
}