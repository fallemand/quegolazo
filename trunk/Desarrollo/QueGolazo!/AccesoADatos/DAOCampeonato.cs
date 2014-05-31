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
   public class DAOCampeonato
    {

       private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings[System.Environment.MachineName].ConnectionString;

       public DAOCampeonato()
       {

       }

        /// <summary>
        /// Inserta un nuevo registro en la tabla Campeonatos.
        /// </summary>
        /// <param name="campeonatoNuevo">EL objeto Campeonato que se quiere grabar en la base de datos.</param>
        public void registrarCampeonato(Campeonato campeonatoNuevo)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"INSERT INTO Campeonatos (nombre,descripcion,urlLogo,idTamañoCancha,idSuperficieDeCancha, cantidadMaximaJugadores, idTipoFixture, idEstado) 
                                            VALUES (@nombre,@descripcion,@urlLogo,@idTamañoCancha, @idSuperficieDeCancha, @cantidadMaximaJugadores, @idTipoFixture, @idEstado)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nombre", campeonatoNuevo.nombre);
                cmd.Parameters.AddWithValue("@descripcion", campeonatoNuevo.descripcion);
                cmd.Parameters.AddWithValue("@urlLogo", campeonatoNuevo.urlLogo);
                cmd.Parameters.AddWithValue("@idTamañoCancha", campeonatoNuevo.idTamañoCancha);
                cmd.Parameters.AddWithValue("@idSuperficieDeCancha", campeonatoNuevo.idSuperficieDeCancha);
                cmd.Parameters.AddWithValue("@cantidadMaximaJugadores", campeonatoNuevo.cantidaMaximaJugadores);
                cmd.Parameters.AddWithValue("@idEstado", campeonatoNuevo.idEstado);
                cmd.Parameters.AddWithValue("@idTipoFixture", campeonatoNuevo.idTipoFixture);

                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo registrar el campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Cambia el estado del campeonato a uno nuevo.
        /// </summary>
        /// <param name="estadoNuevo">Un objeto estado para asignar</param>
        /// <param name="idCampeonato">EL id del campeonato al cual se le desea cambiar el estado</param>
        public void cambiarEstadoDelCampeonato(Estado estadoNuevo, int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"UPDATE Campeonatos 
                                  SET  idEstado = @idEstado
                                  WHERE idCampeonato = @idCampeonato ";
                cmd.Parameters.Clear();

                cmd.Parameters.AddWithValue("@idEstado", estadoNuevo.idEstado);
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);

                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cambiar el estado del campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Busca un campeonato con un nombre determinado en la base de datos.
        /// </summary>
        /// <param name="nombreDelNuevoCampeonato">Nombre del campeonato que se quiere encontrar</param>
        /// <returns>Un objeto Campeonato con el nombre, o null si no encuentra el campeonato.</returns>
        public Campeonato buscarCampeonatoPorNombre(string nombreDelCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            Campeonato respuesta = null;
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT idCampeonato
                                FROM Campeonatos
                                WHERE nombre = @nombre";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nombre", nombreDelCampeonato);
                cmd.CommandText = sql;

                int idCampeonato = int.Parse(cmd.ExecuteScalar().ToString());
                respuesta = buscarCampeonatoPorId(idCampeonato);

            }
            catch (NullReferenceException)
            {
                return respuesta;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar el campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return respuesta;

        }

        /// <summary>
        /// Busca un Campeonato con un Id determinado en la base de datos.
        /// </summary>
        /// <param name="idCampeonato"> Id del Cameponato que se quiere buscar </param>
        /// <returns>Un objeto Campeonato, o null si no encuentra el campeonato.</returns>
        public Campeonato buscarCampeonatoPorId(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();


            Campeonato respuesta = null;
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);

                string sql = @"SELECT idCampeonato, nombre, urlLogo, idTamañoCancha, descripcion, idSuperficieDeCancha,cantidadMaximaJugadores , idEstado, idTipoFixture
                                FROM Campeonatos
                                WHERE idCampeonato = @idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.CommandText = sql;
                SqlDataReader dr = cmd.ExecuteReader();                
                //inicializamos los gestores para obtener datos de la BD
                DAOTamañosDeCancha gestorTamañosCancha = new DAOTamañosDeCancha();
                DAOSuperficies gestorDeSuperficies = new DAOSuperficies();
                DAOFixture gestorFixtures = new DAOFixture();

                while (dr.Read())
                {
                    respuesta = new Campeonato()
                    {
                        idCampeonato = int.Parse(dr["idCampeonato"].ToString()),
                        idTamañoCancha = int.Parse(dr["idTamañoCancha"].ToString()),
                        idSuperficieDeCancha = int.Parse(dr["idSuperficieDeCancha"].ToString()),
                        nombre = dr["nombre"].ToString(),
                        urlLogo = dr["urlLogo"].ToString(),
                        descripcion = dr["descripcion"].ToString(),
                        idEstado = int.Parse(dr["idEstado"].ToString()),
                        idTipoFixture = int.Parse(dr["idTipoFixture"].ToString()),
                        cantidaMaximaJugadores = int.Parse(dr["cantidadMaximaJugadores"].ToString()),
                        equipos = obtenerEquiposDeUnCampeonato(idCampeonato),
                        tamañoCancha = gestorTamañosCancha.obtenerTamañoPorId(int.Parse(dr["idTamañoCancha"].ToString())),
                        superficieDeCancha = gestorDeSuperficies.buscarSuperficiePorId(int.Parse(dr["idSuperficieDeCancha"].ToString())),
                        tipoFixture = gestorFixtures.obtenerTipoFixturePorId(int.Parse(dr["idTipoFixture"].ToString())),

                    };
                }
                return respuesta;
            }
            catch (Exception ex)
            {

                throw new Exception("Error al intentar recuperar el campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
                 
        /// <summary>
        /// Obtiene todos los registros de la base de datos y los materializa en objetos de tipo Campeonato
        /// </summary>
        public List<Campeonato> obtenerTodos()
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            List<Campeonato> campeonatos = new List<Campeonato>();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT * 
                             FROM Campeonatos
                             ORDER BY nombre ASC";
                cmd.Parameters.Clear();
                cmd.CommandText = sql;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    int idCampeonato = Int32.Parse(dr["idCampeonato"].ToString());
                    Campeonato c = buscarCampeonatoPorId(idCampeonato);
                    campeonatos.Add(c);
                }

                return campeonatos;
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
        /// Devuelve todos los equipos registrados para un campeonato
        /// </summary>
        /// <param name="idCampeonato">El id del campeonato donde juegan los equipos a obtener.</param>
        /// <returns>Una lista generica con objetos Equipo</returns>
        public List<Equipo> obtenerEquiposDeUnCampeonato(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            List<Equipo> respuesta = new List<Equipo>();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT idEquipo,idCampeonato, nombre, urlLogo, colorDeCamisetaPrimario, colorDeCamisetaSecundario, directorTecnico
                                FROM Equipos
                                WHERE idCampeonato = @idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.CommandText = sql;

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Equipo equipoParaAgregar = new Equipo()
                    {
                        idCampeonato = int.Parse(dr["idCampeonato"].ToString()),
                        nombre = dr["nombre"].ToString(),
                        idEquipo = int.Parse(dr["idEquipo"].ToString()),
                        urlLogo = dr["urlLogo"].ToString(),
                        colorDeCamisetaPrimario = dr["colorDeCamisetaPrimario"].ToString(),
                        colorDeCamisetaSecundario = dr["colorDeCamisetaSecundario"].ToString(),
                        directorTecnico = dr["directorTecnico"].ToString(),
                    };
                    respuesta.Add(equipoParaAgregar);
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


        public List<Campeonato> obtenerTodosSinDiagramacion()
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            List<Campeonato> campeonatos = new List<Campeonato>();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT * 
                             FROM Campeonatos c
                             INNER JOIN Estados e ON c.idEstado = e.idEstado
                             WHERE e.nombre = 'Registrado'
                             ORDER BY c.nombre ASC";
                cmd.Parameters.Clear();
                cmd.CommandText = sql;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Campeonato c = new Campeonato()
                    {
                        idCampeonato = Int32.Parse(dr["idCampeonato"].ToString()),
                        nombre = dr["nombre"].ToString(),
                        urlLogo = dr["urlLogo"].ToString(),
                        idTamañoCancha = Int32.Parse(dr["idTamañoCancha"].ToString()),
                        descripcion = dr["descripcion"].ToString(),
                        idEstado = Int32.Parse(dr["idEstado"].ToString()),
                    };

                    campeonatos.Add(c);
                }

                return campeonatos;
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

    }
}
