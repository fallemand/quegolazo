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

        }

        

    }
}