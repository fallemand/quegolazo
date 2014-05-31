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
    public class DAOPartido
    {
        private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings[System.Environment.MachineName].ConnectionString;
      
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
                DAOEquipo daoEquipo = new DAOEquipo();
                while (dr.Read())
                {
                    Partido partidoParaAgregar = extraerPartidoDelDataReader(dr);
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
        /// Obtiene un objeto partido de una fila del datareader
        /// </summary>
        /// <param name="dr">El objeto DataReader que se esta usando para leer la BD</param>
        /// <returns>Un objeto Partido</returns>
        private Partido extraerPartidoDelDataReader(SqlDataReader dr)
        {
            Partido respuesta = new Partido();
            DAOEstado daoEstado = new DAOEstado();
            respuesta.estado = daoEstado.obtenerUnEstadoPorId(int.Parse(dr["idEstado"].ToString()));
            respuesta.equipoLocal = obtenerEquipoDelDataReader(dr["idEquipoLocal"]);
            respuesta.equipoVisitante = obtenerEquipoDelDataReader(dr["idEquipoVisitante"]);
            if (respuesta.estado.nombre != Estado.enumNombre.NO_JUGADO)
            {//si el partido se jugó tendrá valores en estos campos
                respuesta.golesLocal = int.Parse(dr["golesLocal"].ToString());
                respuesta.golesVisitante = int.Parse(dr["golesLocal"].ToString());
            }
            respuesta.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
            respuesta.idFecha = int.Parse(dr["idFecha"].ToString());

            return respuesta;
        }

        /// <summary>
        /// obtiene un equipo en base al registro leido en el datareader
        /// </summary>
        /// <param name="registroDelDataReader">una columna con un valor obtenida del datareader</param>
        /// <returns>Un objeto Equipo</returns>
        private Equipo obtenerEquipoDelDataReader(object registroDelDataReader)
        {
            Equipo respuesta = null;
            DAOEquipo daoEquipo = new DAOEquipo();
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
        ///  Graba en la base de datos de los partidos correspondientes a una fecha de un campeonato registrado
        /// </summary>
        /// <param name="fechaDeUnCampeoanto">La fecha que contiene los partidos que se desea grabar</param>
        /// <param name="idCampeonato">El id del campeonato al que pertenece la fecha</param>
        /// <param name="con">El objeto SqlConnection del metodo padre (siempre la registracion de un partido es parte de una transaccion)</param>
        /// <param name="cmd">El objeto SqlCommand que viene del metodo padre (siempre la registracion de un partido es parte de una transaccion)</param>
        public void registrarPartidosDeUnaFecha(Fecha fechaDeUnCampeoanto, int idCampeonato, ref SqlConnection con, ref SqlCommand cmd)
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
        /// Actualiza un registro de la tabla Partidos a partir de un objeto tipo Partido
        /// </summary>
        /// <param name="partido">EL objeto partido que representa el registro de la base de datos que queremos modificar.</param>
        public void actualizarUnPartido(Partido partido)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            OperacionesAccesoADatos.conectar(con, cmd);
            try
            {               
                    string sql = @"UPDATE Partidos 
                                   SET golesLocal = @golesLocal, golesVisitante = @golesVisitante, idEstado = @idEstado, idEquipoLocal = @idEquipoLocal, idEquipoVisitante =@idEquipoVisitante
                                   WHERE idPartido =@idPartido and idCampeonato =@idCampeonato and idFecha= @idFecha";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@idPartido", partido.idPartido);
                    cmd.Parameters.AddWithValue("@idFecha", partido.idFecha);
                    cmd.Parameters.AddWithValue("@idEstado", partido.estado.idEstado);
                    cmd.Parameters.AddWithValue("@idCampeonato", partido.idCampeonato);
                    cmd.Parameters.AddWithValue("@golesLocal", partido.golesLocal);
                    cmd.Parameters.AddWithValue("@golesVisitante", partido.golesVisitante);
                    cmd.Parameters.AddWithValue("@idEquipoLocal", partido.equipoLocal.idEquipo);
                    cmd.Parameters.AddWithValue("@idEquipoVisitante", partido.equipoVisitante.idEquipo);
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
            
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudieron actualizar los datos: " + ex.Message);
            }

        }



    }
}
