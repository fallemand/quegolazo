using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using Utils;

namespace AccesoADatos
{
    public class DAOFixture
    {
        private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings[System.Environment.MachineName].ConnectionString;
      
        /// <summary>
        /// Graba en la base de datos los partidos correspondientes a un fixture generado para un campeonato
        /// </summary>
        /// <param name="campeonatoConFixtureConfirmado">Un objeto Campeonato que tiene el fixture generado previamente.</param>
        public void registrarFixtureParaUnCampeonato(Campeonato campeonatoConFixtureConfirmado)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trans = null;

            try
            {

                OperacionesAccesoADatos.conectar(con, cmd);
                trans = con.BeginTransaction();
                cmd.Transaction = trans;
                foreach (Fecha fechaDeUnCampeoanto in campeonatoConFixtureConfirmado.fixture)
                {
                    registrarFechaDeUnCampeonato(fechaDeUnCampeoanto, campeonatoConFixtureConfirmado.idCampeonato, ref con, ref cmd);
                    registrarPartidosDeUnaFecha(fechaDeUnCampeoanto, campeonatoConFixtureConfirmado.idCampeonato, ref con, ref cmd);
                }
                trans.Commit();
            }
            catch (Exception ex)
            {
                trans.Rollback();
                throw new Exception("No se pudo registrar el campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }


        /// <summary>
        ///  Graba en la base de datos una fecha correspondiente a un campeonato registrado
        /// </summary>
        /// <param name="fechaDeUnCampeoanto">La fecha que se desea grabar</param>
        /// <param name="con">El objeto SqlConnection que viene del metodo regitrarFixtureParaUnCampeonato</param>
        /// <param name="cmd">El objeto SqlCommand que viene del metodo registrarFixtureParaUnCampeonato</param>
        private void registrarFechaDeUnCampeonato(Fecha fechaDeUnCampeoanto, int idCampeonato, ref SqlConnection conexion, ref SqlCommand cmd)
        {

            try
            {

                string sql = @"INSERT INTO Fechas (idFecha,idCampeonato, nombre) 
                                            VALUES (@idFecha,@idCampeonato,@nombre)";

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idFecha", fechaDeUnCampeoanto.numeroDeFecha);
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.Parameters.AddWithValue("@nombre", fechaDeUnCampeoanto.numeroDeFecha);
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw new Exception("No se pudo registrar la fecha del campeonato: " + ex.Message);
            }

        }

        /// <summary>
        ///  Graba en la base de datos de los partidos correspondientes a una fecha de un campeonato registrado
        /// </summary>
        /// <param name="fechaDeUnCampeoanto">La fecha que contiene los partidos que se desea grabar</param>
        /// <param name="idCampeonato">El id del campeonato al que pertenece la fecha</param>
        /// <param name="con">El objeto SqlConnection que viene del metodo regitrarFixtureParaUnCampeonato</param>
        /// <param name="cmd">El objeto SqlCommand que viene del metodo registrarFixtureParaUnCampeonato</param>
        private void registrarPartidosDeUnaFecha(Fecha fechaDeUnCampeoanto, int idCampeonato, ref SqlConnection con, ref SqlCommand cmd)
        {
            try
            {
                int numeroDePartido = 1;
                foreach (Partido partidoDeUnaFecha in fechaDeUnCampeoanto.partidos)
                {
                    string sql = @"INSERT INTO Partidos (idPartido, idFecha, idCampeonato, idEquipoLocal, idEquipoVisitante) 
                                            VALUES (@idPartido,@idFecha,@idCampeonato,@idEquipoLocal, @idEquipoVisitante)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@idPartido", numeroDePartido);
                    cmd.Parameters.AddWithValue("@idFecha", fechaDeUnCampeoanto.numeroDeFecha);
                    cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                    if (partidoDeUnaFecha.equipoLocal.nombre == "LIBRE")
                    {
                        cmd.Parameters.AddWithValue("@idEquipoLocal", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@idEquipoLocal", partidoDeUnaFecha.equipoLocal.idEquipo);
                    }
                    if (partidoDeUnaFecha.equipoVisitante.nombre == "LIBRE")
                    {
                        cmd.Parameters.AddWithValue("@idEquipoVisitante", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@idEquipoVisitante", partidoDeUnaFecha.equipoVisitante.idEquipo);
                    }
                    cmd.Parameters.AddWithValue("@idEquipoVisitante", partidoDeUnaFecha.equipoVisitante.idEquipo);
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                    numeroDePartido++;
                }

            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo registrar la fecha del campeonato: " + ex.Message);
            }

        }


        /// <summary>
        /// Devuelve el fixture de un campeonato registrado y diagramado
        /// </summary>
        /// <param name="idCampeonato">El id del campeonato registrado.</param>
        /// <returns>Una lista generica con objetos Fecha</returns>
        public List<Fecha> obtenerFixtureDeUnCampeonato(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {                
                List<Fecha> respuesta = new List<Fecha>();
                int cantidadDeFechas = obtenerCantidadDeFechasDeUnCampeonato(idCampeonato);
                for (int i = 0; i < cantidadDeFechas; i++)
                {
                    Fecha nuevaFecha = new Fecha()
                    {
                        numeroDeFecha = i + 1,
                        partidos = obtenerPartidosDeUnaFecha(idCampeonato, i + 1)
                    };
                        respuesta.Add(nuevaFecha);
                }
                return respuesta;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar los equipos del campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Obtiene todos los partidos de una fecha determinada.
        /// </summary>
        /// <param name="idCampeonato">EL id del campeonato</param>
        /// <param name="numeroDeFecha">El id de la fecha</param>
        /// <returns>Una lista generica de objetos Partido</returns>
        public List<Partido> obtenerPartidosDeUnaFecha(int idCampeonato, int numeroDeFecha)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            List<Partido> respuesta = new List<Partido>();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT idPartido, idFecha, idCampeonato, idEquipoLocal, idEquipoVisitante, golesLocal, golesVisitante, idEstado
                               FROM Partidos 
                               WHERE idCampeonato =@idCampeonato and idFecha = @numeroDeFecha";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.Parameters.AddWithValue("@numeroDeFecha", numeroDeFecha);
                cmd.CommandText = sql;
                SqlDataReader dr = cmd.ExecuteReader();
                DAOEquipos daoEquipo = new DAOEquipos();
                while (dr.Read())
                {
                    DAOEstado daoEstado = new DAOEstado();
                    Equipo local, visita;
                    local = obtenerEquipoDelDataReader(dr["idEquipoLocal"]);
                    visita = obtenerEquipoDelDataReader(dr["idEquipoVisitante"]);
                    Estado state = daoEstado.obtenerUnEstadoPorId(int.Parse(dr["idEstado"].ToString()));
                    int golLocal = 0; 
                    int golVisitante = 0; 
                    if (state.nombre != Estado.enumNombre.NO_JUGADO) {//si el partido se jugó tendrá valores en estos campos
                        golLocal = int.Parse(dr["golesLocal"].ToString());
                        golVisitante = int.Parse(dr["golesLocal"].ToString());
                    }
                    Partido partidoParaAgregar = new Partido()
                    {
                        idCampeonato = int.Parse(dr["idCampeonato"].ToString()),
                        equipoLocal = local,
                        equipoVisitante = visita,
                        idFecha = int.Parse(dr["idFecha"].ToString()),
                        golesVisitante = golVisitante,
                        golesLocal = golLocal,
                        estado = state
                    };
                    respuesta.Add(partidoParaAgregar);
                }
                return respuesta;
                }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar un estado: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// obtiene un equipo en base al registro leido en el datareader
        /// </summary>
        /// <param name="registroDelDataReader">una columnda con un valor obtenida del datareader</param>
        /// <returns>Un objeto Equipo</returns>
        private Equipo obtenerEquipoDelDataReader(object registroDelDataReader){
            Equipo respuesta = null;
            DAOEquipos daoEquipo = new DAOEquipos();
            if (registroDelDataReader != DBNull.Value)
            //si tiene un numero
            {
               respuesta = daoEquipo.obtenerUnEquipo(int.Parse(registroDelDataReader.ToString()));
            }
            else 
                respuesta = daoEquipo.obtenerUnEquipo(null);

            return respuesta;
        }

        /// <summary>
        /// Obtiene un objeto Datatable con los tipos de fixture registrados en la tabla TiposFixture
        /// </summary>
        public DataTable obtenerTiposDeFixture()
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = "SELECT idTipoFixture, nombre FROM TiposFixture ORDER BY nombre ASC";
                cmd.Parameters.Clear();
                cmd.CommandText = sql;
                dr = cmd.ExecuteReader();
                DataTable tabla = new DataTable();
                tabla.Load(dr);
                con.Close();
                return tabla;
            }
            catch (Exception ex)
            {
                throw new Exception("Ocurrió un problema al cargar los datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        
        /// <summary>
        /// Devuelve el Tipo de Fixture para un campeonato
        /// </summary>
        /// <param name="idtipoFixtureC">El id del tipo de fixture</param>
        /// <returns>Objeto TipoFixture</returns>
        public TipoFixture obtenerTipoFixturePorId(int idTipoFixtureC)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();

            try
            {
                TipoFixture tipoFixture = null;
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT *
                                FROM TiposFixture
                                WHERE idTipoFixture = @idTipoFixture";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idTipoFixture", idTipoFixtureC);
                cmd.CommandText = sql;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    tipoFixture = new TipoFixture()
                    {
                        idTipoFixture = idTipoFixtureC,
                        nombre = dr["nombre"].ToString(),
                    }
                     ;
                }
                return tipoFixture;
            }


            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar el tipo de fixture: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }


        /// <summary>
        /// Obtiene la cantidad de fechas que se generaron para un campeonato determinado
        /// </summary>
        /// <param name="idCampeonato">El id del campeonato.</param>
        /// <returns>El número de fechas que se generaron para ese campeonato</returns>
        public int obtenerCantidadDeFechasDeUnCampeonato(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                //Obtengo la cantidad de fechas que se diagramaron para este campeonato
                string sql = @"SELECT max(idFecha)
                               FROM Partidos
                               WHERE idCampeonato = @idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.CommandText = sql;
                return (int)cmd.ExecuteScalar();
            }
            catch (InvalidCastException ex)
            {//si la consulta no devuelve filas entonces el valor es cero
                return 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar datos del campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

    }
}
