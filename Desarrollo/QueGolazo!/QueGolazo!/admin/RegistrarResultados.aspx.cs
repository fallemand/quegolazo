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
            // Le seteamos el nombre del campeonato
            lblNombreCampeonato.Text = ((Campeonato)Session["campeonato"]).nombre.ToString();
            ddlFechas.DataSource = ((Campeonato)Session["campeonato"]).fixture ;
            //ddlFechas.DataSource = gestor.obtenerFechasIncompletas(((Campeonato)Session["campeonato"]).idCampeonato);
            ddlFechas.DataValueField = "numeroDeFecha";
            ddlFechas.DataTextField = "numeroDeFecha";
            ddlFechas.DataBind();

            ddlFechas.SelectedValue = ultimaFechaIncompleta().ToString();

         
            Fecha fecha = buscarFecha(Int32.Parse(ddlFechas.SelectedValue));
            repiter_partidos.DataSource = fecha.partidos;
            repiter_partidos.DataBind();
        }

        protected void ddlFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Fecha fecha= buscarFecha(Int32.Parse(ddlFechas.SelectedValue));
            repiter_partidos.DataSource = fecha.partidos;
            repiter_partidos.DataBind();
            ocultarPaneles();
        }

        public int ultimaFechaIncompleta()
        {
          DAOFixture daoFixture = new DAOFixture();
          int idCampeonato = ((Campeonato)Session["campeonato"]).idCampeonato;
          List<Fecha> listaFechasIncompletas = daoFixture.obtenerFechasIncompletas(idCampeonato);
          int i = 0;
          int mayor = 0;

          foreach (Fecha f in listaFechasIncompletas)
          {
              if (i == 0)
              {
                  mayor = f.numeroDeFecha;
                  i++;
              }
              else
              {
                  
                  if (f.numeroDeFecha > mayor)
                      mayor = f.numeroDeFecha;
              }

          }

          return mayor;

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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            panelFracaso.Visible = false;
            panelExito.Visible = false;
            bool guardoAlguno = false;
            bool resultadoIncompleto = false;
            bool resultadoNegativo = false;
            bool hayPartidoLibre = false;
            int cantidadDePartidosJugados = 0;
            int cantidadDeItems = 0;
            int idCampeonato = ((Campeonato)Session["campeonato"]).idCampeonato;
            int idFecha = int.Parse(ddlFechas.SelectedValue);
            try
            {
                foreach (RepeaterItem item in repiter_partidos.Items)
                {
                    cantidadDeItems++;                    
                    int idPartido = int.Parse(((Label)item.FindControl("idPartido")).Text);
                    Partido partidoParaActualizar = obtenerPartido(idPartido, idFecha, idCampeonato);
                    string valorGolesLocal = ((TextBox)item.FindControl("txtGolesLocal")).Text;
                    string valorGolesVisita = ((TextBox)item.FindControl("txtGolesVisitante")).Text;

                    //validamos que no sea fecha libre y tambien que no tenga algun campo vacio en el resultado
                    if (partidoParaActualizar.equipoLocal.nombre != "LIBRE" && partidoParaActualizar.equipoVisitante.nombre != "LIBRE" && valorGolesLocal != "" && valorGolesVisita != "")
                    {
                        partidoParaActualizar.golesLocal = int.Parse(valorGolesLocal);
                        partidoParaActualizar.golesVisitante = int.Parse(valorGolesVisita);
                        if (partidoParaActualizar.golesLocal >= 0 && partidoParaActualizar.golesVisitante >= 0)
                        {
                            DAOEstado daoestado = new DAOEstado();
                            Estado nuevoEstado = daoestado.obtenerUnEstadoPorNombreYAmbito(Estado.enumNombre.JUGADO, Estado.enumAmbito.PARTIDO);
                            partidoParaActualizar.estado = nuevoEstado;
                            DAOPartido daoPartido = new DAOPartido();
                            daoPartido.actualizarUnPartido(partidoParaActualizar);
                            guardoAlguno = true;
                            cantidadDePartidosJugados++;
                        }
                        else
                        {
                            resultadoNegativo = true;
                            litError.Text = "No se pueden guardar resulados negativos. Verifique e intente nuevamente.";
                            panelExito.Visible = false;
                            panelFracaso.Visible = true;
                            break;
                        }
                    }
                    //verificamos el caso en que llene un txt y otro no
                    else
                    {
                        if (partidoParaActualizar.equipoLocal.nombre != "LIBRE" && partidoParaActualizar.equipoVisitante.nombre != "LIBRE")
                        {
                            if ((valorGolesLocal == "" && valorGolesVisita != "") || (valorGolesLocal != "" && valorGolesVisita == ""))
                            {
                                resultadoIncompleto = true;
                                litError.Text = "Quedó un resultado incompleto. Verifique e intente nuevamente.";
                                panelExito.Visible = false;
                                panelFracaso.Visible = true;
                                break;
                            }
                        }
                        else
                            hayPartidoLibre = true;
                        

                    }


                }

                if (guardoAlguno && !resultadoIncompleto && !resultadoNegativo)
                {
                    litExito.Text = "Se registraron con éxito los resultados!";
                    panelFracaso.Visible = false;
                    panelExito.Visible = true;
                }

                DAOFixture daoFixture = new DAOFixture();
                
                //pregunta si hay partido libre
                if (hayPartidoLibre)
                {
                    //se jugaron todos los partidos de la fecha, la fecha está Completa
                    if (cantidadDePartidosJugados == (cantidadDeItems - 1))
                      daoFixture.actualizarFecha(idFecha, idCampeonato, 1);
                    else
                      daoFixture.actualizarFecha(idFecha, idCampeonato, 0);
                    
                }
                else
                {
                    if (cantidadDePartidosJugados == cantidadDeItems)
                        daoFixture.actualizarFecha(idFecha, idCampeonato, 1);
                    else
                        daoFixture.actualizarFecha(idFecha, idCampeonato, 0);
 
                }
                               
                               

            }
            catch (FormatException ex)
            {
                litError.Text = "Ha ingresado valores incorrectos en los resultados. Verifique e intente nuevamente.";
                panelFracaso.Visible = true;
            }
            catch (Exception ex)
            {
                litError.Text = ex.Message;
                panelFracaso.Visible = true;
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
                    {
                        respuesta = partido;
                        encontro = true;
                        break;
                    }
                }
                if (encontro)
                    break;
            }
            return respuesta;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Campeonatos.aspx");
        }

        protected void repiter_partidos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string nombreLocal = ((Partido)e.Item.DataItem).equipoLocal.nombre;
                string nombreVisitante = ((Partido)e.Item.DataItem).equipoVisitante.nombre;

                if (nombreLocal == "LIBRE" || nombreVisitante == "LIBRE")
                {
                    TextBox golesLocal = (TextBox)e.Item.FindControl("txtGolesLocal");
                    golesLocal.Enabled = false;
                    TextBox golesVisita = (TextBox)e.Item.FindControl("txtGolesVisitante");
                    golesVisita.Enabled = false;
                }

            }
           
        }


        

    }
}